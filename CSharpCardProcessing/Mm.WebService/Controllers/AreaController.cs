using System;
using Mm.BusinessLayer.Interface;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Mm.BusinessLayer.Implementation;

namespace Mm.WebService.Controllers
{
   
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class AreaController : ApiController
    {
        private IAreaBusinessLayer _businessLayer;
        public IAreaBusinessLayer BusinessLayer
        {
            get
            {
                if (_businessLayer == null)
                    _businessLayer = new AreaBusinessLayer();
                return _businessLayer;
            }
        }

        [HttpGet]
        [Route("api/area/get")]
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
