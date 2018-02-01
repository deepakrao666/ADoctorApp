package com.springMain.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springMain.dao.DoctorDaoImpl;
import com.springMain.modal.DoctorModal;

@Service("DoctorService")
public class DoctorService {
	
	@Autowired
	DoctorDaoImpl docDao;

	@Transactional
	public void addDoc(DoctorModal docModal) {
		docDao.addDoc(docModal);
	}

	@Transactional
	public void updateDoc(int id, DoctorModal docModal)  {
		docDao.updateDoc(id,docModal);
	}

	@Transactional
	public List<DoctorModal> getAllDocs()  {
		return docDao.getAllDocs();
	}

	@Transactional
	public  DoctorModal getDocById(int id) {
		return docDao.getDocById(id);
	}

	@Transactional
	public void deleteDoc(int id) {
		docDao.deleteDoc(id);
	}

}
