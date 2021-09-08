package com.store.services.DAO;

import java.util.List;

public interface IServiceDAO<T>{

    boolean insert(T object);

    boolean update(T object);

    boolean delete(T object);

    boolean isExitsID(int id);

    T getInstanceByID(int id);

}
