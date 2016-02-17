package springmvc.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import springmvc.model.Users;
import springmvc.model.UserRole;
import springmvc.model.dao.UserDao;
import springmvc.model.dao.UserRoleDao;

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserRoleDao dao;
    
    @RequestMapping("/users.html")
    public String users( ModelMap models )
    {
        models.put( "users", userDao.getUsers() );
        return "users";
    }
   
    @RequestMapping(value = "/users/registration.html", method = RequestMethod.GET)
    public String add()
    {
    	return "/users/registration";
    }
    
    @RequestMapping(value = "/users/registration.html", method = RequestMethod.POST)
    public String add(@RequestParam String firstname,@RequestParam String lastname,@RequestParam String email
    		,@RequestParam String password, RedirectAttributes redirectAttributes,  ModelMap model)
    {
    	UserRole role = new UserRole(); 
    	String message = "";
    	String returnLink;
    	List<Users> users = userDao.getUserByEmail(email);
    	
    	if(users.size() > 0 )
    	{
    		message = "Entered Email ID already exists";
    		returnLink = "redirect:registration.html";
    	}
    	else
    	{
    		
    		role =  dao.getRole("student");
        	Users user = new Users();
        	user.setFirstName(firstname);
        	user.setLastName(lastname);
        	user.setEmail(email);
        	user.setPassword(password);
        	user.setRole(role);
        	
        	user = userDao.saveUSer(user);
        	
        	message = "User "+firstname+", added successfully, Login to access your account";
        	returnLink = "redirect:../home.html";
        	
    	}
    	//model.put("message", message);
    	//request.setAttribute("message", message);
    	redirectAttributes.addFlashAttribute("message", message);
    	return returnLink;
    }
    
    
}