
package com.springMain.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springMain.modal.AdminModal;

@Repository("AdminDao")
public class AdminDaoImpl  {
	
	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	public void addAdmin(AdminModal admin) {
		try {

			sessionFactory.getCurrentSession().saveOrUpdate(admin);

		} catch (Exception e) {

			System.out.println("Add Admin failed");
			e.printStackTrace();
		}

	}

	public void updateAdmin(int id, AdminModal admin) {
		sessionFactory.getCurrentSession().createQuery("UPDATE AdminModal SET  ADMIN_NAME = '"+admin.getAdminName()+"' "
				+ ", ADMIN_UNAME = '"+admin.getAdminUname()+"' "
				+ ", ADMIN_PASSWORD = '"+admin.getAdminPassword()+"' "
				+ " WHERE ADMIN_ID = '" + id + "'").executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public List<AdminModal> getAllAdmins() {
		return (List<AdminModal>) sessionFactory.getCurrentSession().createCriteria(AdminModal.class).list();
		
	}

	public AdminModal getAdminById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		AdminModal admin = (AdminModal) session.get(AdminModal.class, id);
		return admin;
	}

	public void deleteAdmin(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		AdminModal admin = (AdminModal) session.load(AdminModal.class, new Integer(id));
		if (null != admin) {
			session.delete(admin);
		}

	}

}
