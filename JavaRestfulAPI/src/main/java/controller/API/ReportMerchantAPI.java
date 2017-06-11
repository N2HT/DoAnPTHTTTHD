package controller.API;

import com.google.gson.Gson;
import entity.ReportMerchant;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.Impl.ReportMerchantService;

import java.util.List;

@Controller
@RequestMapping(value = "/api/report-merchant", produces = "application/json;charset=UTF-8")
public class ReportMerchantAPI {
    private ReportMerchantService reportMerchantService = new ReportMerchantService();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity<String> list() {
        try {
            Gson gson = new Gson();
            List<ReportMerchant> reports = reportMerchantService.getall();
            String jsonReportMerchants = gson.toJson(reports);

            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.APPLICATION_JSON_UTF8);
            return new ResponseEntity<String>(jsonReportMerchants, responseHeaders, HttpStatus.OK);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return new ResponseEntity<String>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
