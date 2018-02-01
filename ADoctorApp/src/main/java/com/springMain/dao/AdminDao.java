package com.springMain.dao;

import java.util.List;

import com.springMain.modal.AdminModal;

public interface AdminDao {

	public void addAdmin(AdminModal admin) ;

	public void updateAdmin(AdminModal admin);

	public List<AdminModal> getAllAdmins();

	public AdminModal getAdminById(int id);

	public void deleteAdmin(int id);


}
