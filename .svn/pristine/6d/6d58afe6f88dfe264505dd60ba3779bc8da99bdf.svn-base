package springmvc.model;

//additional_field and applications class is linked to this class

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "additional_field_values")
public class AdditionalFieldValues implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
	
	private String value;
	
	@ManyToOne(targetEntity = AdditionalFields.class)
	private AdditionalFields additionalField;
	
	/*@ManyToOne(cascade = CascadeType.ALL)
	private Applications application;*/

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public AdditionalFields getAdditionalField() {
		return additionalField;
	}

	public void setAdditionalField(AdditionalFields additionalField) {
		this.additionalField = additionalField;
	}

	/*public Applications getApplication() {
		return application;
	}

	public void setApplication(Applications application) {
		this.application = application;
	}*/

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
	
}
