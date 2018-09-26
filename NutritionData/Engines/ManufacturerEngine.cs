using Newtonsoft.Json.Linq;
using NutritionData.Repositories.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace NutritionData.Engines
{
    public class ManufacturerEngine : IManufacturerEngine
    {
        private IManufacturersRepository manufacturersRepository;

        public ManufacturerEngine(IManufacturersRepository manufacturersRepository)
        {
            this.manufacturersRepository = manufacturersRepository;
        }

        public IEnumerable<Manufacturer> GetManufacturers(string manufacturerName = null)
        {
            if (string.IsNullOrEmpty(manufacturerName))
                return manufacturersRepository.All();
            else
                return manufacturersRepository.FindBy(x => x.Name == manufacturerName);
        }

        public int? GetProductCountForManufacturer(string manufacturerName)
        {
            Manufacturer manufacturer = manufacturersRepository.FirstOrDefault(x => x.Name == manufacturerName);
            return manufacturer?.Products.Count();
        }

        public decimal? GetStockPriceForManufacturer(string manufacturerName)
        {
            Manufacturer mf = manufacturersRepository.FirstOrDefault(x => x.Name == manufacturerName);

            if (mf != null && !string.IsNullOrEmpty(mf.StockSymbol))
                return GetStockPriceFromAlphavantageApi(mf.StockSymbol);
            else
                return null;
        }

        private decimal? GetStockPriceFromAlphavantageApi(string stockSymbol)
        {
            using (HttpClient client = new HttpClient())
            {
                string url = string.Format("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol={0}&apikey={1}", stockSymbol, "75LPOK95OWNEJJ44");
                client.BaseAddress = new Uri(url);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpResponseMessage response = client.GetAsync(url).Result;

                if (response.IsSuccessStatusCode)
                {
                    var result = response.Content.ReadAsStringAsync().Result;
                    JObject jObject = (JObject)Newtonsoft.Json.JsonConvert.DeserializeObject(result);

                    return (decimal?)jObject["Global Quote"]["05. price"];
                }
                else
                {
                    return null;
                }
            }
        }
    }
}
