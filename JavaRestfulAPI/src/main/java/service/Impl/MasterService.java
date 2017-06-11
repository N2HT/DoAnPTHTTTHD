package service.Impl;

import dao.Impl.MasterDaoImpl;
import entity.Master;
import service.IMasterService;

import java.util.List;

public class MasterService implements IMasterService {

    private MasterDaoImpl masterDao = new MasterDaoImpl();
    @Override
    public Master getById(int id) throws Exception {
        return masterDao.getByID(id);
    }

    @Override
    public void create(Object o) throws Exception {

    }

    @Override
    public boolean update(Object o) throws Exception {
        return false;
    }

    @Override
    public boolean delete(Long id) throws Exception {
        return false;
    }

    @Override
    public Object get(int id) throws Exception {
        return null;
    }

    @Override
    public List getall() throws Exception {
        return masterDao.getall(Master.class);
    }

    @Override
    public List getListWithHQL(String HQL) throws Exception {
        return null;
    }
}
