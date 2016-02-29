package springmvc.model.dao;

import java.util.Date;

import springmvc.model.StudentInformation;

public interface StudentInformationDao {

	
	StudentInformation getStudentByID(int id);

	StudentInformation addStudent(StudentInformation student);

	int updateStudent(int id,String firstName, String lastName, String cin, String phone, String email,
			String gender, Date date, String citizenship, int studentType);
	
}
