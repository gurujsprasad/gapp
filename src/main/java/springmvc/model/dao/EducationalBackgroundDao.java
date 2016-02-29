package springmvc.model.dao;

import springmvc.model.EducationalBackground;

public interface EducationalBackgroundDao {

	
	EducationalBackground saveEducationalBackGround(EducationalBackground edu);
	
	EducationalBackground getCountByStudentID(int studentID);

	EducationalBackground getEducationalBackGroundByID(int id);
	
}
