package springmvc.model;

//Department class linked here

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "additional_fields")

public class AdditionalFields implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "name_of_field")
	private String nameOfField;
	
	@Column(name = "field_type")
	private String fieldType;
	
	@Column(name = "required_optional")
	private String requiredOrOptional;
	
	@ManyToOne (targetEntity = Departments.class, cascade = CascadeType.ALL)
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

	public String getNameOfField() {
		return nameOfField;
	}

	public void setNameOfField(String nameOfField) {
		this.nameOfField = nameOfField;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public String getRequiredOrOptional() {
		return requiredOrOptional;
	}

	public void setRequiredOrOptional(String requiredOrOptional) {
		this.requiredOrOptional = requiredOrOptional;
	}
	
	
	
}
