package com.springMain.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springMain.modal.LeaveModal;

@Repository("LeaveDao")
public class LeaveDaoImpl {
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	public void addLeave(LeaveModal leaveModal) {

		sessionFactory.getCurrentSession().saveOrUpdate(leaveModal);
	}

	@SuppressWarnings("unchecked")
	public List<LeaveModal> getAllLeaves() {
		return (List<LeaveModal>) sessionFactory.getCurrentSession().createCriteria(LeaveModal.class).list();

	}

	public LeaveModal getLeaveById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		LeaveModal leaveModal = (LeaveModal) session.get(LeaveModal.class, id);
		return leaveModal;
	}

	public void deleteLeave(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		LeaveModal leaveModal = (LeaveModal) session.load(LeaveModal.class, new Integer(id));
		if (null != leaveModal) {
			session.delete(leaveModal);
		}

	}

	public String approveLeave(int id) {
		sessionFactory.getCurrentSession().createQuery("UPDATE LeaveModal SET  LEAVE_IS_APPROVED = 'YES'"
													+ ", LEAVE_IS_DECIDED = 'YES'"
													+ " where LEAVE_ID = '"+id+"'").executeUpdate();
		return "Approved";
	}
	
	public String declineLeave(int id) {
		sessionFactory.getCurrentSession().createQuery("UPDATE LeaveModal SET  LEAVE_IS_APPROVED = 'NO'"
													+ ", LEAVE_IS_DECIDED = 'YES'"
													+ " where LEAVE_ID = '"+id+"'").executeUpdate();
		return "Declined";
	}
}
















