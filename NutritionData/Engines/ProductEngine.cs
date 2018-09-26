using NutritionData.Repositories.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NutritionData.Engines
{
    public class ProductEngine : IProductEngine
    {
        private IProductsRepository productsRepository;

        public ProductEngine(IProductsRepository productsRepository)
        {
            this.productsRepository = productsRepository;
        }
        // GET api/values
        public IEnumerable<Product> GetProduct(string name = null, int? minimumRating = null, int? minimumFiberContent = null, int? minimumProteinContent = null)
        {
            var allProducts = productsRepository.All().AsQueryable();

            var query = allProducts.Where(x => true);
            if (!string.IsNullOrEmpty(name))
                query = query.Where(x => x.Name == name);

            if (minimumRating != null)
                query = query.Where(x => x.Rating == minimumRating);

            if (minimumFiberContent != null)
                query = query.Where(x => x.Fiber == minimumFiberContent);

            if (minimumProteinContent != null)
                query = query.Where(x => x.Protein == minimumProteinContent);

            return query.ToList();
        }
    }
}
