package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.Programs;
import springmvc.model.dao.ProgramsDao;

@Repository
public class ProgramsDaoImpl implements ProgramsDao{
	
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Programs> getPrograms() {
		// TODO Auto-generated method stub
			
		return entityManager.createQuery(" from Programs order by department.id", Programs.class).getResultList();
	}
	
	@Override
	public Programs getProgramsByID(int id) {
		// TODO Auto-generated method stub
			
		return entityManager.find(Programs.class, id);
	}

	@Override
	public List<Programs> getProgramsByDptID(int departmentID) {
		
		return entityManager.createQuery(" from Programs where department.id = "+departmentID, Programs.class).getResultList();
		
	}
	
	@Override
	@Transactional
	public Programs saveProgram(Programs program) {
		
		return entityManager.merge(program);
		
	}
	
	@Override
	@Transactional
	public int deletePrograms(int dptID)
	{
		return entityManager.createQuery("delete from Programs p where p.department.id="+dptID).executeUpdate();
	}
	
	@Override
	@Transactional
	public int deleteProgramByID(int id)
	{
		return entityManager.createQuery("delete from Programs p where id="+id).executeUpdate();
	}
	
	@Override
	@Transactional
	public int updateProgram(int id, String name)
	{
		return entityManager.createQuery("update Programs p set p.programName='"+name+"' where id="+id).executeUpdate();
	}
}
