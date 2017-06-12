package dao.Impl;

import dao.GenericDAO;
import dao.IReportAgentDAO;
import entity.ReportAgent;
import entity.ReportMaster;
import org.hibernate.Query;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public class ReportAgentDaoImpl extends GenericDAO<ReportAgent> implements IReportAgentDAO {
    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
    @Override
    public List<ReportAgent> getall(Class<ReportAgent> t) throws Exception {
        return super.getall(t);
    }

    @Override
    public List<ReportAgent> getByHQL(String hql, Class<ReportAgent> t) throws Exception {
        return super.getByHQL(hql, t);
    }
    @Override
    public List<ReportAgent> getDailyReport(int agentID, Date date) throws Exception {
        List list = null;
        try {
            String toDate = dateFormat.format(date);
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.DATE, -1);
            String fromDate = dateFormat.format(cal.getTime());

            getSession().beginTransaction();
            Query query = getSession().createSQLQuery("sp_GetReportAgent @agentid = :agentID, @fromdate = :fromDate, @todate= :toDate"
            ).addEntity(ReportAgent.class);
            query.setParameter("agentID", agentID)
                    .setParameter("fromDate", fromDate)
                    .setParameter("toDate", toDate);

            list = query.list();
            getSession().getTransaction().commit();

        } catch (Exception ex) {
            if(ex.getMessage().equals("could not extract ResultSet")){
                return  null;
            }
            throw ex;
        }
        return list;
    }
}
