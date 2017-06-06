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
    public class JobTypeController : ApiController
    {
        private readonly Repository<JobType> _repos = new Repository<JobType>(); 

        public ApiReturns Get()
        {
            var data = _repos.QueryAll();

            return ApiReturns.Ok(data);
        }

        public ApiReturns Post(JobType jobType)
        {
            var success = _repos.Add(jobType);
            if (success)
            {
                return ApiReturns.Created(jobType);
            }

            return ApiReturns.BadRequest();
        }
    }
}
