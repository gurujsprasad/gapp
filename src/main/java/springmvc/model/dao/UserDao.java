package springmvc.model.dao;

import java.util.List;

import springmvc.model.*;

public interface UserDao {

    Users getUser( Integer id );

    List<Users> getUsers();
    
    Users saveUSer(Users user);
    
    List<Users> getUserByEmail (String email);
    
    Users userLogin (String email, String password);

	Users addStudent(StudentInformation student, int userID);

}