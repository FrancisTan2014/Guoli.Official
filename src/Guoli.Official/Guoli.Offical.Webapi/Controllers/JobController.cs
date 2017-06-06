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
    public class JobController : ApiController
    {
        private readonly Repository<Job> _repos = new Repository<Job>();

        public ApiReturns Get()
        {
            var data = _repos.QueryAll();

            return ApiReturns.Ok(data);
        }

        public ApiReturns Post(Job job)
        {
            var success = _repos.Add(job);
            if (success)
            {
                return ApiReturns.Created(job);
            }

            return ApiReturns.BadRequest();
        }

        public ApiReturns Put(int id, Job job)
        {
            var model = _repos.QuerySingle(j => j.Id == id && !j.IsDeleted);
            if (model == null)
            {
                return ApiReturns.NotFound();
            }

            model.DepartmentId = job.DepartmentId;
            model.AsumePosts = job.AsumePosts;
            model.HiringNumber = job.HiringNumber;
            model.JobTypeId = job.JobTypeId;
            model.Preference = job.Preference;
            model.Requirements = job.Requirements;
            model.Responsibilities = job.Responsibilities;
            model.WorkingPlace = job.WorkingPlace;

            var success = _repos.Update(model);
            if (success)
            {
                return ApiReturns.Created(model);
            }

            return ApiReturns.BadRequest();
        }

        public ApiReturns Delete(int id)
        {
            var model = _repos.QuerySingle(j => j.Id == id && !j.IsDeleted);
            if (model == null)
            {
                return ApiReturns.NotFound();
            }

            model.IsDeleted = true;

            var success = _repos.Update(model);
            if (success)
            {
                return ApiReturns.NoContent();
            }

            return ApiReturns.BadRequest();
        }
    }
}
