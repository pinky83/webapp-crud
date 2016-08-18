package main.java.entity;

import main.java.dao.DomainObject;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Component
@Entity(name = "user")
public class User implements Serializable, DomainObject {
    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", length = 8, nullable = false)
    private Integer id;
    @Column(name = "name", length = 25)
    private String name;
    @Column(name = "age", length = 11)
    private Integer age;
    private Boolean isadmin;
    private Date createdDate;


    public User() {
    }

    public User(String name, Integer age, Boolean isadmin, Date createdDate) {
        this.name = name;
        this.age = age;
        this.isadmin = isadmin;
        this.createdDate = createdDate;
    }

    public void setId(Integer userId) {
        this.id = userId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public void setAdmin(Boolean admin) {
        isadmin = admin;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Integer getAge() {
        return age;
    }

    public Boolean getAdmin() {
        return isadmin;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", isadmin=" + isadmin +
                ", createdDate=" + createdDate +
                '}';
    }
}

