package service;

import entity.Master;

public interface IMasterService<T> extends IGenerateService<T> {
    public Master getById(int id) throws Exception;
}
