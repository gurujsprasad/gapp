package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.*;
import springmvc.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Users getUser( Integer id )
    {
        return entityManager.find( Users.class, id );
    }

    @Override
    public List<Users> getUsers()
    {
        return entityManager.createQuery( "from Users order by id", Users.class )
            .getResultList();
    }

	@Override
	@Transactional
	public Users saveUSer(Users user) {
		
		return entityManager.merge(user);
	}

	@Override
	public List<Users> getUserByEmail(String email) {
		
		return entityManager.createQuery(" from Users where UPPER(email) like UPPER('"+email+"')", Users.class).getResultList();
	}

	@Override
	public Users userLogin(String email, String password) {
		
		List<Users> users = entityManager.createQuery(" from Users where UPPER(email) like UPPER('"+email+"') "
				+ "and password like '"+password+"'", Users.class).getResultList();
		
		return users.size() == 0 ? null : users.get( 0 );
		
	}

	@Transactional
	@Override
	public Users addStudent(StudentInformation student,int userID) {
		
		 entityManager.createQuery("update Users set studentsInfo = "+student+" where id = "+userID, Users.class).executeUpdate();
		 return getUser(userID);
	}

}