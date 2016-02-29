package springmvc.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.ApplicationStatusUpdate;
import springmvc.model.dao.ApplicationStatusUpdateDao;

@Repository
public class ApplicationStatusUpdateImpl implements ApplicationStatusUpdateDao{

	
	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public ApplicationStatusUpdateDao getLatestStatus() {
		
		return null;// entityManager.createQuery("",ApplicationStatusUpdate.class).getSingleResult();
	}

}
