package dao.Impl;

import dao.GenericDAO;
import dao.IReportAgentDAO;
import entity.ReportAgent;

import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public class ReportAgentDaoImpl extends GenericDAO<ReportAgent> implements IReportAgentDAO {
    @Override
    public List<ReportAgent> getall(Class<ReportAgent> t) throws Exception {
        return super.getall(t);
    }

    @Override
    public List<ReportAgent> getByHQL(String hql, Class<ReportAgent> t) throws Exception {
        return super.getByHQL(hql, t);
    }
}
