/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.API;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author THANHNHAN
 */
@RestController
@RequestMapping(value = "/api")
public class UserControllerAPI {
    @RequestMapping(value = "/token", method = RequestMethod.GET)
    public @ResponseBody Object token(@RequestHeader(value="Authorization") String _token) {
        Object myobj;
        myobj = new Object() {
            public boolean success = true;
            public String token = _token;
        };
        return myobj;
    }
}
