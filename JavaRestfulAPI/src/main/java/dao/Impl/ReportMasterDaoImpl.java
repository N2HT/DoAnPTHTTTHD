package dao.Impl;

import dao.GenericDAO;
import dao.IMasterDAO;
import dao.IReportMasterDAO;
import entity.ReportMaster;
import org.hibernate.Query;

import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public class ReportMasterDaoImpl extends GenericDAO<ReportMaster> implements IReportMasterDAO {
    @Override
    public List<ReportMaster> getall(Class<ReportMaster> t) throws Exception {
        return super.getall(t);
    }

    @Override
    public ReportMaster get(int id, Class<ReportMaster> t) throws Exception {
        return super.get(id, t);
    }

    @Override
    public List<ReportMaster> getByMasterID(int masterID) throws Exception {

        String hql = "from Report_Master rm where rm.MasterId = " + masterID;
        return super.getByHQL(hql, ReportMaster.class);
    }
}
