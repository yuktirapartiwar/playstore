package com.playstore.UserModule.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.playstore.UserModule.exception.UserAlreadyExistsException;
import com.playstore.UserModule.exception.UserNotFoundException;
import com.playstore.UserModule.exception.UserUpdateFailedException;
import com.playstore.UserModule.exception.UserDeletionFailedException;
import com.playstore.UserModule.model.Users;
import com.playstore.UserModule.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	UserRepository userRepository;

	@Autowired
	private JWTService jwtService;

	@Autowired
	AuthenticationManager authenticationManager;

	private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(12);
	
	public Users register(Users user) {
		if (userRepository.findByEmail(user.getEmail()).isPresent()) {
			throw new UserAlreadyExistsException("User with email " + user.getEmail() + " already exists");
		}
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		return userRepository.save(user);
	}
	
	public String authenticateAndGetToken(String email, String password) {
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email, password));
		if (authentication.isAuthenticated()) {
			return jwtService.generateToken(email);
		} else {
			throw new UserNotFoundException("Invalid user credentials");
		}
	}
	
	public Users getUserByEmail(String email) {
		return userRepository.findByEmail(email)
			.orElseThrow(() -> new UserNotFoundException("User not found with email: " + email));
	}
	
	public void update(Users user) {
		Optional<Users> existingUserWithEmail = userRepository.findByEmail(user.getEmail());
		if (existingUserWithEmail.isPresent() && !existingUserWithEmail.get().getId().equals(user.getId())) {
			throw new UserAlreadyExistsException("User with email " + user.getEmail() + " already exists");
		}
		try {
			userRepository.save(user);
		} catch (Exception e) {
			throw new UserUpdateFailedException("Failed to update user: " + e.getMessage());
		}
	}
	
	public void delete(Users user) {
		try {
			userRepository.delete(user);
		} catch (Exception e) {
			throw new UserDeletionFailedException("Failed to delete user: " + e.getMessage());
		}
	}
}
