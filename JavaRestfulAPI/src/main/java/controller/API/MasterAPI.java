package controller.API;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Impl.MasterService;
import com.google.gson.Gson;
import entity.Master;

import java.util.List;

@Controller
@RequestMapping(value = "/api/masters", produces = "application/json;charset=UTF-8")
public class MasterAPI {

    //    @Autowired
    public MasterService masterService = new MasterService();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity<String> list() {
        try {
            Gson gson = new Gson();

            List<Master> masters = masterService.getall();

            String jsonMasters = gson.toJson(masters);
            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
            return new ResponseEntity<String>(jsonMasters, responseHeaders, HttpStatus.OK);
//            return masters;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Master findById(@PathVariable("id") int id) {
        try {
            Master master = masterService.getById(id);
            return master;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }


}
