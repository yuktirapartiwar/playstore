package com.playstore.UserModule.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playstore.UserModule.model.User;
import com.playstore.UserModule.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	UserRepository userRepository;
	
	public User register(User user) {
		return userRepository.save(user);
	}
	
	public Optional<User> login(String email, String password) {
		Optional<User> userLoggingIn = userRepository.findByEmail(email);
		if(userLoggingIn.isPresent() && userLoggingIn.get().getPassword().equals(password)) {
			return userLoggingIn;
		}
		return Optional.empty();
	}
	
	public void update(User user) {
		userRepository.save(user);
	}
	
	public void delete(User user) {
		userRepository.delete(user);
	}
}
