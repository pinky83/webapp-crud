package main.java.dao;

import java.util.List;

public interface GenericDAO <T> extends DomainObject {
    public List<T> getAll();
    public T getUserById(Integer id);
    public void save(T object);
    public void remove(Integer id);
    public void update(T object);
}
