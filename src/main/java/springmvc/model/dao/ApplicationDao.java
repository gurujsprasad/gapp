package springmvc.model.dao;
import java.util.List;

import springmvc.model.*;
public interface ApplicationDao {

	
	List<Applications> getApplicationsPerDepartment(String department);
	
	List<Applications> getApplicationsForStudent(String studentEmail);

	Applications saveApplication(Applications application);

	Applications getApplicationByID(int id);
	
	
}
