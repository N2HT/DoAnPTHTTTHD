package service;

import java.util.List;

public interface IGenerateService<T> {
    void create(T t) throws Exception;

    boolean update(T t) throws Exception;

    boolean delete(Long id) throws Exception;

    T get(int id) throws Exception;

    List<T> getall() throws Exception;

    List<T> getListWithHQL(String HQL) throws Exception;


}
