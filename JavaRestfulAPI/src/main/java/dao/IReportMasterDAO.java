package dao;

import entity.ReportMaster;

import java.util.Date;
import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public interface IReportMasterDAO extends IGenericDAO<ReportMaster> {
    public List<ReportMaster> getByMasterID(int masterID) throws Exception;
    public List<ReportMaster> getDailyReport(int masterID, Date date) throws Exception;
    public List<ReportMaster> getReportFromToDate(int masterID, Date fromDate, Date toDate) throws Exception;
}
