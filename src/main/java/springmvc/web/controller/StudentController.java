package springmvc.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebServiceContext;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import springmvc.model.AcademicRecord;
import springmvc.model.Applications;
import springmvc.model.Departments;
import springmvc.model.EducationalBackground;
import springmvc.model.Programs;
import springmvc.model.StudentInformation;
import springmvc.model.Users;
import springmvc.model.dao.AcademicRecordDao;
import springmvc.model.dao.ApplicationDao;
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
	
	
	@RequestMapping(value = "/student/student.html")
    public String student(ModelMap models, HttpSession session)
    {
		Users user = (Users) session.getAttribute("user");
		StudentInformation studentInfo = null;
		String message = "";
		if(user.getStudentsInfo() != null)
		{
			studentInfo = stdDao.getStudentByID(user.getStudentsInfo().getId());
			session.setAttribute("studentID", studentInfo.getId());
			models.put("studentInfo",studentInfo);
		}
		if(studentInfo == null)
		{
			message = "You have no applications to show";
			models.put("message", message);
		}
        return "/student/student";
    }
	
	@RequestMapping(value = "/student/NewApplication.html")
    public String newApplication(ModelMap models, HttpSession session)
    {
		List<Departments> departments = dptDao.getDepartments();
		Users user = (Users) session.getAttribute("user");
		StudentInformation studentInfo = null;
		if(user.getStudentsInfo() != null)
		{
			studentInfo = stdDao.getStudentByID(user.getStudentsInfo().getId());
		}
		models.put("studentInfo",studentInfo);
		models.put("departments", departments);
        return "/student/NewApplication";
    }
	
	@RequestMapping(value = "/student/GetProgram.html")
	@ResponseBody
    public String getProgramsByDepartment(@RequestParam(value = "departmentID") Integer departmentID, HttpServletResponse response) throws IOException
    {
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
		Users user = (Users) session.getAttribute("user");
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
		Applications application = new Applications();
		application.setTerm(term);
		application.setProgram(program);
		application.setCurrentStatus("Saved");
		application = appDao.saveApplication(application);
		
		if(request.getParameter("checkStudent") != null)
		{
			format = new SimpleDateFormat("yyyy-MM-dd");
			date =  format.parse(dob);
			studentID = Integer.parseInt(request.getParameter("studentID"));
			StudentInformation student = stdDao.getStudentByID(studentID);
			stdDao.updateStudent(studentID,firstName,lastName,cin,phone,email,gender,date,citizenship,studentType);
			List<Applications> applications = student.getApplications();
			applications.add(application);
			student.setApplications(applications);
			student = stdDao.addStudent(student);
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
			List<Applications> applications = new ArrayList<Applications>();
			applications.add(application);
			student.setApplications( applications );
			student = stdDao.addStudent(student);
			studentID = student.getId();
			user = userDoa.getUser(user.getId());
			user.setStudentsInfo(student); // = userDoa.addStudent(student,user.getId());
			user = userDoa.saveUSer(user);
			session.setAttribute("user", user);
		}
		session.setAttribute("studentID", studentID);
		session.setAttribute("departmentID", departmentID);
		return "redirect:/student/EducationalBackground.html";
		
	}
	
	@RequestMapping(value = "/student/EducationalBackground.html",method = RequestMethod.GET)
    public String addEducationalBackground(ModelMap models, HttpSession session,HttpServletRequest request)
    {
		int studentID = (int) session.getAttribute("studentID");
		int departmentID = (int) session.getAttribute("departmentID");
		models.put("educationBackground", new EducationalBackground());
		session.setAttribute("studentID", studentID);
		session.setAttribute("departmentID", departmentID);
		return "/student/EducationalBackground";
    }
	
	@RequestMapping(value = "/student/EducationalBackground.html", method = RequestMethod.POST)
    public String newEducationalBackground(@ModelAttribute EducationalBackground edu,ModelMap models, HttpSession session,HttpServletRequest request)
    {
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
		String filename = transcript.getOriginalFilename();
		double greScore =Double.parseDouble(request.getParameter("greScore"));
		double toeflScore =Double.parseDouble(request.getParameter("toeflScore"));
		double gpa =Double.parseDouble(request.getParameter("gpa"));
		AcademicRecord academicRecord = new AcademicRecord();
		StudentInformation student = stdDao.getStudentByID(studentID);
		
		if(student.getAcademics() != null)
		{
			academicRecord = student.getAcademics();
		}
		
		//adding data to academic record
		academicRecord.setToeflScore(toeflScore);
		academicRecord.setGreScore(greScore);
		academicRecord.setGpa(gpa);
		academicRecord.setTranscript(filename);
		academicRecord = academicDao.addAcademicRecord(academicRecord);
		
		//add to above record to student information
		student.setAcademics(academicRecord);
		student = stdDao.addStudent(student);
		
		//uploading file
		ServletContext context = session.getServletContext();
		String path = context.getRealPath("/WEB-INF/files");
		transcript.transferTo(new File ( new File(path), transcript.getOriginalFilename()));
		
		//setting return values, academic record
		models.put("academicRecord", academicRecord);
		return "/student/AcademicRecord";
    }
	
}
