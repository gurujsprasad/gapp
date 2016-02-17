package springmvc.model.dao;

import java.util.List;

import springmvc.model.*;

public interface DepartmentDao {

	List<Departments> getDepartments();
	
	Departments getDepartmentByID(int id);

	Departments saveDepartment(Departments department);

	void deleteDepartment(int departmentID);

	int updateDepartment(int departmentID, String departmentName);
	
}
