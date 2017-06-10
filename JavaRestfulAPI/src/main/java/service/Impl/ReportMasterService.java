package service.Impl;

import dao.IReportMasterDAO;
import dao.Impl.ReportMasterDaoImpl;
import entity.ReportMaster;
import service.IReportMasterService;

import java.util.List;

public class ReportMasterService implements IReportMasterService {
    private ReportMasterDaoImpl reportMasterDAO = new ReportMasterDaoImpl();

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
    public Object get(Long id) throws Exception {
        return null;
    }

    @Override
    public List getall() throws Exception {
        return reportMasterDAO.getall(ReportMaster.class);
    }
}
