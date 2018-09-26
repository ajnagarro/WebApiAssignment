using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NutritionData;
using NutritionData.Engines;
using NutritionData.Repositories.Interface;
using Rhino.Mocks;

namespace Nutrition.Test
{
    [TestClass]
    public class ProductEngineTest
    {
        private ProductEngine engine;

        [TestInitialize]
        public void Initialize()
        {
            List<Product> products = new List<Product>();
            products.Add(new Product() { Id = 1, ManufacturerId = 1, Name = "Kellogs Chocos" });

            IProductsRepository repo = MockRepository.GenerateMock<IProductsRepository>();
            repo.Stub(x => x.All()).Return(products);

            engine = new ProductEngine(repo);
        }

        [TestMethod]
        public void GetProduct_Sucess()
        {
            var result = engine.GetProduct("Kellogs Chocos");

            Assert.IsTrue(result.Count() == 1 && result.First().Id==1);
        }
    }
}
