package springmvc.model.dao;

import java.util.List;

import springmvc.model.Programs;

public interface ProgramsDao {
	
	List<Programs> getPrograms ();
	
	List<Programs> getProgramsByDptID (int departmentID);

	Programs saveProgram(Programs program);

	int deletePrograms(int dptID);

	int deleteProgramByID(int id);

	Programs getProgramsByID(int id);

	int updateProgram(int id, String name);

}
