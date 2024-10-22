package com.playstore.UserModule.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playstore.UserModule.exception.UserAlreadyExistsException;
import com.playstore.UserModule.exception.UserNotFoundException;
import com.playstore.UserModule.exception.UserUpdateFailedException;
import com.playstore.UserModule.exception.UserDeletionFailedException;
import com.playstore.UserModule.model.User;
import com.playstore.UserModule.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	UserRepository userRepository;
	
	public User register(User user) {
		if (userRepository.findByEmail(user.getEmail()).isPresent()) {
			throw new UserAlreadyExistsException("User with email " + user.getEmail() + " already exists");
		}
		try {
			return userRepository.save(user);
		} catch (Exception e) {
			throw new RuntimeException("Failed to register user: " + e.getMessage());
		}
	}
	
	public User login(String email, String password) {
		User user = userRepository.findByEmail(email)
			.orElseThrow(() -> new UserNotFoundException("User not found with email: " + email));
		if (!user.getPassword().equals(password)) {
			throw new UserNotFoundException("Invalid password");
		}
		return user;
	}
	
	public void update(User user) {
		Optional<User> existingUserWithEmail = userRepository.findByEmail(user.getEmail());
		if (existingUserWithEmail.isPresent() && !existingUserWithEmail.get().getId().equals(user.getId())) {
			throw new UserAlreadyExistsException("User with email " + user.getEmail() + " already exists");
		}
		try {
			userRepository.save(user);
		} catch (Exception e) {
			throw new UserUpdateFailedException("Failed to update user: " + e.getMessage());
		}
	}
	
	public void delete(User user) {
		try {
			userRepository.delete(user);
		} catch (Exception e) {
			throw new UserDeletionFailedException("Failed to delete user: " + e.getMessage());
		}
	}
}
