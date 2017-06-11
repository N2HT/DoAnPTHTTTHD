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
    public ReportMaster get(int id) throws Exception {
        return reportMasterDAO.get(id, ReportMaster.class);
    }

    @Override
    public List getall() throws Exception {
        return reportMasterDAO.getall(ReportMaster.class);
    }

    @Override
    public List getListWithHQL(String HQL) throws Exception {
        return reportMasterDAO.getByHQL(HQL, ReportMaster.class);
    }

    public List getByMasterID(int masterId) throws Exception {
        return reportMasterDAO.getByMasterID(masterId);
    }
}
