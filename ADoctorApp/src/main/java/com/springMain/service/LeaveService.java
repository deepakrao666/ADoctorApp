package com.springMain.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springMain.dao.LeaveDaoImpl;
import com.springMain.modal.LeaveModal;

@Service("LeaveService")
public class LeaveService {
	@Autowired
	LeaveDaoImpl leaveDao;

	@Transactional
	public void addLeave(LeaveModal leaveModal) {
		leaveDao.addLeave(leaveModal);
	}
	/*
	 * @Transactional public void updateDoc(int id, DoctorModal docModal) {
	 * leaveDao.updateDoc(id,docModal); }
	 */

	@Transactional
	public List<LeaveModal> getAllLeaves() {
		return leaveDao.getAllLeaves();
	}

	@Transactional
	public LeaveModal getLeaveById(int id) {
		return leaveDao.getLeaveById(id);
	}

	@Transactional
	public void deleteLeave(int id) {
		leaveDao.deleteLeave(id);
	}

	@Transactional
	public String approveLeave(int id) {
		return leaveDao.approveLeave(id);
	}
	
	@Transactional
	public String declineLeave(int id) {
		return leaveDao.declineLeave(id);
	}

}
