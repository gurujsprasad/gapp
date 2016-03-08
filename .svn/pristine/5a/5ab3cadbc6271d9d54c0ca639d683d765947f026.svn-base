package springmvc.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.AcademicRecord;
import springmvc.model.dao.AcademicRecordDao;

@Repository
public class AcademicRecordDaoImpl implements AcademicRecordDao{

	@PersistenceContext
    private EntityManager entityManager;
	
	@Transactional
	@Override
	public AcademicRecord addAcademicRecord(AcademicRecord academicRecord) {
		
		return entityManager.merge(academicRecord);
	}

}
