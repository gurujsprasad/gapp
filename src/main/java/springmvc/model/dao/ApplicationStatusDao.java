package springmvc.model.dao;

import springmvc.model.ApplicationStatus;

public interface ApplicationStatusDao {

	ApplicationStatus getApplicationStatusByValue(String status);
	
}
