package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.EducationalBackground;
import springmvc.model.dao.EducationalBackgroundDao;

@Repository
public class EducationalBackgroundDaoImpl implements EducationalBackgroundDao{

	@PersistenceContext
    private EntityManager entityManager;

	@Transactional
	@Override
	public EducationalBackground saveEducationalBackGround(EducationalBackground edu) {
		// TODO Auto-generated method stub
		return entityManager.merge(edu);
	}
	
	@Override
	public EducationalBackground getEducationalBackGroundByID(int id) {
		// TODO Auto-generated method stub
		return entityManager.find(EducationalBackground.class, id);
	}

	@Override
	public EducationalBackground getCountByStudentID(int studentID) {
		List<EducationalBackground> educationalBackground = entityManager.createQuery("select e from EducationalBackground e where e.studentInfo.id="+studentID,EducationalBackground.class).getResultList();
		return educationalBackground.size() == 0 ? null : educationalBackground.get(0);
	}
}
