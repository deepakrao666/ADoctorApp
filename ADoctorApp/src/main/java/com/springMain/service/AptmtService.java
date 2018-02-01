package com.springMain.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springMain.dao.AptmtDaoImpl;
import com.springMain.modal.AptmtModal;

@Service("AptmtService")
public class AptmtService {
	
	@Autowired
	AptmtDaoImpl AptmtDao;

	@Transactional
	public void addAptmt(AptmtModal AptmtModal) {
		AptmtDao.addAptmt(AptmtModal);
	}
	/*
	 * @Transactional public void updateDoc(int id, DoctorModal docModal) {
	 * AptmtDao.updateDoc(id,docModal); }
	 */

	@Transactional
	public List<AptmtModal> getAllAptmts() {
		return AptmtDao.getAllAptmts();
	}

	@Transactional
	public AptmtModal getAptmtById(int id) {
		return AptmtDao.getAptmtById(id);
	}

	@Transactional
	public void deleteAptmt(int id) {
		AptmtDao.deleteAptmt(id);
	}


}
