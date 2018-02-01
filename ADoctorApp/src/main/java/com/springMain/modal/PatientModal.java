package com.springMain.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DOC_PAT")
public class PatientModal {
	@Id
	@Column(name="pat_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int patId;
	
	@Column(name="pat_uname")
	private String patUname;
	
	@Column(name="pat_password")
	private String patPassword;

	@Column(name="pat_fname")
	private String patFname;
	
	@Column(name="pat_Lname")
	private String patLname;
	
	@Column(name="pat_email")
	private String patEmail;
	
	@Column(name="pat_address")
	private String patAddress;
	
	@Column(name="pat_phone")
	private String patPhone;

	public int getPatId() {
		return patId;
	}

	public void setPatId(int patId) {
		this.patId = patId;
	}

	public String getPatUname() {
		return patUname;
	}

	public void setPatUname(String patUname) {
		this.patUname = patUname;
	}

	public String getPatPassword() {
		return patPassword;
	}

	public void setPatPassword(String patPassword) {
		this.patPassword = patPassword;
	}

	public String getPatFname() {
		return patFname;
	}

	public void setPatFname(String patFname) {
		this.patFname = patFname;
	}

	public String getPatLname() {
		return patLname;
	}

	public void setPatLname(String patLname) {
		this.patLname = patLname;
	}

	public String getPatEmail() {
		return patEmail;
	}

	public void setPatEmail(String patEmail) {
		this.patEmail = patEmail;
	}

	public String getPatAddress() {
		return patAddress;
	}

	public void setPatAddress(String patAddress) {
		this.patAddress = patAddress;
	}

	public String getPatPhone() {
		return patPhone;
	}

	public void setPatPhone(String patPhone) {
		this.patPhone = patPhone;
	}

	public PatientModal() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PatientModal(int patId, String patUname, String patPassword, String patFname, String patLname,
			String patEmail, String patAddress, String patPhone) {
		super();
		this.patId = patId;
		this.patUname = patUname;
		this.patPassword = patPassword;
		this.patFname = patFname;
		this.patLname = patLname;
		this.patEmail = patEmail;
		this.patAddress = patAddress;
		this.patPhone = patPhone;
	}

	

	
}
