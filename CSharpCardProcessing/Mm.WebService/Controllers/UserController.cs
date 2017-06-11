using System.Net;
using System.Net.Http;
using System.Web.Http;
using Mm.BusinessLayer;
using System.Web.Http.Cors;
using Mm.BusinessLayer.Implementation;
using Mm.BusinessLayer.Interface;
using Mm.WebService.Filters;

namespace Mm.WebService.Controllers {
    //[Authorize]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class UserController : ApiController {
        private IAccountBusinessLayer _businessLayer;
        public IAccountBusinessLayer BusinessLayer {
            get {
                if (_businessLayer == null)
                    _businessLayer = new AccountBusinessLayer();
                return _businessLayer;
            }
        }
        [HttpPost]
        [Route("api/user/login")]
        public HttpResponseMessage Login([FromBody]LoginInfo loginInfo) {
            var user = BusinessLayer.Login(loginInfo.Username, loginInfo.Password);
            if (user == null) {
                return Request.CreateResponse(HttpStatusCode.Unauthorized, new { message = "Authenticate failed!" });
            }
            return Request.CreateResponse(HttpStatusCode.OK, new {
                user = new {
                    id = user.AccountId,
                    username = user.UserName,
                    token = AuthHelper.GenerateToken(user.UserName, user.Privilege.PrivilegeName, 720)
                }
            });
        }
        [HttpGet]
        [Route("api/test")]
        [JwtAuthentication]
        [Authorize]
        public HttpResponseMessage Test() {
            return Request.CreateResponse(HttpStatusCode.OK, new { message = "Sucess" });
        }
        [HttpGet]
        [Route("api/user/get")]
        //[JwtAuthentication]
        //[Authorize]
        public HttpResponseMessage Get()
        {
            return Request.CreateResponse(HttpStatusCode.OK, BusinessLayer.Get());
        }
    }
    public class LoginInfo {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}
