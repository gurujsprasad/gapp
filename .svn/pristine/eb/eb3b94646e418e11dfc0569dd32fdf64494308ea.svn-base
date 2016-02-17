package springmvc.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import springmvc.model.AdditionalFields;
import springmvc.model.Departments;
import springmvc.model.Programs;
import springmvc.model.dao.AdditionalFieldsDao;
import springmvc.model.dao.DepartmentDao;
import springmvc.model.dao.ProgramsDao;

@Controller
public class AdminController {

	@Autowired
    private DepartmentDao dptDao;
	
	@Autowired
	private ProgramsDao pgrDao;
	
	@Autowired
	private AdditionalFieldsDao addFieldsDao;
	
	@RequestMapping(value = "admin/listdepartment.html")
    public String viewDepartment(ModelMap models)
    {
		List<Departments> departments = dptDao.getDepartments();
		List<Programs> programs = pgrDao.getPrograms();
		
		models.put("departments", departments);
		models.put("programs", programs);
		
        return "/admin/listdepartment";
    }
	
	@RequestMapping(value = "admin/viewdepartment/{id}.html")
	public String viewEachDepartment(@PathVariable Integer id, ModelMap models)
	{
		Departments department = dptDao.getDepartmentByID(id);
		List<Programs> programs = pgrDao.getProgramsByDptID(id);
		List<AdditionalFields> additionalFields= addFieldsDao.getAdditionalFielsByDptID(id);
		models.put("department", department);
		models.put("programs", programs);
		models.put("additionalFields", additionalFields);
		return "/admin/viewdepartment";
		
	}
	
	@RequestMapping(value = "admin/newdepartment.html")
	public String addDepartment()
	{
		return "/admin/newdepartment";
	}
	
	@RequestMapping(value = "admin/newdepartment.html", method = RequestMethod.POST)
	public String addDepartment(HttpServletRequest request, ModelMap model)
	{
		String function = request.getParameter("function");
		String returnLink = "";
		if(function.equalsIgnoreCase("department"))
		{
			String departmentName = request.getParameter("departmentName");
			Departments department = new Departments ();
			department.setName(departmentName);
			department = dptDao.saveDepartment(department);
			model.put("departmentID", department.getId());
			model.put("departmentName",department.getName());
			returnLink = "/admin/newdepartment";
		}
		if(function.equalsIgnoreCase("program"))
		{
			int departmentID = Integer.parseInt(request.getParameter("departmentID"));
			String programName = request.getParameter("programName");
			Programs program = new Programs ();
			
			Departments department = dptDao.getDepartmentByID(departmentID);
			program.setProgramName(programName);
			program.setDepartment(department);
			
			program = pgrDao.saveProgram(program);
			
			List<Programs> programs = pgrDao.getProgramsByDptID(departmentID);
			List<AdditionalFields> additionalFields = addFieldsDao.getAdditionalFielsByDptID(departmentID);
			model.put("departmentID", department.getId());
			model.put("departmentName",department.getName());
			model.put("programs", programs);
			model.put("additionalFields", additionalFields);
			returnLink = "/admin/newdepartment";
			
		}
		if(function.equalsIgnoreCase("additionalField"))
		{
			int departmentID = Integer.parseInt(request.getParameter("departmentID"));
			String fieldName = request.getParameter("fieldname");
			String fieldType = request.getParameter("fieldtype");
			String required = request.getParameter("required");
			AdditionalFields fields = new AdditionalFields();
			
			Departments department = dptDao.getDepartmentByID(departmentID);
			fields.setNameOfField(fieldName);
			fields.setFieldType(fieldType);
			fields.setRequiredOrOptional(required);
			fields.setDepartment(department);
			
			fields = addFieldsDao.saveAdditionalFields(fields);
			

			List<Programs> programs = pgrDao.getProgramsByDptID(departmentID);
			List<AdditionalFields> additionalFields = addFieldsDao.getAdditionalFielsByDptID(departmentID);
			model.put("departmentID", department.getId());
			model.put("departmentName",department.getName());
			model.put("programs", programs);
			model.put("additionalFields", additionalFields);
			returnLink = "/admin/newdepartment";
		}
		
		return returnLink;
		
	}
	
	//this is for removing the department completely with all programs and additional fields in it
	@RequestMapping(value = "admin/deletedepartment/{id}.html")
	public String deleteDepartment(@PathVariable Integer id, ModelMap models)
	{
		addFieldsDao.removeAdditionalFieldsByDptID(id);
		pgrDao.deletePrograms(id);
		dptDao.deleteDepartment(id);
		return "redirect:../listdepartment.html";
		
	}
	
	//this is for editing the department
	@RequestMapping(value = "admin/editdepartment/{id}.html")
	public String editDepartment(@PathVariable Integer id, ModelMap models)
	{
		
		Departments department = dptDao.getDepartmentByID(id);
		List<Programs> programs = pgrDao.getProgramsByDptID(id);
		List<AdditionalFields> fields = addFieldsDao.getAdditionalFielsByDptID(id);
		
		models.put("department", department);
		models.put("programs", programs);
		models.put("fields", fields);
		
		return "/admin/editdepartment";
		
	}
	
	@RequestMapping(value="admin/updatedepartment.html", method = RequestMethod.POST)
	public String updateDepartment(HttpServletRequest request)
	{
		int departmentID = Integer.parseInt(request.getParameter("departmentID"));
		String departmentName = request.getParameter("departmentName");
		
		dptDao.updateDepartment(departmentID, departmentName);
		
		return "redirect:editdepartment/"+departmentID+".html";
		
	}
	
	@RequestMapping(value = "admin/deleteprogram.html")
	public String deleteProgram(HttpServletRequest request, ModelMap models)
	{
		int id = Integer.parseInt(request.getParameter("id"));
		int dID = Integer.parseInt(request.getParameter("dID"));
		pgrDao.deleteProgramByID(id);
		return "redirect:editdepartment/"+dID+".html";
		
	}
	
	@RequestMapping(value = "admin/addprogram.html", method = RequestMethod.POST)
	public String addProgram(HttpServletRequest request, ModelMap models)
	{
		
			int departmentID = Integer.parseInt(request.getParameter("departmentID"));
			String programName = request.getParameter("programName");
			//Programs program = pgrDao.getProgramsByID(id);
			Programs program = new Programs ();
			
			Departments department = dptDao.getDepartmentByID(departmentID);
			program.setProgramName(programName);
			program.setDepartment(department);
			
			program = pgrDao.saveProgram(program);
			
			List<Programs> programs = pgrDao.getProgramsByDptID(departmentID);
			List<AdditionalFields> additionalFields = addFieldsDao.getAdditionalFielsByDptID(departmentID);
			
			models.put("department", department);
			models.put("programs", programs);
			models.put("fields", additionalFields);	
			return "redirect:editdepartment/"+departmentID+".html";
		
	}
	
	@RequestMapping(value = "admin/updateprogram.html", method = RequestMethod.POST)
	public String updateProgram(HttpServletRequest request, ModelMap models)
	{
		int programID = Integer.parseInt(request.getParameter("programID"));
		int departmentID = Integer.parseInt(request.getParameter("departmentID"));
		String programName = request.getParameter("programName");
		pgrDao.updateProgram(programID, programName);
		return "redirect:editdepartment/"+departmentID+".html";
	}
	
	@RequestMapping(value = "admin/addfields.html", method = RequestMethod.POST)
	public String addFields(HttpServletRequest request, ModelMap models)
	{
		
		int departmentID = Integer.parseInt(request.getParameter("departmentID"));
		String fieldName = request.getParameter("fieldname");
		String fieldType = request.getParameter("fieldtype");
		String required = request.getParameter("required");
		AdditionalFields fields = new AdditionalFields();
		
		Departments department = dptDao.getDepartmentByID(departmentID);
		
		fields.setNameOfField(fieldName);
		fields.setFieldType(fieldType);
		fields.setRequiredOrOptional(required);
		fields.setDepartment(department);
		
		fields = addFieldsDao.saveAdditionalFields(fields);
		
		List<Programs> programs = pgrDao.getProgramsByDptID(departmentID);
		List<AdditionalFields> additionalFields = addFieldsDao.getAdditionalFielsByDptID(departmentID);
		
		models.put("department", department);
		models.put("programs", programs);
		models.put("fields", additionalFields);	
		return "redirect:editdepartment/"+departmentID+".html";
	}
	
	@RequestMapping(value = "admin/deletefield.html")
	public String deleteField(HttpServletRequest request, ModelMap models)
	{
		int id = Integer.parseInt(request.getParameter("id"));
		int dID = Integer.parseInt(request.getParameter("dID"));
		addFieldsDao.deleteFieldByID(id);
		return "redirect:editdepartment/"+dID+".html";
		
	}
	
	@RequestMapping(value = "admin/updatefield.html", method = RequestMethod.POST)
	public String updateField(HttpServletRequest request, ModelMap models)
	{
		int fieldID = Integer.parseInt(request.getParameter("fieldID"));
		int departmentID = Integer.parseInt(request.getParameter("departmentID"));
		String fieldName = request.getParameter("fieldname");
		String fieldType = request.getParameter("fieldtype");
		String required = request.getParameter("required");
		
		addFieldsDao.updateFieldByID(fieldID, fieldName, fieldType, required);
		
		return "redirect:editdepartment/"+departmentID+".html";
	}
	
}
