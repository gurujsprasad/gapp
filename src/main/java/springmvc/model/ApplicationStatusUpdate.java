package springmvc.model;

import java.util.Date;
import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "application_status_update")
public class ApplicationStatusUpdate implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "updated_time")
	private Date updatedTime;
	
	private String comments;
	
	@ManyToOne
	private ApplicationStatus status;

	@ManyToOne(targetEntity = Users.class)
	private Users user;
	
	/*@ManyToOne //(targetEntity = Applications.class)
	private Applications application;*/
	
	public int getId() {
		return id;
	}

	public void setId(int id) {	
		this.id = id;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public ApplicationStatus getStatus() {
		return status;
	}

	public void setStatus(ApplicationStatus status) {
		this.status = status;
	}
}
