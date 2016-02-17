package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.Departments;
import springmvc.model.dao.DepartmentDao;

@Repository
public class DepartmentDaoImpl implements DepartmentDao{

	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Departments> getDepartments() {
		
		
		return entityManager.createQuery("from Departments order by id",Departments.class).getResultList();
	}

	@Override
	public Departments getDepartmentByID(int id) {
		
		return entityManager.find(Departments.class, id );
		
	}
	
	@Override
	@Transactional
	public Departments saveDepartment(Departments department)
	{
		return entityManager.merge(department);
	}

	@Override
	@Transactional
	public void deleteDepartment(int departmentID) {
		// TODO Auto-generated method stub
		entityManager.remove(entityManager.find(Departments.class, departmentID));
		//return entityManager.createQuery("delete from Departments d where d.id="+departmentID).executeUpdate();
	}
	
	@Override
	@Transactional
	public int updateDepartment(int departmentID, String departmentName) {
		
		return entityManager.createQuery("update Departments d set d.name = '"+departmentName+"' where"
				+ " d.id="+departmentID).executeUpdate();
	}
	
}
