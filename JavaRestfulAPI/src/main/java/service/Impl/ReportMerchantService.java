package service.Impl;

import dao.Impl.ReportMerchantDaoImpl;
import entity.ReportMerchant;
import service.IReportMerchantService;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ReportMerchantService implements IReportMerchantService {
    private ReportMerchantDaoImpl reportMerchantDAO = new ReportMerchantDaoImpl();

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
        return reportMerchantDAO.getall(ReportMerchant.class);
    }

    @Override
    public List getListWithHQL(String HQL) throws Exception {
        return null;
    }
    public List getDailyReport(int merchantId, Date date) throws Exception {
        return reportMerchantDAO.getDailyReport(merchantId, date);
    }

    public List getMonthlyReport(int masterId, Date date) throws Exception {

        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date toDate = cal.getTime();

        cal.add(Calendar.MONTH, -1);
        Date fromDate = cal.getTime();

        return reportMerchantDAO.getReportFromToDate(masterId, fromDate, toDate);
    }
}
