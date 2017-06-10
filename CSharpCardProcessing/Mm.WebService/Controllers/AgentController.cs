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
	public class AgentController : ApiController
	{
		private IAgentBusinessLayer _businessLayer;
		public IAgentBusinessLayer BusinessLayer => _businessLayer ?? (_businessLayer = new AgentBusinessLayer());

		[HttpPut]
		[Route("api/agent/update")]
		//[JwtAuthentication]
		//[Authorize]
		public HttpResponseMessage Update(Agent ag)
		{
			try
			{
				BusinessLayer.UpdateAgent(ag);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
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
				BusinessLayer.AddAgent(ag);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
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
				BusinessLayer.ActivateAgent(id);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
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
				BusinessLayer.InactivateAgent(id);
				return Request.CreateResponse(HttpStatusCode.OK, 1);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
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
				var ag = BusinessLayer.GetAgentById(id);
				return ag == null ? Request.CreateResponse(HttpStatusCode.NotFound, 0) : Request.CreateResponse(HttpStatusCode.OK, ag);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
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
				var result = BusinessLayer.SearchAgent(name);
				return result == null ? Request.CreateResponse(HttpStatusCode.NotFound, 0) : Request.CreateResponse(HttpStatusCode.OK, result);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}
		}

		[HttpGet]
		[Route("api/agent/getAll")]
		//[JwtAuthentication]
		//[Authorize]
		public HttpResponseMessage GetAllAgent()
		{
			try
			{
				var list = BusinessLayer.GetAllAgent();
				return list == null ? Request.CreateResponse(HttpStatusCode.NotFound, 0) : Request.CreateResponse(HttpStatusCode.OK, list);
			}
			catch (Exception e)
			{
				return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
			}

		}
        [HttpGet]
        [Route("api/agent/getWithPaging")]
        //[JwtAuthentication]
        //[Authorize]
        public HttpResponseMessage GetAllAgentWithPaging(int limit, int upset)
        {
            try
            {
                var list = BusinessLayer.GetAllAgentWithPaging(limit, upset);
                return list == null ? Request.CreateResponse(HttpStatusCode.NotFound, 0) : Request.CreateResponse(HttpStatusCode.OK, list);
            }
            catch (Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, e);
            }

        }
    }
}
