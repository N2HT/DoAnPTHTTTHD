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
				var json = new JavaScriptSerializer().Serialize(e);
				return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
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
				var json = new JavaScriptSerializer().Serialize(e);
				return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
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
				var json = new JavaScriptSerializer().Serialize(e);
				return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
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
				var json = new JavaScriptSerializer().Serialize(e);
				return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
			}
		}

		[HttpPost]
		[Route("api/merchant/get")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Get([FromBody]int id)
		{
			
			try
			{
				var mc = new BusinessLayer.BusinessLayer().GetMerchantById(id);
				if (mc == null) return Request.CreateResponse(HttpStatusCode.NotFound, 0);
				var json = new JavaScriptSerializer().Serialize(mc);
				return Request.CreateResponse(HttpStatusCode.OK, json);
			}
			catch (Exception e)
			{
				var json = new JavaScriptSerializer().Serialize(e);
				return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
			}
		}

        /// <summary>
        /// Search merchant with merchant name
        /// </summary>
        /// <param name="name"> Merchant Name</param>
        /// <returns> List merchant filter by name</returns>
        [HttpGet]
        [Route("api/merchant/search")]
        /*Alow authenticate*/
        //[JwtAuthentication]
        //[Authorize]
        public HttpResponseMessage SearchMerchant(string name)
        {
            try
            {
                var result = new BusinessLayer.BusinessLayer().SearchMerchant(name);
                if (result == null)
                    return Request.CreateResponse(HttpStatusCode.NotFound, 0);
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception e)
            {
                var json = new JavaScriptSerializer().Serialize(e);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }
    }
}
