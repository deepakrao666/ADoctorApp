package com.springMain.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springMain.dao.PatientDaoImpl;
import com.springMain.modal.PatientModal;


@Service("PatientService")
public class PatientService {
	@Autowired
	PatientDaoImpl patDao;

	@Transactional
	public void addPat(PatientModal patientModal) {
		patDao.addPat(patientModal);
	}

	@Transactional
	public void updatePat(int id, PatientModal patientModal) {
		patDao.updatePat(id,patientModal);
	}

	@Transactional
	public List<PatientModal> getAllPat() {
		return patDao.getAllPat();
	}

	@Transactional
	public PatientModal getPatById(int id) {
		return patDao.getPatById(id);
	}

	@Transactional
	public void deletePat(int id) {
		patDao.deletePat(id);
	}
}
