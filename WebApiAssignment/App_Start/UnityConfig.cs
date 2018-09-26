using NutritionData.Engines;
using NutritionData.Repositories;
using NutritionData.Repositories.Interface;
using System.Web.Http;
using Unity;
using Unity.WebApi;

namespace WebApiAssignment
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // Register Repositories
            container.RegisterType<IManufacturersRepository, ManufacturersRepository>();
            container.RegisterType<IProductsRepository, ProductsRepository>();

            //Register Engines
            container.RegisterType<IProductEngine, ProductEngine>();
            container.RegisterType<IManufacturerEngine, ManufacturerEngine>();

            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}