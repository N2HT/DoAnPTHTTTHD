package dao.Impl;


import dao.GenericDAO;
import dao.IMasterDAO;
import entity.Master;
import org.hibernate.Session;
import org.w3c.dom.Entity;
import utils.HibernateUtil;

import java.util.List;

public class MasterDaoImpl extends GenericDAO<Master> implements IMasterDAO {
    @Override
    public Master getByID(int id) throws Exception {
        return super.get(id, Master.class);
    }

    @Override
    public List<Master> getall(Class<Master> t) throws Exception {
        return super.getall(t);
    }
}
