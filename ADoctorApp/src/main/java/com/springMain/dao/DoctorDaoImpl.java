package com.springMain.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springMain.modal.DoctorModal;

@Repository("DoctorDao")
public class DoctorDaoImpl {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	public void addDoc(DoctorModal docModal) {

		sessionFactory.getCurrentSession().saveOrUpdate(docModal);
	}

	public void updateDoc(int id, DoctorModal docModal) {
		// sessionFactory.getCurrentSession().createQuery("UPDATE AdminModal SET
		// ADMIN_NAME = '"+admin.getAdminName()+"' WHERE ADMIN_ID = '" + id +
		// "'").executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<DoctorModal> getAllDocs() {
		return (List<DoctorModal>) sessionFactory.getCurrentSession().createCriteria(DoctorModal.class).list();

	}

	public DoctorModal getDocById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		DoctorModal docModal = (DoctorModal) session.get(DoctorModal.class, id);
		return docModal;
	}

	public void deleteDoc(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		DoctorModal docModal = (DoctorModal) session.load(DoctorModal.class, new Integer(id));
		if (null != docModal) {
			session.delete(docModal);
		}

	}

}
