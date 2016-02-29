package springmvc.model;
import java.io.Serializable;
import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "educational_background")
public class EducationalBackground implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "college_name")
	private String collegeName;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "start_year")
	private Date startYear;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "end_year")
	private Date endYear;
	
	private String degree;
	
	private String major;

	//one student can have multiple college information.
	@ManyToOne
	private StudentInformation studentInfo;
	
	

	public StudentInformation getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentInformation studentInfo) {
		this.studentInfo = studentInfo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public Date getStartYear() {
		return startYear;
	}

	public void setStartYear(Date startYear) {
		this.startYear = startYear;
	}

	public Date getEndYear() {
		return endYear;
	}

	public void setEndYear(Date endYear) {
		this.endYear = endYear;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}
	
	
	
}
