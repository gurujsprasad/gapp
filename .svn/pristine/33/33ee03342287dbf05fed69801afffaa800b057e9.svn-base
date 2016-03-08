package springmvc.model;

//programs and student_info is linked to this class

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "applications")
public class Applications implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String term;
	
	@Column(name = "current_status")
	private String currentStatus;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Programs program; //program to which student is applying;
	
	@OneToMany
	@OrderBy("updatedTime desc")
	private List <ApplicationStatusUpdate> statusInfo; //status of the application;
	
	/*@ManyToOne(targetEntity = StudentInformation.class,cascade = CascadeType.ALL)
	private StudentInformation studentInfomration;*/
	
	/*@OneToOne(targetEntity = AcademicRecord.class)
	private AcademicRecord academics;*/
	
	
	@OneToMany(targetEntity = AdditionalFieldValues.class)
	private List<AdditionalFieldValues> additionalFieldValues;
	
	public String getCurrentStatus() {
		return currentStatus;
	}

	public void setCurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}

	public List<AdditionalFieldValues> getAdditionalFieldValues() {
		return additionalFieldValues;
	}

	public void setAdditionalFieldValues(List<AdditionalFieldValues> additionalFieldValues) {
		this.additionalFieldValues = additionalFieldValues;
	}

	////////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////////////////////////////////////////
	//Getter and setters starts here
	/*public StudentInformation getStudentInfomration() {
		return studentInfomration;
	}

	public void setStudentInfomration(StudentInformation studentInfomration) {
		this.studentInfomration = studentInfomration;
	}*/

	/*
	public AcademicRecord getAcademics() {
		return academics;
	}

	public void setAcademics(AcademicRecord academics) {
		this.academics = academics;
	}*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public Programs getProgram() {
		return program;
	}

	public void setProgram(Programs program) {
		this.program = program;
	}

	public List<ApplicationStatusUpdate> getStatusInfo() {
		return statusInfo;
	}

	public void setStatusInfo(List<ApplicationStatusUpdate> statusInfo) {
		this.statusInfo = statusInfo;
	}

}
