package springmvc.model;

import java.io.Serializable;
import javax.persistence.*;

import javax.persistence.CascadeType;

@Entity
@Table(name = "academic_record")
public class AcademicRecord  implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@Column(name = "toefl_score")
	double toeflScore;
	
	@Column(name = "gre_score")
	double greScore;
	
	double gpa;
	
	String transcript;

	/*
	@OneToOne(cascade = CascadeType.ALL)
	private Applications applciation;
	
	public Applications getApplciation() {
		return applciation;
	}

	public void setApplciation(Applications applciation) {
		this.applciation = applciation;
	}*/
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getToeflScore() {
		return toeflScore;
	}

	public void setToeflScore(double toeflScore) {
		this.toeflScore = toeflScore;
	}

	public double getGreScore() {
		return greScore;
	}

	public void setGreScore(double greScore) {
		this.greScore = greScore;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public String getTranscript() {
		return transcript;
	}

	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}
	
}
