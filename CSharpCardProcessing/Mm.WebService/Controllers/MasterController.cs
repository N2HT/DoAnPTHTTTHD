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
	public class MasterController : ApiController
	{
		private IMasterBusinessLayer _businessLayer;
        public IMasterBusinessLayer BusinessLayer {
            get {
                if (_businessLayer == null)
                    _businessLayer = new MasterBusinessLayer();
                return _businessLayer;
            }
        }
		[HttpPut]
		[Route("api/master/update")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Update([FromBody]Master mt)
		{
			try
			{
				BusinessLayer.UpdateMaster(mt);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}
        [HttpGet]
        [Route("api/master/get")]
        public HttpResponseMessage Get()
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, BusinessLayer.Get());
            }
            catch (Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
            }
        }
    }
}
