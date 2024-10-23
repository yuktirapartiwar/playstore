package com.playstore.UserModule.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.playstore.UserModule.model.Users;
import com.playstore.UserModule.model.UserPrincipal;
import com.playstore.UserModule.repository.UserRepository;

@Service
public class MyUserDetailsService implements UserDetailsService{

    @Autowired
    private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Users user = userRepository.findByEmail(email)
			.orElseThrow(() -> new UsernameNotFoundException("User not found with email: " + email));
		return new UserPrincipal(user);
	}

}
