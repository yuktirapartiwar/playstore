package com.playstore.UserModule.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.playstore.UserModule.model.User;

@Repository
<<<<<<< Updated upstream
public interface UserRepository extends JpaRepository<User, Long>{
	Optional<User> findByEmail(String email);
=======
public interface UserRepository extends JpaRepository<Users, Long>{
	Optional<Users> findByEmail(String email);
	Boolean existsByEmail(String email);
	// Users findByUsername(String username);
>>>>>>> Stashed changes
}
