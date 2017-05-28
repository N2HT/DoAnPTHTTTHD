using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Mm.DomainModel;
using Mm.WebService.Filters;

namespace Mm.WebService.Controllers
{
	[EnableCors(origins: "*", headers: "*", methods: "*")]
	public class MerchantController : ApiController
	{
		[HttpPost]
		[Route("api/merchant/update")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Update([FromBody]Merchant mt)
		{
			try
			{
				new BusinessLayer.BusinessLayer().UpdateMerchant(mt);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}

		[HttpPost]
		[Route("api/merchant/add")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Add([FromBody]Merchant mt)
		{
			try
			{
				new BusinessLayer.BusinessLayer().AddMerchant(mt);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}

		[HttpPost]
		[Route("api/merchant/activate")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Activate([FromBody]int id)
		{
			try
			{
				new BusinessLayer.BusinessLayer().ActivateMerchant(id);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}

		[HttpPost]
		[Route("api/merchant/inactivate")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Inactivate([FromBody]int id)
		{
			try
			{
				new BusinessLayer.BusinessLayer().InactivateMerchant(id);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}
	}
}
