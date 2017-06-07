using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Mm.BusinessLayer;
using Mm.DomainModel;
using System.Web.Http.Cors;
using Newtonsoft.Json;
using Mm.WebService.Filters;

namespace Mm.WebService.Controllers
{
    //[Authorize]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UserController : ApiController
    {
        [HttpPost]
        [Route("api/user/login")]
        public HttpResponseMessage login([FromBody]LoginInfo loginInfo) {
            var user = new BusinessLayer.BusinessLayer().Login(loginInfo.Username, loginInfo.Password);
            if (user == null) {
                return Request.CreateResponse(HttpStatusCode.Unauthorized, new {message = "Authenticate failed"});
            }
            return Request.CreateResponse(HttpStatusCode.OK, new {
                user = new {
                    id = user.AccountId,
                    username = user.UserName,
                    token = "Bearer " + AuthHelper.GenerateToken(user.UserName, "master", 30)
                }
            });
        }
        [HttpGet]
        [Route("api/test")]
        [JwtAuthentication]
        [Authorize]
        public HttpResponseMessage test() {
            return Request.CreateResponse(HttpStatusCode.OK, new { message = "Sucess" });
        }
    }
    public class LoginInfo
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
