package dao.Impl;

import dao.GenericDAO;
import dao.IMasterDAO;
import dao.IReportMasterDAO;
import entity.ReportMaster;
import net.sourceforge.jtds.jdbc.DateTime;
import org.hibernate.Query;

import java.sql.CallableStatement;
import java.sql.SQLDataException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ReportMasterDaoImpl extends GenericDAO<ReportMaster> implements IReportMasterDAO {
    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

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

        String hql = "from ReportMaster where masterId = " + masterID;
        return super.getByHQL(hql, ReportMaster.class);
    }

    @Override
    public List<ReportMaster> getDailyReport(int masterID, Date date) throws Exception {
        List list = null;
        try {
            String toDate = dateFormat.format(date);
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.DATE, -1);
            String fromDate = dateFormat.format(cal.getTime());

            getSession().beginTransaction();
            Query query = getSession().createSQLQuery("sp_GetReportMaster @masterid = :masterID, @fromdate = :fromDate, @todate= :toDate"
            ).addEntity(ReportMaster.class);
            query.setParameter("masterID", masterID)
                    .setParameter("fromDate", fromDate)
                    .setParameter("toDate", toDate);

            list = query.list();
            getSession().getTransaction().commit();

        } catch (Exception ex) {
            if (ex.getMessage().equals("could not extract ResultSet")) {
                return null;
            }
            throw ex;
        }
        return list;
    }

    @Override
    public List<ReportMaster> getReportFromToDate(int masterID, Date fromDate, Date toDate) throws Exception {
        List list = null;
        try {
            String strToDate = dateFormat.format(toDate);

            String strFromDate = dateFormat.format(fromDate);

            getSession().beginTransaction();
            Query query = getSession().createSQLQuery("sp_GetReportMaster @masterid = :masterID, @fromdate = :fromDate, @todate= :toDate"
            ).addEntity(ReportMaster.class);
            query.setParameter("masterID", masterID)
                    .setParameter("fromDate", strFromDate)
                    .setParameter("toDate", strToDate);

            list = query.list();
            getSession().getTransaction().commit();

        } catch (Exception ex) {
            if (ex.getMessage().equals("could not extract ResultSet")) {
                return null;
            }
            throw ex;
        }
        return list;
    }
}
