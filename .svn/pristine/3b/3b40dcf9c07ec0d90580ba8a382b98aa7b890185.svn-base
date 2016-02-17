package springmvc.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.UserRole;
import springmvc.model.dao.UserRoleDao;

@Repository
public class UserRoleDaoImpl implements UserRoleDao{
	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public UserRole getRole(String rolename) {
		
		return entityManager.createQuery(" from UserRole where role ='"+rolename+"' ", UserRole.class).getSingleResult();
		
	}

}
