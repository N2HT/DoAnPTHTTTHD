package dao;

import entity.ReportMaster;

import java.util.List;

/**
 * Created by ntttu on 6/11/2017.
 */
public interface IReportMasterDAO extends IGenericDAO<ReportMaster> {
    public List<ReportMaster> getByMasterID(int masterID) throws Exception;
}
