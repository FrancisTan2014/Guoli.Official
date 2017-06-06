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
    public class BannerController : ApiController
    {
        private readonly Repository<Banner> _repos = new Repository<Banner>();

        public ApiReturns Get()
        {
            var list = _repos.QueryList(b => b.IsEffective && !b.IsDeleted, b => b.Id, true);
            return ApiReturns.Ok(list);
        }

        public ApiReturns Post(Banner banner)
        {
            var success = _repos.Add(banner);
            
            if (success)
            {
                return ApiReturns.Created(banner);
            }

            return ApiReturns.BadRequest();
        }

        public ApiReturns Put(int id, Banner banner)
        {
            if (banner == null)
            {
                return ApiReturns.BadRequest();
            }

            var model = _repos.QuerySingle(b => b.Id == id);
            if (model == null)
            {
                return ApiReturns.NotFound();
            }

            model.IsEffective = banner.IsEffective;
            model.ImgUrl = banner.ImgUrl;
            model.Link = banner.Link;

            var success = _repos.Update(model);
            if (success)
            {
                return ApiReturns.Created(model);
            }

            return ApiReturns.BadRequest();
        }

        public ApiReturns Delete(int id)
        {
            var model = _repos.QuerySingle(b => !b.IsDeleted);
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
