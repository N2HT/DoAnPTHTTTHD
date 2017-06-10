package dao;

import entity.Master;

public interface IMasterDAO extends IGenericDAO<Master> {

    public Master getByID(int id) throws Exception;

}
