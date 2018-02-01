package com.springMain.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * This is our model class and it corresponds to Customer table in database
 */
@Entity
@Table(name="DOC_ADMIN")
public class AdminModal{

	@Id
	@Column(name="admin_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int adminId;

	@Column(name="admin_name")
	private String adminName;
	
	@Column(name="admin_uname")
	private String adminUname;
	
	@Column(name="admin_password")
	private String adminPassword;

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminUname() {
		return adminUname;
	}

	public void setAdminUname(String adminUname) {
		this.adminUname = adminUname;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public AdminModal() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminModal(int adminId, String adminName, String adminUname, String adminPassword) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminUname = adminUname;
		this.adminPassword = adminPassword;
	}
	
	

	
}
