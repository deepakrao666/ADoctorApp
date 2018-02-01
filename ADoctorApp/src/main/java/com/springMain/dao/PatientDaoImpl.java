package com.springMain.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springMain.modal.AdminModal;
import com.springMain.modal.PatientModal;

@Repository("PatientDao")
public class PatientDaoImpl {

	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	public void addPat(PatientModal patientModal) {
			sessionFactory.getCurrentSession().saveOrUpdate(patientModal);
	}

	public void updatePat(int id, PatientModal patientModal) {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unchecked")
	public List<PatientModal> getAllPat() {
		return (List<PatientModal>) sessionFactory.getCurrentSession().createCriteria(PatientModal.class).list();
	}

	public PatientModal getPatById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		PatientModal patientModal = (PatientModal) session.get(PatientModal.class, id);
		return patientModal;
	}

	public void deletePat(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		PatientModal patientModal = (PatientModal) session.load(PatientModal.class, new Integer(id));
		if (null != patientModal) {
			session.delete(patientModal);
		}
		
	}

}
