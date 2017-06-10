package dao.Impl;

import dao.GenericDAO;
import dao.IMasterDAO;
import dao.IReportMasterDAO;
import entity.ReportMaster;

import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public class ReportMasterDaoImpl extends GenericDAO<ReportMaster> implements IReportMasterDAO {
    @Override
    public List<ReportMaster> getall(Class<ReportMaster> t) throws Exception {
        return super.getall(t);
    }
}
