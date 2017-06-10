package dao.Impl;


import dao.GenericDAO;
import dao.IMasterDAO;
import entity.Master;

public class MasterDaoImpl extends GenericDAO<Master> implements IMasterDAO {
    @Override
    public Master getByID(int id) throws Exception {
        return super.get(id, Master.class);
    }

}
