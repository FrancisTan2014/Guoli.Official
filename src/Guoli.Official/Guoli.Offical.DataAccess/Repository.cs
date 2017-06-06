using System;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Expressions;
using System.Runtime.Remoting.Messaging;
using System.Transactions;
using Guoli.Official.Models;
using System.Collections.Generic;

namespace Guoli.Offical.DataAccess
{
    public sealed class Repository<T> where T: class,new()
    {
        /// <summary>
        /// 获取当前线程内唯一的DbContext对象
        /// </summary>
        private DbContext DbContext
        {
            get
            {
                var name = "DbContext";
                //var context = CallContext.LogicalGetData(name) as DbContext;
                var context = CallContext.GetData(name) as DbContext;
                if (context == null)
                {
                    context = new OfficialEntities();
                    // 创建线程内唯一的DbContext
                    //CallContext.LogicalSetData(name, context);
                    CallContext.SetData(name, context);
                }

                return context;
            }
        }
        
        private DbSet<T> Db => DbContext.Set<T>();

        /// <summary>
        /// 向数据库中添加一个实体，成功后新添加数据的Id会被赋值给实体参数
        /// </summary>
        /// <param name="model">待添加的实体</param>
        /// <returns>表示成功与否的布尔值</returns>
        public bool Add(T model)
        {
            Db.Add(model);
            return SaveChanges();
        }

        public bool AddRange(IEnumerable<T> entities)
        {
            Db.AddRange(entities);
            return SaveChanges();
        }

        private bool _isModelUnchanged = false;

        public bool Update(T model)
        {
            Db.AddOrUpdate(model);
            _isModelUnchanged = DbContext.Entry(model).State == EntityState.Unchanged;

            return SaveChanges();
        }

        public bool Delete(T model)
        {
            Db.Remove(model);
            return SaveChanges();
        }

        public bool SaveChanges()
        {
            // 若被更新实体字段值与数据库保持一致则直接返回
            if (_isModelUnchanged)
            {
                return true;
            }

            return DbContext.SaveChanges() > 0;
        }
        
        public T QuerySingle(Expression<Func<T, bool>> predicate)
        {
            return Db.SingleOrDefault(predicate);
        }

        public IQueryable<T> QueryAll()
        {
            return Db;
        }

        public IQueryable<T> QueryList(Expression<Func<T, bool>> predicate)
        {
            return Db.Where(predicate);
        }

        public IQueryable<T> QueryList<TField>(Expression<Func<T, bool>> queryPredicate, Expression<Func<T, TField>> orderPredicate, bool isDesc = false)
        {
            var query = QueryList(queryPredicate);
            return isDesc ? query.OrderByDescending(orderPredicate) : query.OrderBy(orderPredicate);
        }

        public IQueryable<T> QueryPage<TField>(int page, int size, Expression<Func<T, bool>> queryPredicate,
            Expression<Func<T, TField>> orderPredicate, bool isDesc = false)
        {
            var query = QueryList(queryPredicate, orderPredicate, isDesc);
            var skipCount = (page - 1)*size;
            return query.Skip(skipCount).Take(size);
        }

        public long GetTotalCount(Expression<Func<T, bool>> predicate)
        {
            return Db.LongCount(predicate);
        }

        public bool Exists(Expression<Func<T, bool>> predicate)
        {

            return Db.Any(predicate);
        }

        public bool ExecuteTransaction(params Func<bool>[] delegates)
        {
            if (delegates == null || !delegates.Any())
            {
                return false;
            }

            using (var scope = new TransactionScope())
            {
                try
                {
                    var success = delegates.Aggregate(true, (current, d) => current && d());
                    if (success)
                    {
                        scope.Complete();
                    }

                    return success;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }
    }
}
