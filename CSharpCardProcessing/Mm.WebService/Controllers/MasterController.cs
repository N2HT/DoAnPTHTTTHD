using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Script.Serialization;
using Mm.DomainModel;
using Mm.WebService.Filters;

namespace Mm.WebService.Controllers
{
	//[Authorize]
	[EnableCors(origins: "*", headers: "*", methods: "*")]
	public class MasterController : ApiController
	{
		[HttpPut]
		[Route("api/master/update")]
		//[JwtAuthentication]
		//[Authorize]
		public HttpResponseMessage Update([FromBody]Master mt)
		{
			try
			{
				new BusinessLayer.BusinessLayer().UpdateMaster(mt);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				var json = new JavaScriptSerializer().Serialize(e);
				return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
			}
		}
	}
}
