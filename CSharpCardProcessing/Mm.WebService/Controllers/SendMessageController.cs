using Mm.BusinessLayer.Implementation;
using Mm.BusinessLayer.Implementation.Interface;
using Mm.DomainModel;
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
    public class SendMessageController : ApiController
    {
        private IMessageBusinessLayer _businessLayer;
        public IMessageBusinessLayer BusinessLayer => _businessLayer ?? (_businessLayer = new MessageBusinessLayer());

        [HttpPost]
        [Route("api/message/send")]
        public HttpResponseMessage SendMessage([FromBody]Message mes)
        {
            try
            {
                BusinessLayer.SendMessage(mes);
                return Request.CreateResponse(HttpStatusCode.OK, 1);
            }
            catch (Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
            }
        }
        [HttpGet]
        [Route("api/message/get")]
        public HttpResponseMessage GetMessage()
        {
            try
            {
                var result = BusinessLayer.Get();
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            catch (Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
            }
        }
    }
}
