package dao.Impl;

import dao.GenericDAO;
import dao.IReportMerchantDAO;
import entity.ReportMaster;
import entity.ReportMerchant;
import org.hibernate.Query;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public class ReportMerchantDaoImpl extends GenericDAO<ReportMerchant> implements IReportMerchantDAO {
    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

    @Override
    public List<ReportMerchant> getall(Class<ReportMerchant> t) throws Exception {
        return super.getall(t);
    }

    @Override
    public List<ReportMerchant> getDailyReport(int merchantID, Date date) throws Exception {
        List list = null;
        try {
            String toDate = dateFormat.format(date);
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.DATE, -1);
            String fromDate = dateFormat.format(cal.getTime());

            getSession().beginTransaction();
            Query query = getSession().createSQLQuery("sp_GetReportMerchant @merchantid = :merchantID, @fromdate = :fromDate, @todate= :toDate"
            ).addEntity(ReportMerchant.class);
            query.setParameter("merchantID", merchantID)
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
