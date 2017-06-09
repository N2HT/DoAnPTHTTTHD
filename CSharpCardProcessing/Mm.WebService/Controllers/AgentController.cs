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
    public class AgentController : ApiController
    {
        [HttpPut]
        [Route("api/agent/update")]
        //[JwtAuthentication]
        //[Authorize]
        public HttpResponseMessage Update([FromBody]Agent ag)
        {
            try
            {
                new BusinessLayer.BusinessLayer().UpdateAgent(ag);
                return Request.CreateResponse(HttpStatusCode.OK, 1);
            }
            catch (Exception e)
            {
                var json = new JavaScriptSerializer().Serialize(e);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }

        [HttpPost]
        [Route("api/agent/add")]
        //[JwtAuthentication]
        //[Authorize]
        public HttpResponseMessage Add([FromBody]Agent ag)
        {
            try
            {
                new BusinessLayer.BusinessLayer().AddAgent(ag);
                return Request.CreateResponse(HttpStatusCode.OK, 1);
            }
            catch (Exception e)
            {
                var json = new JavaScriptSerializer().Serialize(e);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }

        [HttpPut]
        [Route("api/agent/activate")]
        //[JwtAuthentication]
        //[Authorize]
        public HttpResponseMessage Activate(int id)
        {
            try
            {
                new BusinessLayer.BusinessLayer().ActivateAgent(id);
                return Request.CreateResponse(HttpStatusCode.OK, 1);
            }
            catch (Exception e)
            {
                var json = new JavaScriptSerializer().Serialize(e);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }

        [HttpPut]
        [Route("api/agent/inactivate")]
        //[JwtAuthentication]
        //[Authorize]
        public HttpResponseMessage Inactivate(int id)
        {
            try
            {
                new BusinessLayer.BusinessLayer().InactivateAgent(id);
                return Request.CreateResponse(HttpStatusCode.OK, 1);
            }
            catch (Exception e)
            {
                var json = new JavaScriptSerializer().Serialize(e);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }

        [HttpGet]
        [Route("api/agent/get")]
        //[JwtAuthentication]
        //[Authorize]
        public HttpResponseMessage Get(int id)
        {

            try
            {
                var ag = new BusinessLayer.BusinessLayer().GetAgentById(id);
                if (ag == null) return Request.CreateResponse(HttpStatusCode.NotFound, 0);
                return Request.CreateResponse(HttpStatusCode.OK, ag);
            }
            catch (Exception e)
            {
                var json = new JavaScriptSerializer().Serialize(e);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }
        }
        /// <summary>
        /// Search agent with agent name
        /// </summary>
        /// <param name="name"> Agent Name</param>
        /// <returns> List agent filter by name</returns>
        [HttpGet]
        [Route("api/agent/search")]
        /*Alow authenticate*/
        //[JwtAuthentication]
        //[Authorize]
        public HttpResponseMessage SearchAgent(string name)
        {
            try
            {
                var result = new BusinessLayer.BusinessLayer().SearchAgent(name);
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

        [HttpGet]
        [Route("api/agent/getAll")]
        public HttpResponseMessage getAllAgent()
        {
            try
            {
                var list = new BusinessLayer.BusinessLayer().GetAllAgent();
                if (list == null)
                    return Request.CreateResponse(HttpStatusCode.NotFound, 0);
                return Request.CreateResponse(HttpStatusCode.OK, list);
            }
            catch (Exception e)
            {
                var json = new JavaScriptSerializer().Serialize(e);
                return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
            }

        }
    }
}
