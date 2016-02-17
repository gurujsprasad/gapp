package springmvc.model;

//no classed linking inside this

import java.io.Serializable;
import javax.persistence.*;
@Entity
@Table(name = "user_role")
public class UserRole implements Serializable  {

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
	
	private String role;

	/*@OneToMany(targetEntity = AppUsers.class)
	private List<AppUsers> users;
	*/
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
}
