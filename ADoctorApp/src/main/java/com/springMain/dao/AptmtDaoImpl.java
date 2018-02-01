package com.springMain.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springMain.modal.AptmtModal;

@Repository("AptmtDao")
public class AptmtDaoImpl {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	// -- 
	
	public void addAptmt(AptmtModal aptmtModal) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(aptmtModal);
	}

	@SuppressWarnings("unchecked")
	public List<AptmtModal> getAllAptmts() {
		return (List<AptmtModal>) sessionFactory.getCurrentSession().createCriteria(AptmtModal.class).list();

	}

	public AptmtModal getAptmtById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		AptmtModal aptmtModal = (AptmtModal) session.get(AptmtModal.class, id);
		return aptmtModal;
	}

	public void deleteAptmt(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		AptmtModal aptmtModal = (AptmtModal) session.load(AptmtModal.class, new Integer(id));
		if (null != aptmtModal) {
			session.delete(aptmtModal);
		}

	}


}
