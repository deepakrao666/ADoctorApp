package com.springMain.controller;

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

import com.springMain.modal.AdminModal;
import com.springMain.modal.LeaveModal;
import com.springMain.service.AdminService;
import com.springMain.service.LeaveService;

@RestController
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	LeaveService leaveService;

	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String hello() {
		return "hello";
	}

	@RequestMapping(value = "/loginAdmin", method = RequestMethod.POST)
	public String loginPat(@RequestBody AdminModal adminModal) {

		String uname = "Admin No user found";
		String pass = "wrong pass";

		List<AdminModal> listOfAdmins = adminService.getAllAdmin();
		ListIterator<AdminModal> itr = listOfAdmins.listIterator();

		while (itr.hasNext()) {
			AdminModal pm = itr.next();
			if (adminModal.getAdminUname().equals(pm.getAdminUname())) {
				uname = "good user";
				if (adminModal.getAdminPassword().equals(pm.getAdminPassword())) {
					pass = "right password";
				}
			}
		}

		return uname + " : " + pass;
	}
	
	@RequestMapping(value = "/getAllLeaves", method = RequestMethod.GET)
	public ResponseEntity<List<LeaveModal>> getAllLeaves() {
		
		List<LeaveModal> listOfLeaves = leaveService.getAllLeaves();
		return new ResponseEntity<List<LeaveModal>>(listOfLeaves, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/approveLeave/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
	public String approveLeave(@PathVariable("id") int id) {
		String approved = "NO"; 
		approved = leaveService.approveLeave(id);
		return approved+".";
	}
	
	@RequestMapping(value = "/declineLeave/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
	public String declineLeave(@PathVariable("id") int id) {
		String approved = "NO"; 
		approved = leaveService.declineLeave(id);
		return approved+".";
	}
	

	// BASIC
	// CRUD-----------------------------------------------------------------------------------------------------------
	@RequestMapping("getAdmin/{id}")
	public ResponseEntity<AdminModal> getAdminById(@PathVariable int id) {
		AdminModal adminModal = adminService.getAdminById(id);
		return new ResponseEntity<AdminModal>(adminModal, HttpStatus.OK);
	}

	@RequestMapping(value = "/getAllAdmin", method = RequestMethod.GET)
	public ResponseEntity<List<AdminModal>> getAllAdmin() {
		List<AdminModal> listOfAdmins = adminService.getAllAdmin();

		return new ResponseEntity<List<AdminModal>>(listOfAdmins, HttpStatus.OK);
	}

	@RequestMapping(value = "/addAdmin", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<List<AdminModal>> addCustomer(@RequestBody AdminModal adminModal) {

		adminService.addAdmin(adminModal);
		List<AdminModal> listOfAdmins = adminService.getAllAdmin();

		return new ResponseEntity<List<AdminModal>>(listOfAdmins, HttpStatus.OK);

	}

	@RequestMapping(value = "/updateAdmin/{id}", method = RequestMethod.PUT, headers = "Accept=application/json")
	public ResponseEntity<List<AdminModal>> updateAdmin(@RequestBody AdminModal adminModal,
			@PathVariable("id") int id) {

		adminService.updateAdmin(id, adminModal);
		List<AdminModal> listOfAdmins = adminService.getAllAdmin();
		return new ResponseEntity<List<AdminModal>>(listOfAdmins, HttpStatus.OK);
	}

	@RequestMapping(value = "/deleteAdmin/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
	public ResponseEntity<List<AdminModal>> deleteAdmin(@PathVariable("id") int id) {

		adminService.deleteAdmin(id);
		List<AdminModal> listOfAdmins = adminService.getAllAdmin();
		return new ResponseEntity<List<AdminModal>>(listOfAdmins, HttpStatus.OK);
	}

}
