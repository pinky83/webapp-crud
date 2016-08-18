package main.java.controllers;

import main.java.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator{
    public boolean supports(Class aClass) {
        return User.class.isAssignableFrom(aClass);
    }

    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.name", "User's name is required!");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required.id", "User's ID is required!");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "required.age", "User's age is required!");

        User user = (User)target;
        String name = user.getName();
        Integer id = user.getId();
        Integer age = user.getAge();

        if(id != null && name != null && age != null) {
            if (id <= 0) errors.reject("wrong.id", "ID's must be positive numbers!");
            if (!name.matches("^\\p{L}+(?: \\p{L}+)*$")) errors.reject("invalid.name", "Invalid name format!");
            if(age<=0||age>100) errors.reject("wrong.age", "User's age must be in 1 - 100 range!");
        }
    }
}
