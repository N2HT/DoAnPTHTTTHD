package dao.Impl;

import dao.GenericDAO;
import dao.IReportMerchantDAO;
import entity.ReportMerchant;

import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public class ReportMerchantDaoImpl extends GenericDAO<ReportMerchant> implements IReportMerchantDAO {
    @Override
    public List<ReportMerchant> getall(Class<ReportMerchant> t) throws Exception {
        return super.getall(t);
    }
}
