using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Guoli.Offical.DataAccess;
using Guoli.Offical.Webapi.Models;
using Guoli.Offical.Webapi.Utils;
using Guoli.Official.Models;
using Guoli.Utilities;

namespace Guoli.Offical.Webapi.Controllers
{
    public class LoginController : ApiController
    {
        readonly Repository<SystemUser> _repos = new Repository<SystemUser>();

        [AllowAnonymous]
        public ApiReturns Post()
        {
            var r = HttpContext.Current.Request;
            var username = r["username"];
            var password = r["password"];

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                return ApiReturns.Unauthorized();
            }

            var e = password.GetMd5();
            var user = _repos.QuerySingle(u => u.Username == username && u.Password == e);
            if (user != null)
            {
                var token = LoginHelper.GenerateToken(user.Id, user.Password);

                user.Password = ""; // 防止密码流向客户端
                return ApiReturns.Ok(new { User = user, Token = token });
            }

            return ApiReturns.Unauthorized();
        }
    }
}
