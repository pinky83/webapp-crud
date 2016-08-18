package main.java.services;

import main.java.entity.User;
import org.springframework.beans.support.PagedListHolder;

import javax.persistence.EntityNotFoundException;
import java.util.List;

public interface UserService {
    public List<User> getAll();
    public PagedListHolder<User> getPageList();
    public void save(User object);
    public void remove(Integer id);
    public void update(User object);
    public User getUserById(Integer id);
    public List<User> getUserByName(String name)throws EntityNotFoundException;
    public User getUserByAge(Integer age) throws EntityNotFoundException;
}
