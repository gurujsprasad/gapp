package springmvc.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.AdditionalFieldValues;
import springmvc.model.dao.AdditionalFieldValuesDao;

@Repository
public class AdditionalFieldValuesDaoImpl implements AdditionalFieldValuesDao{

	@PersistenceContext
	EntityManager entityManager;

	@Transactional
	@Override
	public AdditionalFieldValues addAdditionalFieldValue(AdditionalFieldValues fieldValue) {
		// TODO Auto-generated method stub
		return entityManager.merge(fieldValue);
	}
	
	
	
}
