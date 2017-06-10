package dao;

import java.util.List;

public interface IGenericDAO<T> {
    void create(T t) throws Exception;

    boolean update(T t) throws Exception;

    boolean delete(int id, Class<T> t) throws Exception;

    T get(int id, Class<T> t) throws Exception;

    List<T> getall(Class<T> t) throws Exception;
}
