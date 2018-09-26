using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using NutritionData;
using NutritionData.Engines;
using NutritionData.Repositories.Interface;
using WebApiAssignment.Models;

namespace WebApiAssignment.Controllers
{
    [RoutePrefix("api/Products")]
    public class ProductsController : ApiController
    {
        private IProductEngine productEngine;

        public ProductsController(IProductEngine productEngine)
        {
            this.productEngine = productEngine;
        }

        public IEnumerable<ProductDto> Get(string name = null, int? minimumRating = null, int? minimumFiberContent = null, int? minimumProteinContent = null)
        {
            return productEngine.GetProduct(name, minimumRating, minimumFiberContent, minimumProteinContent).Select(x=> new ProductDto { Id = x.Id, Name = x.Name });
        }
    }
}
