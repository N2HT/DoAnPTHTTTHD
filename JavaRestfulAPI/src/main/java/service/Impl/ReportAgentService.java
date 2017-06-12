package service.Impl;

import dao.Impl.ReportAgentDaoImpl;
import entity.ReportAgent;
import service.IReportAgentService;
import service.IReportAgentService;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ReportAgentService implements IReportAgentService {
    private ReportAgentDaoImpl reportAgentDAO = new ReportAgentDaoImpl();

    @Override
    public void create(Object o) throws Exception {

    }

    @Override
    public boolean update(Object o) throws Exception {
        return false;
    }

    @Override
    public boolean delete(Long id) throws Exception {
        return false;
    }

    @Override
    public Object get(int id) throws Exception {
        return null;
    }

    @Override
    public List getall() throws Exception {
        return reportAgentDAO.getall(ReportAgent.class);
    }

    @Override
    public List getListWithHQL(String HQL) throws Exception {
        return null;
    }

    public List getDailyReport(int agentID, Date date) throws Exception {
        return reportAgentDAO.getDailyReport(agentID, date);
    }

    public List getMonthlyReport(int masterId, Date date) throws Exception {

        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date toDate = cal.getTime();

        cal.add(Calendar.MONTH, -1);
        Date fromDate = cal.getTime();

        return reportAgentDAO.getReportFromToDate(masterId, fromDate, toDate);
    }
}

