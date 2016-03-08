package springmvc.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import springmvc.model.AcademicRecord;
import springmvc.model.AdditionalFieldValues;
import springmvc.model.AdditionalFields;
import springmvc.model.ApplicationStatus;
import springmvc.model.ApplicationStatusUpdate;
import springmvc.model.Applications;
import springmvc.model.Departments;
import springmvc.model.EducationalBackground;
import springmvc.model.Programs;
import springmvc.model.StudentInformation;
import springmvc.model.Users;
import springmvc.model.dao.AcademicRecordDao;
import springmvc.model.dao.AdditionalFieldValuesDao;
import springmvc.model.dao.AdditionalFieldsDao;
import springmvc.model.dao.ApplicationDao;
import springmvc.model.dao.ApplicationStatusDao;
import springmvc.model.dao.ApplicationStatusUpdateDao;
import springmvc.model.dao.DepartmentDao;
import springmvc.model.dao.EducationalBackgroundDao;
import springmvc.model.dao.ProgramsDao;
import springmvc.model.dao.StudentInformationDao;
import springmvc.model.dao.UserDao;

@Controller
public class StudentController {
	
	@Autowired
	StudentInformationDao stdDao;
	
	@Autowired
	DepartmentDao dptDao;
	
	@Autowired
	ProgramsDao pgrDao;
	
	@Autowired
	ApplicationDao appDao;
	
	@Autowired
	UserDao userDoa;
	
	@Autowired
	EducationalBackgroundDao eduDao;
	
	@Autowired
	AcademicRecordDao academicDao;
	
	@Autowired
	AdditionalFieldsDao addFieldsDao;
	
	@Autowired
	AdditionalFieldValuesDao addFieldValuesDao;
	
	@Autowired
	ApplicationStatusDao appStatusDao;
	
	@Autowired
	ApplicationStatusUpdateDao appStatusUpdateDao;
	
	@RequestMapping(value = "/student/student.html")
    public String student(ModelMap models, HttpSession session)
    {		
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		Users user = (Users) session.getAttribute("user");
		int userID = user.getId();
		user = userDoa.getUser(userID);
		List<StudentInformation> studentInfo = null;
		String message = "";
		if(user.getStudentsInfo().size() > 0)
		{
			studentInfo = user.getStudentsInfo();
			/*studentInfo = stdDao.getStudentByID(user.getStudentsInfo().getId());*/
			/*session.setAttribute("studentID", studentInfo.getId());*/
			models.put("studentInfo",studentInfo);
		}
		else
		{
			message = "You have no applications to show";
			models.put("message", message);
		}
		session.setAttribute("applicationID", "");
		session.setAttribute("studentID", "");
        return "/student/student";
    }
	
	@RequestMapping(value = "/student/StudentApplication.html")
    public String newApplication(ModelMap models, HttpSession session)
    {
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		List<Departments> departments = dptDao.getDepartments();
		/*Users user = (Users) session.getAttribute("user");
		StudentInformation studentInfo = null;
		int firstTime = 0; //0 means first time --> 1 means applied once
		if(user.getStudentsInfo() != null)
		{
			studentInfo = stdDao.getStudentByID(user.getStudentsInfo().getId());
			firstTime = 1;
		}*/
		/*models.put("firstTime", firstTime);
		models.put("studentInfo",studentInfo);*/
		models.put("departments", departments);
		session.setAttribute("applicationID","");
		session.setAttribute("studentID", "");
        return "/student/StudentApplication";
    }
	
	@RequestMapping(value = "/student/GetProgram.html")
	@ResponseBody
    public String getProgramsByDepartment(HttpSession session ,@RequestParam(value = "departmentID") Integer departmentID, HttpServletResponse response) throws IOException
    {
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		List<Programs> programs = pgrDao.getProgramsByDptID(departmentID);
		String html = "";
		for (Programs program : programs)
		{
			html += "<option value = '"+program.getId()+"'>"+program.getProgramName()+"</option>";
		}
		return html;
    }
	
	
	@RequestMapping(value = "/student/StudentInformation.html", method = RequestMethod.POST)
	public String addStudentInfo(HttpServletRequest request, ModelMap model,HttpSession session) throws ParseException
	{
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		Users user = (Users) session.getAttribute("user");
		String edit = "";
		
		int studentID = 0;
		int programID = Integer.parseInt(request.getParameter("program"));
		int departmentID = Integer.parseInt(request.getParameter("department"));
		String term = request.getParameter("term");
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String cin = request.getParameter("cin");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String citizenship = request.getParameter("citizenship");
		int studentType = Integer.parseInt(request.getParameter("studentType"));
		
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date date = format.parse(dob);
		
		Programs program = pgrDao.getProgramsByID(programID);
		Applications application = null;
		
		//editing the application
		if(session.getAttribute("applicationID") != null && session.getAttribute("applicationID") != "")
		{
			edit = "true";
			int sessionApplicationID = (int) session.getAttribute("applicationID");
			application = appDao.getApplicationByID(sessionApplicationID);
		}
		else
		{
			 application = new Applications();
		}
		
		application.setTerm(term);
		application.setProgram(program);
		application.setCurrentStatus("Saved");
		application = appDao.saveApplication(application);
		
		if(session.getAttribute("studentID") != null &&  session.getAttribute("studentID") !="")
		{
			format = new SimpleDateFormat("yyyy-MM-dd");
			date =  format.parse(dob);
			studentID = (int)session.getAttribute("studentID");
			StudentInformation student = stdDao.getStudentByID(studentID);
			stdDao.updateStudent(studentID,firstName,lastName,cin,phone,email,gender,date,citizenship,studentType);
			//List<Applications> applications = student.getApplications();
			if(!edit.equals("true"))
			{
				//applications.add(application);
				student.setApplications(application);
				student = stdDao.addStudent(student);
			}	
		}
		else
		{
			StudentInformation student = new StudentInformation();
			student.setLastName(lastName);
			student.setFirstName(firstName);
			student.setEmail(email);
			student.setPhoneNumber(phone);
			student.setCin(cin);
			student.setCitizenship(citizenship);
			student.setDob(date);
			student.setGender(gender);
			student.setInternationalStudent(studentType);
			//student.setEducationalBackground(new ArrayList<EducationalBackground>());
			//List<Applications> applications = new ArrayList<Applications>();
			//applications.add(application);
			student.setApplications( application );
			student = stdDao.addStudent(student);
			studentID = student.getId();
			List<StudentInformation> students = null;
			int userID = user.getId();
			user = userDoa.getUser(userID);
			if(user.getStudentsInfo().size() > 0)
			{
				students = user.getStudentsInfo();
			}
			else
			{
				students = new ArrayList<StudentInformation>();
			}
			students.add(student);
			user.setStudentsInfo(students);
			user = userDoa.saveUSer(user);
			//user = userDoa.getUser(user.getId());
			//user.setStudentsInfo(student); // = userDoa.addStudent(student,user.getId());
			//user = userDoa.saveUSer(user);
			session.setAttribute("user", user);
		}
		session.setAttribute("applicationID", application.getId());
		session.setAttribute("studentID", studentID);
		session.setAttribute("departmentID", departmentID);
		return "redirect:/student/EducationalBackground.html";
		
	}
	
	@RequestMapping(value = "/student/EducationalBackground.html",method = RequestMethod.GET)
    public String addEducationalBackground(ModelMap models, HttpSession session,HttpServletRequest request)
    {
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		int studentID = (int) session.getAttribute("studentID");
		StudentInformation studentInfo = stdDao.getStudentByID(studentID);
		int departmentID = (int) session.getAttribute("departmentID");
		List<EducationalBackground> educationalBackgrounds = null;
		EducationalBackground test = eduDao.getCountByStudentID(studentID);
		if(test != null)
		{
			educationalBackgrounds = studentInfo.getEducationalBackground();
		}
		models.put("educationBackground", new EducationalBackground());
		models.put("educationalBackgrounds", educationalBackgrounds);
		session.setAttribute("studentID", studentID);
		session.setAttribute("departmentID", departmentID);
		return "/student/EducationalBackground";
    }
	
	@RequestMapping(value = "/student/EducationalBackground.html", method = RequestMethod.POST)
    public String newEducationalBackground(@ModelAttribute EducationalBackground edu,ModelMap models, HttpSession session,HttpServletRequest request)
    {
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		int studentID = (int) session.getAttribute("studentID");
		EducationalBackground educationalBackground = eduDao.saveEducationalBackGround(edu);
		
		educationalBackground=eduDao.getEducationalBackGroundByID(educationalBackground.getId());
		StudentInformation studentInfo = stdDao.getStudentByID(studentID);
		
		List<EducationalBackground> educationalBackgrounds = new ArrayList<EducationalBackground>();
		EducationalBackground test = eduDao.getCountByStudentID(studentID);

		if(test != null)
		{
			educationalBackgrounds = studentInfo.getEducationalBackground();
		}
		
		educationalBackgrounds.add(educationalBackground);
		studentInfo.setEducationalBackground(educationalBackgrounds);
		studentInfo = stdDao.addStudent(studentInfo);
		
		educationalBackground.setStudentInfo(studentInfo);
		educationalBackground = eduDao.saveEducationalBackGround(educationalBackground);
		
		models.put("educationalBackgrounds", educationalBackgrounds);
		
		return "/student/EducationalBackground";
    }
    
	
	@RequestMapping(value = "/student/AcademicRecord.html",method = RequestMethod.GET)
    public String addAcademicRecord(ModelMap models, HttpSession session,HttpServletRequest request)
    {
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		int studentID = (int) session.getAttribute("studentID");
		AcademicRecord academicRecord = null;
		StudentInformation student = stdDao.getStudentByID(studentID);
		if(student.getAcademics() != null)
		{
			academicRecord = student.getAcademics();
		}
		models.put("academicRecord", academicRecord);
		return "/student/AcademicRecord";
    }
	
	@RequestMapping(value = "/student/AcademicRecord.html",method = RequestMethod.POST)
    public String addAcademicRecord(@RequestParam MultipartFile transcript, ModelMap models, HttpSession session,HttpServletRequest request) throws IOException
    {
		//initialize all fields required
		int studentID = (int) session.getAttribute("studentID");
		StudentInformation student = stdDao.getStudentByID(studentID);
		String filename = transcript.getOriginalFilename();
		//filename = filename+"_"+student.getFirstName();
		double greScore =Double.parseDouble(request.getParameter("greScore"));
		double toeflScore =Double.parseDouble(request.getParameter("toeflScore"));
		double gpa =Double.parseDouble(request.getParameter("gpa"));
		AcademicRecord academicRecord = new AcademicRecord();
		
		Users user = (Users) session.getAttribute("user");
		
		if(student.getAcademics() != null)
		{
			academicRecord = student.getAcademics();
		}
		
		//adding data to academic record
		academicRecord.setToeflScore(toeflScore);
		academicRecord.setGreScore(greScore);
		academicRecord.setGpa(gpa);
		if(filename != null && filename != "")
		{
			academicRecord.setTranscript(filename);
		}		
		academicRecord = academicDao.addAcademicRecord(academicRecord);
		
		//add to above record to student information
		student.setAcademics(academicRecord);
		student = stdDao.addStudent(student);
		
		//uploading file
		if(filename != null && filename != "")
		{
			ServletContext context = session.getServletContext();
			String path = context.getRealPath("/WEB-INF/files");
			path = path+"/"+user.getFirstName()+"_"+user.getLastName();
			if(! new File(path).exists())
			{
				new File(path).mkdir();
			}
			transcript.transferTo(new File ( new File(path), filename));
		}
		//setting return values, academic record
		models.put("academicRecord", academicRecord);
		return "/student/AcademicRecord";
    }
	
	@RequestMapping(value = "/student/AdditionalDetails.html",method = RequestMethod.GET)
    public String addAdditionalDetails(ModelMap models, HttpSession session,HttpServletRequest request)
    {
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		//initializing all varibales required
		int departmentID = (int) session.getAttribute("departmentID");
		List<AdditionalFields> additionalfields = null;
		
		int applicationID = (int) session.getAttribute("applicationID");
		Applications application = appDao.getApplicationByID(applicationID);
		
		if(!application.getAdditionalFieldValues().isEmpty())
		{
			models.put("additionalFieldValues", application.getAdditionalFieldValues());
		}
		models.put("applicationID", applicationID);
		additionalfields = addFieldsDao.getAdditionalFielsByDptID(departmentID);
		models.put("additionalfields", additionalfields);
		return "/student/AdditionalDetails";
    }
	
	@RequestMapping(value = "/student/AdditionalDetails.html",method = RequestMethod.POST)
    public  String addAdditionalDetails(@RequestParam("files") MultipartFile files[],ModelMap models, HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException
    {
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		Users user = (Users) (session.getAttribute("user"));
		List<MultipartFile> filess = ((DefaultMultipartHttpServletRequest) request)
			    .getFiles("files[]");
		int totalFileGot = filess.size();
		
		//initializing all varibales required
		int departmentID = (int) session.getAttribute("departmentID");
		List<AdditionalFields> additionalfields = null;
		
		int studentID = (int) session.getAttribute("studentID");
		StudentInformation student = stdDao.getStudentByID(studentID);
		
		int applicationID = (int) session.getAttribute("applicationID");
		Applications application = appDao.getApplicationByID(applicationID);
		
		additionalfields = addFieldsDao.getAdditionalFielsByDptID(departmentID);
		int actualFielCount = 0;
		for(AdditionalFields additionalField : additionalfields)
		{
			if(additionalField.getFieldType().equals("file"))
			{
				actualFielCount = actualFielCount+1;
			}
		}
		List<AdditionalFieldValues> additionalFieldValues = new ArrayList<AdditionalFieldValues>();
		
		int fileCount = 0;
		for(AdditionalFields additionalfield : additionalfields)
		{
			AdditionalFieldValues additionalFieldValue = new AdditionalFieldValues(); 
			if(additionalfield.getFieldType().equals("text") || additionalfield.getFieldType().equals("number"))
			{
				String name = additionalfield.getNameOfField().toString();
				if(additionalfield.getRequiredOrOptional().equals("required"))
				{
					additionalFieldValue.setValue(request.getParameter(name));
				}
				else 
				{
					if(request.getParameter(name) != null && request.getParameter(name) != "")
					{
						additionalFieldValue.setValue(request.getParameter(name));
					}
				}
				
				additionalFieldValue.setAdditionalField(additionalfield);
				
			}
			
			if(additionalfield.getFieldType().equals("file"))
			{
				if(additionalfield.getRequiredOrOptional().equals("required"))
				{
					additionalFieldValue.setValue(filess.get(fileCount).getOriginalFilename());
					additionalFieldValue.setAdditionalField(additionalfield);
					ServletContext context = session.getServletContext();
					String path = context.getRealPath("/WEB-INF/files");
					path = path+"/"+user.getFirstName()+"_"+user.getLastName();
					if(! new File(path).exists())
					{
						new File(path).mkdir();
					}
					filess.get(fileCount).transferTo(new File ( new File(path), filess.get(fileCount).getOriginalFilename()));
					fileCount ++;
				}
				else
				{
					if(!filess.get(fileCount).isEmpty() && totalFileGot == actualFielCount)
					{
						System.out.println();
						additionalFieldValue.setValue(filess.get(fileCount).getOriginalFilename());
						additionalFieldValue.setAdditionalField(additionalfield);
						ServletContext context = session.getServletContext();
						String path = context.getRealPath("/WEB-INF/files");
						path = path+"/"+user.getFirstName()+"_"+user.getLastName();
						if(! new File(path).exists())
						{
							new File(path).mkdir();
						}
						filess.get(fileCount).transferTo(new File ( new File(path), filess.get(fileCount).getOriginalFilename()));
					}
					else
					{
						additionalFieldValue.setValue(null);
						additionalFieldValue.setAdditionalField(additionalfield);
					}
					fileCount ++;
				}
				
			}
			additionalFieldValue = addFieldValuesDao.addAdditionalFieldValue(additionalFieldValue);
			additionalFieldValues.add(additionalFieldValue);
			
		}
		application.setAdditionalFieldValues(additionalFieldValues);
		application = appDao.saveApplication(application);
		models.put("additionalfields", additionalfields);
		return "redirect:/student/AdditionalDetails.html";
    }
	
	@RequestMapping(value = "student/StudentEditApplication/{id}.html", method = RequestMethod.GET)
	public String editApplication(@PathVariable Integer id, ModelMap models, HttpSession session)
	{
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		//Users user = (Users) session.getAttribute("user");
		StudentInformation studentInfo = null;
		studentInfo = stdDao.getStudentByID(id);
		
		Applications application = appDao.getApplicationByID(studentInfo.getApplications().getId());
		int departmentID = application.getProgram().getDepartment().getId();
		
		List<Programs> programs = pgrDao.getProgramsByDptID(departmentID);
		
		String edit = "edit";
		session.setAttribute("edit", edit);
		session.setAttribute("applicationID", application.getId());
		session.setAttribute("departmentID", departmentID);
		session.setAttribute("studentID", id);
		//models.put("application",application);
		models.put("programs", programs);
		models.put("studentInfo", studentInfo);
		return "/student/StudentApplication";
	}
	
	@RequestMapping(value = "student/SubmitApplication.html", method = RequestMethod.GET)
	public String submitApplication(ModelMap models, HttpSession session)
	{
		int sessionApplicationID = (int) session.getAttribute("applicationID");
		Users user = (Users) session.getAttribute("user");
		Applications application = null;
		ApplicationStatus appStatus = appStatusDao.getApplicationStatusByValue("New");
		
		application = appDao.getApplicationByID(sessionApplicationID);
		application.setCurrentStatus("New");
		
		Date submittedDate = new Date();
		
		List<ApplicationStatusUpdate> statusUpdate = new ArrayList<ApplicationStatusUpdate>();
		ApplicationStatusUpdate setStatusUpdate = new ApplicationStatusUpdate();
		setStatusUpdate.setComments("Submitted New Application");
		setStatusUpdate.setStatus(appStatus);
		setStatusUpdate.setUpdatedTime(submittedDate);
		setStatusUpdate.setUser(user);
		
		setStatusUpdate = appStatusUpdateDao.addNewStatus(setStatusUpdate);
		
		statusUpdate.add(setStatusUpdate);
		
		application.setStatusInfo(statusUpdate);
		application = appDao.saveApplication(application);
		
		session.setAttribute("applicationID", "");
		session.setAttribute("studentID", "");
		return "redirect:/student/student.html";
		
	}
	
	@RequestMapping(value = "student/DeleteEducationalBackground/{id}.html", method = RequestMethod.GET)
	public String deleteEducationalBackground(@PathVariable Integer id, ModelMap models, HttpSession session)
	{
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		int studentID = (int) session.getAttribute("studentID");
		StudentInformation studentInfo = stdDao.getStudentByID(studentID);
		
		EducationalBackground edu = eduDao.getEducationalBackGroundByID(id);
		List<EducationalBackground> edufromLists = studentInfo.getEducationalBackground();
		
		for(EducationalBackground eduFromList : edufromLists)
		{
			if(eduFromList.getId() == edu.getId())
			{
				edufromLists.remove(edu);
				break;
			}
		}
		studentInfo = stdDao.addStudent(studentInfo);
		
		return "redirect:/student/EducationalBackground.html";
	
	}
	
	@RequestMapping(value = "student/StudentViewApplication/{id}.html", method = RequestMethod.GET)
	public String viewApplication(@PathVariable Integer id, ModelMap models, HttpSession session)
	{
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		/*int studentID = (int) session.getAttribute("studentID");*/
		//session.setAttribute("studentID",id);
		StudentInformation studentInfo = stdDao.getStudentByID(id);
		Applications application = appDao.getApplicationByID(studentInfo.getApplications().getId());
		int dptID = application.getProgram().getDepartment().getId();
		List<AdditionalFields> additionalFields = addFieldsDao.getAdditionalFielsByDptID(dptID);
		models.put("addtionalFields", additionalFields);
		//models.put("application", application);
		models.put("studentInfo", studentInfo);
		
		return "/student/ViewApplication";
	
	}
	
	@RequestMapping(value = "student/ViewFile/{fileName}.html", method = RequestMethod.GET)
	public String viewApplication(@PathVariable String fileName, ModelMap models, HttpSession session, HttpServletResponse response) throws IOException
	{
		if(session.getAttribute("user")==null)
		{
			String message = "Session timed out, please login again to continue !!";
			session.setAttribute("message", message);
			return "redirect:../home.html";
		}
		Users user = (Users) (session.getAttribute("user"));
		response.setContentType( "" );
		//int studentID = (int) session.getAttribute("studentID");
		//StudentInformation student = stdDao.getStudentByID(studentID);
        response.setHeader( "Content-Disposition",
            "inline; filename="+fileName );
        ServletContext context = session.getServletContext();
        String path = context.getRealPath("/WEB-INF/files");
        path = path+"/"+user.getFirstName()+"_"+user.getLastName();
		FileInputStream in = new FileInputStream(new File(path,fileName));
		OutputStream out = response.getOutputStream();
		byte buffer[] = new byte[2048];
		int bytesRead;
		while ((bytesRead = in.read(buffer)) > 0)
		{
			out.write(buffer, 0, bytesRead);
		}
		in.close();
		return null;
	}
}
