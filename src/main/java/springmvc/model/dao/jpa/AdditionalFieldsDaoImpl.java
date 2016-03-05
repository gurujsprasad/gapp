package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.AdditionalFields;
import springmvc.model.dao.AdditionalFieldsDao;
@Repository
public class AdditionalFieldsDaoImpl implements AdditionalFieldsDao{

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public List<AdditionalFields> getAdditionalFielsByDptID(int dptID) {
		
		List<AdditionalFields> additionalfields = entityManager.createQuery("from AdditionalFields where department.id ="+dptID,AdditionalFields.class).getResultList();
		return additionalfields == null ? null : additionalfields;
	}

	@Override
	@Transactional
	public int removeAdditionalFieldsByDptID(int dptID)
	{
		return entityManager.createQuery("delete from AdditionalFields a where a.department.id="+dptID).executeUpdate();
	}

	@Override
	@Transactional
	public AdditionalFields saveAdditionalFields(AdditionalFields fields) {
		// TODO Auto-generated method stub
		return entityManager.merge(fields);
	}
	
	@Override
	@Transactional
	public int deleteFieldByID(int id)
	{
		return entityManager.createQuery("delete from AdditionalFields a where a.id="+id).executeUpdate();
	}
	
	@Override
	@Transactional
	public int updateFieldByID(int id, String name, String type, String required)
	{
		return entityManager.createQuery("update AdditionalFields a set a.nameOfField = '"+name+"',"
				+ "a.fieldType = '"+type+"', a.requiredOrOptional = '"+required+"' where a.id = "+id).executeUpdate();
	}
}
