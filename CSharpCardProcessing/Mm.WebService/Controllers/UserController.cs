using System.Net;
using System.Net.Http;
using System.Web.Http;
using Mm.BusinessLayer;
using System.Web.Http.Cors;
using Mm.BusinessLayer.Implementation;
using Mm.BusinessLayer.Interface;
using Mm.WebService.Filters;
using Newtonsoft.Json;

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
            if (user.Privilege == null) {
                return Request.CreateResponse(HttpStatusCode.Unauthorized, new { message = "Permission denied!" });
            }
            // Remove password
            user.Password = null;
            return Request.CreateResponse(HttpStatusCode.OK, new {
                user,
                token = AuthHelper.GenerateToken(user.UserName, user.Privilege.PrivilegeName, 720)
            });
        }
        [HttpGet]
        [Route("api/user/{id}")]
        [JwtAuthentication]
        [Authorize]
        public HttpResponseMessage GetUserById(int userID) {
            var user = BusinessLayer.GetAccountById(userID);
            if (user == null) {
                return Request.CreateResponse(HttpStatusCode.NotFound, new { message = "User not found!" });
            }
            // Remove password
            user.Password = null;
            return Request.CreateResponse(HttpStatusCode.OK, user);
        }
        [HttpPost]
        [Route("api/user/getUserFromToken")]
        [JwtAuthentication]
        [Authorize]
        public HttpResponseMessage GetUserByToken([FromBody]string token) {
            // Check token and get PAYLOAD data from token
            var auth = AuthHelper.VerifyToken(token);
            var authResults = JsonConvert.DeserializeObject<AuthHelper.AuthResult>(auth);
            if (authResults.Valid == false) {
                return Request.CreateResponse(HttpStatusCode.NotFound, new { message = "User not found!" });
            }
            var user = BusinessLayer.GetAccountByUsername(authResults.Username);
            if (user == null) {
                return Request.CreateResponse(HttpStatusCode.NotFound, new { message = "User not found!" });
            }
            // Remove password
            user.Password = null;
            return Request.CreateResponse(HttpStatusCode.OK, user);
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
