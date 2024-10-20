package com.playstore.AdminModule.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playstore.AdminModule.model.Admin;
import com.playstore.AdminModule.repository.AdminRepository;

@Service
public class AdminService {
	@Autowired
	AdminRepository adminRepository;

//	Create new Admin Profile
	public Admin register(Admin admin) {
		adminRepository.save(admin);
		return admin;
	}

//	Login Admin Profile
	public Optional<Admin> login(String email, String password) {
		Optional<Admin> adminLoggedIn = adminRepository.findByEmail(email);
		if (adminLoggedIn.isPresent() && adminLoggedIn.get().getPassword().equals(password)) {
			return adminLoggedIn;
		}
		return Optional.empty();
	}
	
//	Update Admin Profile
	public void update(Admin admin) {
		adminRepository.save(admin);
	}
	
//	Delete Admin Profile
	public void delete(Admin admin) {
		adminRepository.delete(admin);
	}
}
