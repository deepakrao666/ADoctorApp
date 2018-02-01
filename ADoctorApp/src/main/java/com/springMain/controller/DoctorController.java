	package com.springMain.controller;
	
	import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.springMain.modal.AptmtModal;
import com.springMain.modal.DoctorModal;
import com.springMain.modal.LeaveModal;
import com.springMain.service.AptmtService;
import com.springMain.service.DoctorService;
import com.springMain.service.LeaveService;
	
	@RestController
	public class DoctorController {
	
		// have to implement UPDATE
	
		@Autowired
		DoctorService doctorService;
	
		@Autowired
		LeaveService leaveService;
	
		@Autowired
		AptmtService aptmtService;
	
		// APPOINTMENTS
		// -----------------------------------------------------------------------------
	
		@RequestMapping(value = "/setAptmt", method = RequestMethod.POST)
		public String setAptmt(@RequestBody AptmtModal aptmtModal) {
			
		
	
			return "Requested";
		}
		// LOGIN
		// -----------------------------------------------------------------------------
	
		@RequestMapping(value = "/loginDoc", method = RequestMethod.POST)
		public String loginPat(@RequestBody DoctorModal doctorModal) {
	
			String uname = "Doctor No user found";
			String pass = "wrong pass";
	
			List<DoctorModal> listOfDocs = doctorService.getAllDocs();
			ListIterator<DoctorModal> itr = listOfDocs.listIterator();
	
			while (itr.hasNext()) {
				DoctorModal pm = itr.next();
				if (doctorModal.getDocUname().equals(pm.getDocUname())) {
					uname = "good user";
					if (doctorModal.getDocPassword().equals(pm.getDocPassword())) {
						pass = "right password";
					}
				}
			}
	
			return uname + " : " + pass;
		}
	
		// APPLY FOR LEAVE
		// -----------------------------------------------------------------------------
	
		@RequestMapping(value = "/reqLeave", method = RequestMethod.POST)
		public String reqLeave(@RequestBody LeaveModal leaveModal) {
	
			System.out.println("date i/p is = "+leaveModal.getLeaveDate());
			leaveModal.setIsApproved("NO");
			leaveModal.setIsDecided("NO");
			leaveService.addLeave(leaveModal);
	
			return "Requested";
		}
	
		// BASIC
		// CRUD-----------------------------------------------------------------------------------------------------------
	
		@RequestMapping("getDocById/{id}")
		public ResponseEntity<DoctorModal> getDocById(@PathVariable int id) {
			DoctorModal doctorModal = doctorService.getDocById(id);
			return new ResponseEntity<DoctorModal>(doctorModal, HttpStatus.OK);
		}
	
		//@CrossOrigin
		@RequestMapping(value = "/getAllDocs", method = RequestMethod.GET)
		public ResponseEntity<List<DoctorModal>> getAllDoc() {
			List<DoctorModal> listOfDocs = doctorService.getAllDocs();
	
			return new ResponseEntity<List<DoctorModal>>(listOfDocs, HttpStatus.OK);
		}
		
		@RequestMapping(value = "/addDoc", method = RequestMethod.POST)
		public ResponseEntity<List<DoctorModal>> addDoc(@RequestBody DoctorModal doctorModal) {
			System.out.println("---------------addDocHit-------------------"+doctorModal.toString());
			
			doctorService.addDoc(doctorModal);
			List<DoctorModal> listOfDocs = doctorService.getAllDocs();
			return new ResponseEntity<List<DoctorModal>>(listOfDocs, HttpStatus.OK);
		}
	
		@RequestMapping(value = "/deleteDoc/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
		public ResponseEntity<List<DoctorModal>> deleteDoc(@PathVariable("id") int id) {
	
			doctorService.deleteDoc(id);
	
			List<DoctorModal> listOfDocs = doctorService.getAllDocs();
			return new ResponseEntity<List<DoctorModal>>(listOfDocs, HttpStatus.OK);
		}
	
	}
