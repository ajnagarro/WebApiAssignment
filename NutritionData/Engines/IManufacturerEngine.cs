using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NutritionData.Engines
{
    public interface IManufacturerEngine
    {
        IEnumerable<Manufacturer> GetManufacturers(string manufacturerName = null);
        int? GetProductCountForManufacturer(string manufacturerName);
        decimal? GetStockPriceForManufacturer(string manufacturerName);
    }
}
