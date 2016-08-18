package main.java.controllers;

import main.java.entity.User;
import main.java.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import java.util.List;

@Controller
public class UserController {

    private UserService service;
    private UserValidator validator;

    @Autowired
    public UserController(@Qualifier("userServiceImpl") UserService service, UserValidator validator) {
        this.service = service;
        this.validator = validator;
    }

    @Autowired
    @Qualifier(value="UserService")
    public void setService(UserService service) {
        this.service = service;
    }

    @RequestMapping("/")
    public String home(ModelMap map) {
        return "redirect:/users/";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listUsers(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.service.getPageList());
        return "user";
    }

    @RequestMapping(value= "/user/search/")
    public String searchUser(@ModelAttribute("name") String searchName, Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", new PagedListHolder<User>(service.getUserByName(searchName)));
        return "user";
    }

    @RequestMapping(value= "/user/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User u, Model model, BindingResult result, SessionStatus status){
        validator.validate(u, result);
        if(result.hasErrors()){
            model.addAttribute("user", u);
            return "user";
        }
        else {
            int page = 0;
            PagedListHolder<User> listHolder = this.service.getPageList();
            List<User> created = this.service.getAll();
            for (User present : created) {
                if (present.getId().equals(u.getId())) {
                    if (u.getAdmin() == null) u.setAdmin(false);
                    this.service.update(u);
                    for (int i = 0; i < listHolder.getPageCount(); i++) {
                        listHolder.setPage(i);
                        for (User user : listHolder.getPageList()) {
                            if (user.getId().equals(u.getId())) {
                                page = i;
                                break;
                            }
                        }
                    }
                    page++;
                    return "redirect:/page/" + page;
                }
            }
            //new user, add it
            if (u.getAdmin() == null) u.setAdmin(false);
            this.service.save(u);
            return "redirect:/page/" + listHolder.getPageCount();
        }
    }

    @RequestMapping(value = "/page/{pages}", method=RequestMethod.GET)
    public String toPage(@PathVariable("pages") String pages, Model model){
        PagedListHolder<User> listHolder = this.service.getPageList();
        int page;
        if(pages.matches("[0-9+]")){
            page = Integer.parseInt(pages);
            listHolder.setPage(page-1);
        }
        else if (pages.equals("first")) listHolder.setPage(0);
        else if (pages.equals("last")) listHolder.setPage(listHolder.getPageCount()-1);
        else if (pages.matches("p[0-9+]")) {
            page = Integer.parseInt(pages.replace("p", ""));
            listHolder.setPage(page);
            listHolder.previousPage();
        }
        else if (pages.matches("n[0-9+]")) {
            page = Integer.parseInt(pages.replace("n", ""));
            listHolder.setPage(page);
            listHolder.nextPage();
        }
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", listHolder);
        return "user";
    }

    @RequestMapping(value = "/remove/{id}", method=RequestMethod.GET)
    public String removeUser(@PathVariable("id") int id){
        this.service.remove(id);
        return "redirect:/users/";
    }

    @RequestMapping("/edit/{pages}")
    public String editUser(@PathVariable("pages") String pages, Model model){
        int id = Integer.parseInt(pages.split("p")[1]);
        int page = Integer.parseInt(pages.split("p")[0]);
        PagedListHolder<User> listHolder = service.getPageList();
        listHolder.setPage(page);
        model.addAttribute("user", this.service.getUserById(id));
        model.addAttribute("listUsers", listHolder);
        return "user";
    }
}
