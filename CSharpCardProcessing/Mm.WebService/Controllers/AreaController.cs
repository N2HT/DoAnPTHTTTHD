using Mm.BusinessLayer.Implementation;
using Mm.BusinessLayer.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Mm.WebService.Controllers
{
   
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class AreaController : ApiController
    {
        private IAreaBusinessLayer _businessLayer;
        public IAreaBusinessLayer BusinessLayer => _businessLayer ?? (_businessLayer = new AreaBusinessLayer());

        [HttpGet]
        [Route("api/area/get")]
        public HttpResponseMessage Get()
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, BusinessLayer.GetAllAgent());
            }
            catch (Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
            }
        }
    }
}
