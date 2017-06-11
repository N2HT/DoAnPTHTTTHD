using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Mm.BusinessLayer.Implementation;
using Mm.BusinessLayer.Interface;
using Mm.DomainModel;
using Mm.WebService.Filters;

namespace Mm.WebService.Controllers
{
	[EnableCors(origins: "*", headers: "*", methods: "*")]
	public class MerchantController : ApiController
	{
		private IMerchantBusinessLayer _businessLayer;
        public IMerchantBusinessLayer BusinessLayer {
            get {
                if (_businessLayer == null)
                    _businessLayer = new MerchantBusinessLayer();
                return _businessLayer;
            }
        }

		[HttpPut]
		[Route("api/merchant/update")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Update([FromBody]Merchant mt)
		{
			try
			{
				BusinessLayer.UpdateMerchant(mt);
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
				BusinessLayer.AddMerchant(mt);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}

		[HttpPut]
		[Route("api/merchant/activate")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Activate(int id)
		{
			try
			{
				BusinessLayer.ActivateMerchant(id);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}

		[HttpPut]
		[Route("api/merchant/inactivate")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Inactivate(int id)
		{
			try
			{
				BusinessLayer.InactivateMerchant(id);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}

		[HttpGet]
		[Route("api/merchant/get")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Get(int id)
		{
			try
			{
				var mc = BusinessLayer.GetMerchantById(id);
				return mc == null ? Request.CreateResponse(HttpStatusCode.NotFound, 0) : Request.CreateResponse(HttpStatusCode.OK, mc);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
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
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage SearchMerchant(string name)
		{
			try
			{
				var result = BusinessLayer.SearchMerchant(name);
				return result == null ? Request.CreateResponse(HttpStatusCode.NotFound, 0) : Request.CreateResponse(HttpStatusCode.OK, result);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}
	}
}
