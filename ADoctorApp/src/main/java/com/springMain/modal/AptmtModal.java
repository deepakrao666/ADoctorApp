package com.springMain.modal;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="DOC_APTMT")
public class AptmtModal {
	@Id
	@Column(name="aptmt_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int aptmtId;
	
	@Column(name="aptmt_date")
	private Date aptmtDate;
	
	@Column(name="aptmt_start_time")
	private String aptmtStartTime;
	
	@Column(name="aptmt_end_time")
	private String aptmtEndTime;

	@Column(name="aptmt_is_active")
	private String aptmtIsActive;
	
	@Column(name="aptmt_is_booked")
	private String aptmtIsBooked;
	
	@Column(name="aptmt_doc_id")
	private int aptmtDocId;
	
	@Column(name="aptmt_pat_id")
	private int aptmtPatId;

	public int getAptmtId() {
		return aptmtId;
	}

	public void setAptmtId(int aptmtId) {
		this.aptmtId = aptmtId;
	}

	public Date getAptmtDate() {
		return aptmtDate;
	}

	public void setAptmtDate(Date aptmtDate) {
		this.aptmtDate = aptmtDate;
	}

	public String getAptmtStartTime() {
		return aptmtStartTime;
	}

	public void setAptmtStartTime(String aptmtStartTime) {
		this.aptmtStartTime = aptmtStartTime;
	}

	public String getAptmtEndTime() {
		return aptmtEndTime;
	}

	public void setAptmtEndTime(String aptmtEndTime) {
		this.aptmtEndTime = aptmtEndTime;
	}

	public String getAptmtIsActive() {
		return aptmtIsActive;
	}

	public void setAptmtIsActive(String aptmtIsActive) {
		this.aptmtIsActive = aptmtIsActive;
	}

	public String getAptmtIsBooked() {
		return aptmtIsBooked;
	}

	public void setAptmtIsBooked(String aptmtIsBooked) {
		this.aptmtIsBooked = aptmtIsBooked;
	}

	public int getAptmtDocId() {
		return aptmtDocId;
	}

	public void setAptmtDocId(int aptmtDocId) {
		this.aptmtDocId = aptmtDocId;
	}

	public int getAptmtPatId() {
		return aptmtPatId;
	}

	public void setAptmtPatId(int aptmtPatId) {
		this.aptmtPatId = aptmtPatId;
	}

	public AptmtModal() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AptmtModal(int aptmtId, Date aptmtDate, String aptmtStartTime, String aptmtEndTime, String aptmtIsActive,
			String aptmtIsBooked, int aptmtDocId, int aptmtPatId) {
		super();
		this.aptmtId = aptmtId;
		this.aptmtDate = aptmtDate;
		this.aptmtStartTime = aptmtStartTime;
		this.aptmtEndTime = aptmtEndTime;
		this.aptmtIsActive = aptmtIsActive;
		this.aptmtIsBooked = aptmtIsBooked;
		this.aptmtDocId = aptmtDocId;
		this.aptmtPatId = aptmtPatId;
	}
	
	
	
	
}
