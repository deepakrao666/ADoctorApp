package com.springMain.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DOC_DOC")
public class DoctorModal {
	
	@Id
	@Column(name="doc_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int docId;

	@Column(name="doc_uname")
	private String docUname;
	
	@Column(name="doc_password")
	private String docPassword;

	@Column(name="doc_fname")
	private String docFname;
	
	@Column(name="doc_Lname")
	private String docLname;
	
	@Column(name="doc_med_qual")
	private String docMedQual;
	
	@Column(name="doc_exp")
	private String docExp;
	
	@Column(name="doc_sp")
	private String docSp;

	public int getDocId() {
		return docId;
	}

	public void setDocId(int docId) {
		this.docId = docId;
	}

	public String getDocUname() {
		return docUname;
	}

	public void setDocUname(String docUname) {
		this.docUname = docUname;
	}

	public String getDocPassword() {
		return docPassword;
	}

	public void setDocPassword(String docPassword) {
		this.docPassword = docPassword;
	}

	public String getDocFname() {
		return docFname;
	}

	public void setDocFname(String docFname) {
		this.docFname = docFname;
	}

	public String getDocLname() {
		return docLname;
	}

	public void setDocLname(String docLname) {
		this.docLname = docLname;
	}

	public String getDocMedQual() {
		return docMedQual;
	}

	public void setDocMedQual(String docMedQual) {
		this.docMedQual = docMedQual;
	}

	public String getDocExp() {
		return docExp;
	}

	public void setDocExp(String docExp) {
		this.docExp = docExp;
	}

	public String getDocSp() {
		return docSp;
	}

	public void setDocSp(String docSp) {
		this.docSp = docSp;
	}

	public DoctorModal() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DoctorModal(int docId, String docUname, String docPassword, String docFname, String docLname,
			String docMedQual, String docExp, String docSp) {
		super();
		this.docId = docId;
		this.docUname = docUname;
		this.docPassword = docPassword;
		this.docFname = docFname;
		this.docLname = docLname;
		this.docMedQual = docMedQual;
		this.docExp = docExp;
		this.docSp = docSp;
	}
	
	
}
