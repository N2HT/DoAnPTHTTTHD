using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Mm.DomainModel;
using Mm.WebService.Filters;

namespace Mm.WebService.Controllers
{
	//[Authorize]
	[EnableCors(origins: "*", headers: "*", methods: "*")]
	public class MasterController : ApiController
	{
		[HttpPost]
		[Route("api/master/update")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Update([FromBody]Master mt)
		{
			try
			{
				new BusinessLayer.BusinessLayer().UpdateMaster(mt);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}
	}
}
