package main.java.dao;

import main.java.entity.User;

import javax.persistence.EntityNotFoundException;
import java.util.List;

public interface UserDAO extends GenericDAO<User>{
    public List<User> getUserByName(String name)throws EntityNotFoundException;
    public User getUserByAge(Integer age) throws EntityNotFoundException;
}
