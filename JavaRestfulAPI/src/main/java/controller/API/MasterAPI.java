package controller.API;

import com.google.gson.GsonBuilder;
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
import utils.HibernateProxyTypeAdapter;

import java.util.List;

@Controller
@RequestMapping(value = "/api/masters", produces = "application/json;charset=UTF-8")
public class MasterAPI {

    //    @Autowired
    public MasterService masterService = new MasterService();

    //http://localhost:8080/api/masters
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ResponseEntity<String> list() {
        try {
            GsonBuilder b = new GsonBuilder();
            b.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
//            Gson gson = b.create();
            Gson gson = new Gson();
            List<Master> masters = masterService.getall();
            String jsonMasters = "";

            for (Master master :
                    masters) {

                jsonMasters += gson.toJson(master);
            }
//            String jsonMasters = gson.toJson(masters);
            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
            return new ResponseEntity<String>(jsonMasters, responseHeaders, HttpStatus.OK);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return new ResponseEntity<String>("Error", HttpStatus.INTERNAL_SERVER_ERROR);

    }

    //run: http://localhost:8080/api/masters/1
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<String> findById(@PathVariable("id") int id) {
        try {
            Gson gson = new Gson();
            Master master = masterService.getById(id);
            String jsonMaster = gson.toJson(master);

            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
            return new ResponseEntity<String>(jsonMaster, responseHeaders, HttpStatus.OK);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return new ResponseEntity<String>("Error", HttpStatus.INTERNAL_SERVER_ERROR);

    }


}
