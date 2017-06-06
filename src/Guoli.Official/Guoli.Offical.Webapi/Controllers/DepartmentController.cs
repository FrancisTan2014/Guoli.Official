using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Guoli.Offical.DataAccess;
using Guoli.Offical.Webapi.Models;
using Guoli.Official.Models;

namespace Guoli.Offical.Webapi.Controllers
{
    public class DepartmentController : ApiController
    {
        private readonly Repository<Department> _repos = new Repository<Department>();

        public ApiReturns Get()
        {
            var data = _repos.QueryAll();

            return ApiReturns.Ok(data);
        }

        public ApiReturns Post(Department department)
        {
            if (_repos.Exists(d => d.Name == department.Name))
            {
                return ApiReturns.Exists();
            }

            var success = _repos.Add(department);
            if (success)
            {
                return ApiReturns.Created(department);
            }

            return ApiReturns.BadRequest();
        }

        public ApiReturns Put(int id, Department department)
        {
            var model = _repos.QuerySingle(d => d.Id == id);
            if (model == null)
            {
                return ApiReturns.NotFound();
            }

            // 验证是否重名
            if (_repos.Exists(d => d.Name == department.Name && d.Id != id))
            {
                return ApiReturns.Exists();
            }

            model.Name = department.Name;

            var success = _repos.Update(model);
            if (success)
            {
                return ApiReturns.Created(model);
            }

            return ApiReturns.BadRequest();
        }

    }
}
