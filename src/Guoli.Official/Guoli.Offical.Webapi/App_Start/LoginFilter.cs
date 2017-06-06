using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Remoting.Messaging;
using System.Text.RegularExpressions;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using System.Web.UI.WebControls;
using Guoli.Offical.DataAccess;
using Guoli.Offical.Webapi.Models;
using Guoli.Offical.Webapi.Utils;
using Guoli.Official.Models;

namespace Guoli.Offical.Webapi
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true)]
    public sealed class LoginFilter: ActionFilterAttribute
    {
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            base.OnActionExecuting(actionContext);

            if (actionContext.ActionDescriptor.GetCustomAttributes<AllowAnonymousAttribute>().Any())
            {
                return;
            }

            if (actionContext.Request.Method.Method.ToUpper() == "GET")
            {
                return;
            }

            // 从url中获取app_token
            var token = string.Empty;
            var query = actionContext.Request.RequestUri.Query;
            if (!string.IsNullOrEmpty(query))
            {
                var match = Regex.Match(query, $@"\?.*?{Literals.AppTokenName}=([^&]+)&*");
                token = match.Groups[1].Value;
            }

            if (string.IsNullOrEmpty(token))
            {
                actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Forbidden, ApiReturns.Forbidden());
            }

            var repos = new Repository<SystemUser>();
            var leagal = LoginHelper.IsTokenLeagal(token, userId => repos.QuerySingle(u => u.Id == userId)?.Password);
            if (leagal)
            {
                CallContext.SetData(Literals.AppTokenName, token);
                return;
            }

            actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.OK,
                ApiReturns.TokenExpired());
        }
    }
}