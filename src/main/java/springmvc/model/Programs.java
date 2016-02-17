package springmvc.model;

//Department Class is linked

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "programs")
public class Programs implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
	
	@Column(name = "program_name")
	private String programName;

	/*@OneToMany( targetEntity = Applications.class)
	private List<Applications> applications;*/
	
	@ManyToOne(targetEntity = Departments.class, cascade = CascadeType.ALL)
	private Departments department;
	
	public Departments getDepartment() {
		return department;
	}

	public void setDepartment(Departments department) {
		this.department = department;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	/*public List<Applications> getApplications() {
		return applications;
	}

	public void setApplications(List<Applications> applications) {
		this.applications = applications;
	}*/
	
	
	
}
