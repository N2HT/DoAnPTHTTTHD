/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author THANHNHAN
 */
public class AuthCheck {

    private static final String Secret = "GQDstcKsx0NHjPOuXUIGTUYYGJHGHJBNNBNhjghj";

    public static boolean VerifyToken(String token) {
        try {
            try {
                //This line will throw an exception if it is not a signed JWS (as expected)
                Claims claims = Jwts.parser()
                        .setSigningKey(DatatypeConverter.parseBase64Binary(Secret))
                        .parseClaimsJws(token).getBody();
                String username = (String) claims.get("unique_name");
                String userrole = (String) claims.get("role");
                return !(username == null || userrole == null);
            } catch(ExpiredJwtException exp) {
                return false;
            }
        } catch (SignatureException e) {
            // Don't trust the JWT!
            return false;
        }
    }
}
