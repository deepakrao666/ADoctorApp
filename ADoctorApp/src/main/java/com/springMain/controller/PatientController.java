package com.springMain.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.springMain.modal.DoctorModal;
import com.springMain.modal.PatientModal;
import com.springMain.service.DoctorService;
import com.springMain.service.PatientService;

@RestController
public class PatientController {

	// have to implement UPDATE

	@Autowired
	PatientService patService;

	@Autowired
	DoctorService doctorService;

	@RequestMapping(value = "/loginPat", method = RequestMethod.POST)
	public String loginPat(@RequestBody PatientModal patientModal) {

		String uname = "Patiend No user found";
		String pass = "wrong pass";

		List<PatientModal> listOfPats = patService.getAllPat();
		ListIterator<PatientModal> itr = listOfPats.listIterator();

		while (itr.hasNext()) {
			PatientModal pm = itr.next();
			if (patientModal.getPatUname().equals(pm.getPatUname())) {
				uname = "good user";
				if (patientModal.getPatPassword().equals(pm.getPatPassword())) {
					pass = "right password";
				}
			}
		}

		return uname + " : " + pass;
	}

	@RequestMapping("getDocBySp/{sp}")
	public ResponseEntity<List<DoctorModal>> getDocById(@PathVariable String sp) {
		List<DoctorModal> listOfDocs = doctorService.getAllDocs();
		List<DoctorModal> SpListDoc = new ArrayList<DoctorModal>();
		ListIterator<DoctorModal> itr = listOfDocs.listIterator();

		while (itr.hasNext()) {
			DoctorModal pm = itr.next();
			if (pm.getDocSp().equals(sp)) {
				DoctorModal dm = new DoctorModal();
				dm = doctorService.getDocById(pm.getDocId());
				SpListDoc.add(dm);
			}
		}
		
		return new ResponseEntity<List<DoctorModal>>(SpListDoc, HttpStatus.OK);
	}

	// BASIC
	// CRUD-----------------------------------------------------------------------------------------------------------
	@RequestMapping("getPat/{id}")
	public ResponseEntity<PatientModal> getPatById(@PathVariable int id) {
		PatientModal patientModal = patService.getPatById(id);
		return new ResponseEntity<PatientModal>(patientModal, HttpStatus.OK);
	}

	@RequestMapping(value = "/getAllPat", method = RequestMethod.GET)
	public ResponseEntity<List<PatientModal>> getAllPat() {

		List<PatientModal> listOfPats = patService.getAllPat();
		return new ResponseEntity<List<PatientModal>>(listOfPats, HttpStatus.OK);
	}

	@RequestMapping(value = "/addPat", method = RequestMethod.POST)
	public ResponseEntity<List<PatientModal>> addPat(@RequestBody PatientModal patientModal) {
		patService.addPat(patientModal);

		List<PatientModal> listOfPats = patService.getAllPat();
		return new ResponseEntity<List<PatientModal>>(listOfPats, HttpStatus.OK);
	}

	@RequestMapping(value = "/deletePat/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
	public ResponseEntity<List<PatientModal>> deleteAdmin(@PathVariable("id") int id) {

		patService.deletePat(id);
		List<PatientModal> listOfPats = patService.getAllPat();
		return new ResponseEntity<List<PatientModal>>(listOfPats, HttpStatus.OK);
	}
}
