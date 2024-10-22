package com.playstore.AdminModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playstore.AdminModule.exception.*;
import com.playstore.AdminModule.model.Admin;
import com.playstore.AdminModule.repository.AdminRepository;

@Service
public class AdminService {
	@Autowired
	AdminRepository adminRepository;

//	Create new Admin Profile
	public Admin register(Admin admin) {
		if (adminRepository.findByEmail(admin.getEmail()).isPresent()) {
			throw new AdminAlreadyExistsException("Admin with email " + admin.getEmail() + " already exists");
		}
		try {
			return adminRepository.save(admin);
		} catch (Exception e) {
			throw new RuntimeException("Failed to register admin: " + e.getMessage());
		}
	}

//	Login Admin Profile
	public Admin login(String email, String password) {
		Admin adminLoggedIn = adminRepository.findByEmail(email)
			.orElseThrow(() -> new AdminNotFoundException("Admin not found with email: " + email));
		
		if (!adminLoggedIn.getPassword().equals(password)) {
			throw new AdminNotFoundException("Invalid password");
		}
		
		return adminLoggedIn;
	}
	
//	Update Admin Profile
	public void update(Admin admin) {
		try {
			adminRepository.save(admin);
		} catch (Exception e) {
			throw new AdminUpdateFailedException("Failed to update admin: " + e.getMessage());
		}
	}
	
//	Delete Admin Profile
	public void delete(Admin admin) {
		try {
			adminRepository.delete(admin);
		} catch (Exception e) {
			throw new AdminDeletionFailedException("Failed to delete admin: " + e.getMessage());
		}
	}
}
