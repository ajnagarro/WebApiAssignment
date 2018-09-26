using Newtonsoft.Json.Linq;
using NutritionData;
using NutritionData.Engines;
using NutritionData.Repositories;
using NutritionData.Repositories.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.Http;
using WebApiAssignment.Models;

namespace WebApiAssignment.Controllers
{
    [RoutePrefix("api/Manufacturers")]
    public class ManufacturersController : ApiController
    {
        private IManufacturerEngine manufacturersEngine;

        public ManufacturersController(IManufacturerEngine manufacturersEngine)
        {
            this.manufacturersEngine = manufacturersEngine;
        }

        [HttpGet]
        [Route("{name?}")]
        public IEnumerable<ManufacturerDto> Get(string name = null)
        {
            return manufacturersEngine.GetManufacturers(name)?.Select(x=> new ManufacturerDto { Id = x.Id, Name = x.Name });
        }

        [HttpGet]
        [Route("{name}/ProductCount")]
        public int? GetProductCount(string name)
        {
            return manufacturersEngine.GetProductCountForManufacturer(name);
        }

        [HttpGet]
        [Route("{name}/StockPrice")]
        public decimal? GetStockPrice(string name)
        {
            return manufacturersEngine.GetStockPriceForManufacturer(name);
        }
    }
}
