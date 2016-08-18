package main.java.services;

import main.java.dao.UserDAO;
import main.java.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@EnableTransactionManagement
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDAO dao;

    public void setDao(UserDAO dao) {
        this.dao = dao;
    }

    public List<User> getAll() {
        return dao.getAll();
    }

    public PagedListHolder<User> getPageList() {
        PagedListHolder<User> holder = new PagedListHolder<User>();
        holder.setSource(dao.getAll());
        return holder;
    }

    @Transactional
    public void save(User object) {
        dao.save(object);
    }
    @Transactional
    public void remove(Integer id) {
        dao.remove(id);
    }
    @Transactional
    public void update(User object) {
        dao.update(object);
    }
    @Transactional
    public User getUserById(Integer id){
      return  dao.getUserById(id);
    }
    @Transactional
    public List<User> getUserByName(String name) throws EntityNotFoundException {
        return dao.getUserByName(name);
    }
    @Transactional
    public User getUserByAge(Integer age) throws EntityNotFoundException {
        return dao.getUserByAge(age);
    }
}
