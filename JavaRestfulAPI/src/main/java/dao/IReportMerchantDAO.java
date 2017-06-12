package dao;

import entity.ReportAgent;
import entity.ReportMaster;
import entity.ReportMerchant;

import java.util.Date;
import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public interface IReportMerchantDAO extends IGenericDAO<ReportMerchant> {
    public List<ReportMerchant> getDailyReport(int merchantID, Date date) throws Exception;

    public List<ReportMerchant> getReportFromToDate(int merchantID, Date fromDate, Date toDate) throws Exception;

}
