package springmvc.web.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springmvc.enums.UserRoles;
import springmvc.model.Users;
import springmvc.model.dao.UserDao;

@Controller
public class LoginController {
	
	@Autowired
    private UserDao userDao;
    
	@RequestMapping(value = "/admin/admin.html")
    public String admin()
    {
        return "/admin/admin";
    }
	
	@RequestMapping(value = "/staff/staff.html")
    public String staff()
    {
        return "/staff/staff";
    }

    @RequestMapping(value = "/home.html", method = RequestMethod.POST)
    public String login(@RequestParam String email, @RequestParam String password, HttpServletRequest request)
    {
    	String returnURL = "";
    	String message = "";
    	Users user = userDao.userLogin(email, password);
    	
    	if(user != null)
    	{
    		request.getSession().setAttribute("user", user);
    		if(user.getRole().getRole().equalsIgnoreCase(UserRoles.admin.toString()))
        	{
        		returnURL = "/admin/admin.html";
        	}
    		if(user.getRole().getRole().equalsIgnoreCase(UserRoles.staff.toString()))
        	{
        		returnURL = "/staff/staff.html";
        	}
    		if(user.getRole().getRole().equalsIgnoreCase(UserRoles.student.toString()))
        	{
        		returnURL = "/student/student.html";
        	}
    	}
    	else
    	{
    		message = "Email and password doesn't match";
    		request.getSession().setAttribute("message", message);
    		returnURL = "home.html";
    	}
    	return "redirect:"+returnURL;
    	
    }
    
    @RequestMapping(value = "/logout.html")
    public String logout(HttpServletRequest request)
    {
    	
    	request.getSession().invalidate();
		return "redirect:/home.html";
    
    }
	
}
