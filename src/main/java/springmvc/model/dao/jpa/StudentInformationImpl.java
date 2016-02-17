package springmvc.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.dao.*;

@Repository
public class StudentInformationImpl implements StudentInformationDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	

}
