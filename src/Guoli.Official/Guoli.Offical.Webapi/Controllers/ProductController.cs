using System.Collections;
using System.Collections.Generic;
using System.Web.Http;
using Guoli.Offical.DataAccess;
using Guoli.Offical.Webapi.Models;
using Guoli.Official.Models;
using System.Linq;

namespace Guoli.Offical.Webapi.Controllers
{
    public class ProductController : ApiController
    {
        private readonly Repository<Product> _proRepos = new Repository<Product>();
        private readonly Repository<ProductImage> _imgRepos = new Repository<ProductImage>();
        
        public ApiReturns Get(PagingParams param)
        {
            var list = _proRepos.QueryPage(param.page, param.size, p => !p.IsDeleted, p => p.Id, true);

            return ApiReturns.Ok(list);
        }

        public ApiReturns Post(Product product, List<ProductImage> images)
        {
            var success = _proRepos.ExecuteTransaction(() =>
            {
                var s = _proRepos.Add(product);
                if (s)
                {
                    images.ForEach(i => i.ProductId = product.Id);
                    return _imgRepos.AddRange(images);
                }

                return false;
            });

            return success ? ApiReturns.BadRequest() : ApiReturns.Created(new { product, images });
        }
        
    }
}
