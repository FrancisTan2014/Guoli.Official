using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using Guoli.Offical.Webapi.Models;

namespace Guoli.Offical.Webapi.App_Start
{
    [AttributeUsage(AttributeTargets.Class|AttributeTargets.Method, AllowMultiple = true)]
    public class ModelStateFilter: ActionFilterAttribute
    {
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            base.OnActionExecuting(actionContext);

            if (!actionContext.ModelState.IsValid)
            {
                actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.OK, ApiReturns.BadRequest());
            }
        }
    }
}