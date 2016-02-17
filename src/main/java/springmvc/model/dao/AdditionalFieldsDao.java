package springmvc.model.dao;

import java.util.List;

import springmvc.model.AdditionalFields;

public interface AdditionalFieldsDao {
	
	List<AdditionalFields> getAdditionalFielsByDptID (int dptID);

	int removeAdditionalFieldsByDptID(int dptID);

	AdditionalFields saveAdditionalFields(AdditionalFields fields);

	int deleteFieldByID(int id);

	int updateFieldByID(int id, String name, String type, String required);

}
