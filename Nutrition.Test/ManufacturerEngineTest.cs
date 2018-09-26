using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NutritionData;
using NutritionData.Engines;
using NutritionData.Repositories.Interface;
using Rhino.Mocks;

namespace Nutrition.Test
{
    [TestClass]
    public class ManufacturerEngineTest
    {
        private ManufacturerEngine engine;

        [TestInitialize]
        public void Initialize()
        {
            List<Manufacturer> manufacturers = new List<Manufacturer>();
            manufacturers.Add(new Manufacturer() { Id = 1, Name = "Kellogs", Code = "K", Products = new List<Product>() { new Product() { Id = 1, ManufacturerId = 1, Name = "Kellogs Chocos" } } });

            IManufacturersRepository repo = MockRepository.GenerateMock<IManufacturersRepository>();
            repo.Stub(x => x.All()).Return(manufacturers);
            repo.Stub(x => x.FirstOrDefault(Arg<Expression<Func<Manufacturer, bool>>>.Is.Anything)).Return(manufacturers.First());

            engine = new ManufacturerEngine(repo);
        }

        [TestMethod]
        public void TestGetManufacturers_Success()
        {
            IEnumerable<Manufacturer> manufacturers = engine.GetManufacturers();

            Assert.IsTrue(manufacturers.Count() == 1 && manufacturers.First().Code == "K");
        }

        [TestMethod]
        public void TestGetProductCountForManufacturer_Success()
        {
            int? ProductCount = engine.GetProductCountForManufacturer("Kellogs");

            Assert.IsTrue(ProductCount == 1);
        }

    }
}
