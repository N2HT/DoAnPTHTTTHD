package controller.API;

import com.google.gson.Gson;
import entity.Master;
import entity.ReportMaster;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.Impl.ReportMasterService;

import java.util.List;

@Controller
@RequestMapping(value = "/api/report-master", produces = "application/json;charset=UTF-8")
public class ReportMasterAPI {
    private ReportMasterService reportMasterService = new ReportMasterService();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity<String> list() {
        try {
            Gson gson = new Gson();
            List<ReportMaster> reports = reportMasterService.getall();
            String jsonReportMasters = gson.toJson(reports);

            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
            return new ResponseEntity<String>(jsonReportMasters, responseHeaders, HttpStatus.OK);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return new ResponseEntity<String>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<String> findById(@PathVariable("id") int id) {
        try {
            Gson gson = new Gson();
            ReportMaster reportMaster = reportMasterService.get(id);
            String jsonMaster = gson.toJson(reportMaster);

            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
            return new ResponseEntity<String>(jsonMaster, responseHeaders, HttpStatus.OK);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return new ResponseEntity<String>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @RequestMapping(value = "/master/{id}", method = RequestMethod.GET)
    public ResponseEntity<String> findByMasterId(@PathVariable("id") int id) {
        try {
            Gson gson = new Gson();
            List<ReportMaster> reportMasters = reportMasterService.getByMasterID(id);
            String jsonMaster = gson.toJson(reportMasters);

            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
            return new ResponseEntity<String>(jsonMaster, responseHeaders, HttpStatus.OK);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return new ResponseEntity<String>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}