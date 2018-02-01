package com.springMain.modal;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name="DOC_LEAVE")
public class LeaveModal {
	
	@Id
	@Column(name="leave_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int leaveId;
	
	@Column(name="leave_is_approved")
	private String isApproved;
	
	@Column(name="leave_is_decided")
	private String isDecided;
	
	@Column(name="leave_admin_id")
	private String leaveAdminId;
	
	@Column(name="leave_doc_id")
	private String leaveDocId;
	
	@Type(type="date")
	@Column(name="leave_date")
	private Date leaveDate;

	public int getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(int leaveId) {
		this.leaveId = leaveId;
	}

	public String getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(String isApproved) {
		this.isApproved = isApproved;
	}

	public String getIsDecided() {
		return isDecided;
	}

	public void setIsDecided(String isDecided) {
		this.isDecided = isDecided;
	}

	public String getLeaveAdminId() {
		return leaveAdminId;
	}

	public void setLeaveAdminId(String leaveAdminId) {
		this.leaveAdminId = leaveAdminId;
	}

	public String getLeaveDocId() {
		return leaveDocId;
	}

	public void setLeaveDocId(String leaveDocId) {
		this.leaveDocId = leaveDocId;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public LeaveModal() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LeaveModal(int leaveId, String isApproved, String isDecided, String leaveAdminId, String leaveDocId,
			Date leaveDate) {
		super();
		this.leaveId = leaveId;
		this.isApproved = isApproved;
		this.isDecided = isDecided;
		this.leaveAdminId = leaveAdminId;
		this.leaveDocId = leaveDocId;
		this.leaveDate = leaveDate;
	}
	
	
	

}
