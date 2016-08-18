package main.java.dao;

import main.java.entity.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;


@Repository
public class UserDaoImpl implements UserDAO{

    @PersistenceContext
    private EntityManager manager;

    public void setManager(EntityManager manager) {
        this.manager = manager;
    }

    public EntityManager getManager() {
        return manager;
    }

    public List<User> getAll() {
        return manager.createQuery("from user", User.class).getResultList();
    }

    public void save(User object) {
        manager.persist(object);
    }

    public void remove(Integer id) {
        User user = getUserById(id);
        manager.remove(user);
    }

    public User getUserById(Integer id) {
        return manager.find(User.class, id);
    }

    public List<User> getUserByName(String name) throws EntityNotFoundException {
        List<User> source = getAll();
        List<User> result = new ArrayList<User>();
        for(User user : source){
            if(user.getName().toLowerCase().matches(".*" + name.toLowerCase() + ".*"))result.add(user);
        }
        return result;
    }

    public void update(User object) {
        manager.merge(object);
    }

    public User getUserByAge(Integer age) throws EntityNotFoundException {
        return manager.find(User.class, age);
    }
}
