using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http.Filters;
using Mm.BusinessLayer;
using Newtonsoft.Json;

namespace Mm.WebService.Filters
{
    public class JwtAuthenticationAttribute : Attribute, IAuthenticationFilter
    {
        public string Realm { get; set; }

        public async Task AuthenticateAsync(HttpAuthenticationContext context, CancellationToken cancellationToken)
        {
            var request = context.Request;
            var authorization = request.Headers.Authorization;

            if (authorization == null || authorization.Scheme != "Bearer") {
                context.ErrorResult = new AuthenticationFailureResult("Token not set or Invalid", request);
                return;
            }

            if (string.IsNullOrEmpty(authorization.Parameter))
            {
                context.ErrorResult = new AuthenticationFailureResult("Missing Jwt Token", request);
                return;
            }

            var token = authorization.Parameter;
            var principal = await AuthenticateJwtToken(token);

            if (principal == null)
                context.ErrorResult = new AuthenticationFailureResult("Invalid token", request);

            else
                context.Principal = principal;
        }

        protected Task<IPrincipal> AuthenticateJwtToken(string token)
        {
            var auth = AuthHelper.VerifyToken(token);
            var authResults = JsonConvert.DeserializeObject<AuthHelper.AuthResult>(auth);

            if (authResults.Valid)
            {
                // based on username to get more information from database in order to build local identity
                var identity = new ClaimsIdentity(AuthHelper.GetPrincipal(token).Claims, "Jwt");
                IPrincipal principal = new ClaimsPrincipal(identity);

                return Task.FromResult(principal);
            }

            return Task.FromResult<IPrincipal>(null);
        }

        public Task ChallengeAsync(HttpAuthenticationChallengeContext context, CancellationToken cancellationToken)
        {
            Challenge(context);
            return Task.FromResult(0);
        }

        private void Challenge(HttpAuthenticationChallengeContext context)
        {
            string parameter = null;

            if (!string.IsNullOrEmpty(Realm))
                parameter = "realm=\"" + Realm + "\"";

            context.ChallengeWith("Bearer", parameter);
        }

        public Task<System.Net.Http.HttpResponseMessage> ExecuteActionFilterAsync(System.Web.Http.Controllers.HttpActionContext actionContext, CancellationToken cancellationToken, Func<Task<System.Net.Http.HttpResponseMessage>> continuation) {
            throw new NotImplementedException();
        }

        bool IFilter.AllowMultiple {
            get { return false; }
        }
    }
}
