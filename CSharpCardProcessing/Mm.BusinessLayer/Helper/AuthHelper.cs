using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;

/**
 * Refs:
 * https://techmaster.vn/posts/33959/khai-niem-ve-json-web-token
 * https://stackoverflow.com/questions/40281050/jwt-authentication-for-asp-net-web-api
 * https://www.nuget.org/packages/System.IdentityModel.Tokens.Jwt/4.0.4.403061554
 * https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/authentication-filters#setting-an-authentication-filter
 * https://jwt.io/
 */
namespace Mm.BusinessLayer {
    public class AuthHelper {
        private static string Secret = "GQDstcKsx0NHjPOuXUIGTUYYGJHGHJBNNBNhjghj";
        public static string GenerateToken(string username, string role, int expireMinutes = 20) {
            var symmetricKey = Convert.FromBase64String(Secret);
            var tokenHandler = new JwtSecurityTokenHandler();

            var now = DateTime.UtcNow;
            var tokenDescriptor = new SecurityTokenDescriptor {
                Subject = new ClaimsIdentity(new[]
                    {
                        new Claim(ClaimTypes.Name, username),
                        new Claim(ClaimTypes.Role, role)
                    }),

                Expires = now.AddMinutes(Convert.ToInt32(expireMinutes)),

                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(symmetricKey), SecurityAlgorithms.HmacSha256Signature)
            };

            var stoken = tokenHandler.CreateToken(tokenDescriptor);
            var token = tokenHandler.WriteToken(stoken);

            return token;
        }
        public static string VerifyToken(string token) {
            string username = null, userrole = null, reason = Reason.AuthSucceed;
            bool valid = true;

            var simplePrinciple = AuthHelper.GetPrincipal(token);
            if (simplePrinciple == null) {
                reason = Reason.InvalidFormat;
                valid = false;
                return JsonConvert.SerializeObject(new {
                    valid,
                    reason,
                    username,
                    userrole
                });
            }
            var identity = simplePrinciple.Identity as ClaimsIdentity;

            if (identity == null) {
                reason = Reason.Expired;
                valid = false;
                return JsonConvert.SerializeObject(new {
                    valid,
                    reason,
                    username,
                    userrole
                });
            }

            if (!identity.IsAuthenticated) {
                reason = Reason.AuthFailed;
                valid = false;
                return JsonConvert.SerializeObject(new {
                    valid,
                    reason,
                    username,
                    userrole
                });
            }

            var usernameClaim = identity.FindFirst(ClaimTypes.Name);
            var userRoleClaim = identity.FindFirst(ClaimTypes.Role);
            username = usernameClaim.Value;
            userrole = userRoleClaim.Value;

            if (string.IsNullOrEmpty(username)) {
                reason = Reason.ClaimNotEnough;
                valid = false;
                return JsonConvert.SerializeObject(new {
                    valid,
                    reason,
                    username,
                    userrole
                });
            }
            if (string.IsNullOrEmpty(userrole)) {
                reason = Reason.ClaimNotEnough;
                valid = false;
                return JsonConvert.SerializeObject(new {
                    valid,
                    reason,
                    username,
                    userrole
                });
            }    

            // More validate to check whether username exists in system

            return JsonConvert.SerializeObject(new {
                valid,
                reason,
                username,
                userrole
            });
        }
        public static ClaimsPrincipal GetPrincipal(string token) {
            try {
                var tokenHandler = new JwtSecurityTokenHandler();
                var jwtToken = tokenHandler.ReadToken(token) as JwtSecurityToken;

                if (jwtToken == null)
                    return null;

                var symmetricKey = Convert.FromBase64String(Secret);

                var validationParameters = new TokenValidationParameters() {
                    RequireExpirationTime = true,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    IssuerSigningKey = new SymmetricSecurityKey(symmetricKey)
                };

                SecurityToken securityToken;
                var principal = tokenHandler.ValidateToken(token, validationParameters, out securityToken);

                return principal;
            } catch (Exception) {
                // should write log
                return null;
            }
        }

        public class Reason {
            public static string Expired = "expired";
            public static string InvalidFormat = "invalidformat";
            public static string AuthFailed = "authfailed";
            public static string ClaimNotEnough = "claimnotenough";
            public static string AuthSucceed = "authsucceed";
        }

        public class AuthResult {
            public bool Valid { get; set; }
            public string Reason { get; set; }
            public string Username { get; set; }
            public string Userrole { get; set; }
        }
    }
}
