using NutritionData.Repositories.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NutritionData.Repositories
{
    public class ProductsRepository : Repository<Product>, IProductsRepository
    {
    }
}
