using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NutritionData.Engines
{
    public interface IProductEngine
    {
        IEnumerable<Product> GetProduct(string name = null, int? minimumRating = null, int? minimumFiberContent = null, int? minimumProteinContent = null);
    }
}
