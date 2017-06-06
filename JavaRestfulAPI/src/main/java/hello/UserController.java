/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hello;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author THANHNHAN
 */
@RestController
public class UserController {

    //@RequestMapping("POST", "/user")
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public Object getUsers(@RequestParam(value = "name", defaultValue = "World") String _name) {
        Object myobj;
        myobj = new Object() {
            public boolean success = true;
            public String name = _name;
        };
        return myobj;
    }
}
