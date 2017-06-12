package dao;

import entity.ReportAgent;
import entity.ReportMaster;

import java.util.Date;
import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public interface IReportAgentDAO extends IGenericDAO<ReportAgent>  {
    public List<ReportAgent> getDailyReport(int agentID, Date date) throws Exception;

}
