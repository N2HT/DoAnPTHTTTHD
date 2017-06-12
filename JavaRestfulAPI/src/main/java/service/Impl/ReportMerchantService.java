package service.Impl;

import dao.Impl.ReportMerchantDaoImpl;
import entity.ReportMerchant;
import service.IReportMerchantService;

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
}
