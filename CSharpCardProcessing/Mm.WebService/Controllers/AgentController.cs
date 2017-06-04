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
		[HttpPost]
		[Route("api/agent/update")]
		[JwtAuthentication]
		[Authorize]
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
		[JwtAuthentication]
		[Authorize]
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

		[HttpPost]
		[Route("api/agent/activate")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Activate([FromBody]int id)
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

		[HttpPost]
		[Route("api/agent/inactivate")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Inactivate([FromBody]int id)
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

		[HttpPost]
		[Route("api/agent/get")]
		[JwtAuthentication]
		[Authorize]
		public HttpResponseMessage Get([FromBody]int id)
		{

			try
			{
				var ag = new BusinessLayer.BusinessLayer().GetAgentById(id);
				if (ag == null) return Request.CreateResponse(HttpStatusCode.NotFound, 0);
				var json = new JavaScriptSerializer().Serialize(ag);
				return Request.CreateResponse(HttpStatusCode.OK, json);
			}
			catch (Exception e)
			{
				var json = new JavaScriptSerializer().Serialize(e);
				return Request.CreateResponse(HttpStatusCode.InternalServerError, json);
			}
		}
	}
}
