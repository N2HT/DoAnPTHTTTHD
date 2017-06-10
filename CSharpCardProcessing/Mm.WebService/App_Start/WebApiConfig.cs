using System.Net.Http.Headers;
using System.Web.Http;
using Newtonsoft.Json;

namespace Mm.WebService
{
	public static class WebApiConfig
	{
		public static void Register(HttpConfiguration config)
		{
			// Web API configuration and services
			config.EnableCors();
			// Web API routes
			config.MapHttpAttributeRoutes();
			// https://stackoverflow.com/questions/21916870/net-web-api-2-authorize-attribute
			// Authentication attribute for all routes
			// config.Filters.Add(new JwtAuthenticationAttribute());

			config.Routes.MapHttpRoute(
				name: "DefaultApi",
				routeTemplate: "api/{controller}/{id}",
				defaults: new { id = RouteParameter.Optional }
			);
			// Return json type
			config.Formatters.JsonFormatter.SupportedMediaTypes
				.Add(new MediaTypeHeaderValue("text/html"));
			config.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
		}
	}
}
