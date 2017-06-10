package controller.API;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Impl.MasterService;
import entity.Master;

import java.util.List;

@Controller
@RequestMapping("/api/masters/")
public class MasterAPI {

    @Autowired
    private MasterService masterService = new MasterService();

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody
    Master list() {
        try {
            Master master = masterService.getById(1);
            return master;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
