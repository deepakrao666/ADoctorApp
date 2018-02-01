package com.springMain.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springMain.dao.AdminDao;
import com.springMain.dao.AdminDaoImpl;
import com.springMain.modal.AdminModal;

@Service("AdminService")
public class AdminService {
	
	@Autowired
	AdminDaoImpl adminDao;

	@Transactional
	public void addAdmin(AdminModal admin) {
		adminDao.addAdmin(admin);
	}

	@Transactional
	public void updateAdmin(int id, AdminModal admin) {
		adminDao.updateAdmin(id,admin);
	}

	@Transactional
	public List<AdminModal> getAllAdmin() {
		return adminDao.getAllAdmins();
	}

	@Transactional
	public AdminModal getAdminById(int id) {
		return adminDao.getAdminById(id);
	}

	@Transactional
	public void deleteAdmin(int id) {
		adminDao.deleteAdmin(id);
	}

}
