package springmvc.model.dao.jpa;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.StudentInformation;
import springmvc.model.dao.*;

@Repository
public class StudentInformationImpl implements StudentInformationDao {

	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public StudentInformation getStudentByID(int id) {
		
		StudentInformation student = entityManager.find(StudentInformation.class, id);
		return student == null ? null : student;
	}

	@Transactional
	@Override
	public StudentInformation addStudent(StudentInformation student) {
		// TODO Auto-generated method stub
		return entityManager.merge(student);
	}

	@Transactional
	@Override
	public int updateStudent(int id,String firstName, String lastName, String cin, String phone, String email,
			String gender, Date date, String citizenship, int studentType) {
		// TODO Auto-generated method stub
		return entityManager.createQuery("update StudentInformation s set s.lastName = '"+lastName+"', s.firstName = '"+firstName+"', s.cin = '"+cin+"', s.phoneNumber = '"+phone+"'"
				+ ",s.email = '"+email+"', s.gender = '"+gender+"', s.dob = '"+date+"', s.Citizenship = '"+citizenship+"', s.internationalStudent = '"+studentType+"' where s.id="+id).executeUpdate();
	}
	
	

}
