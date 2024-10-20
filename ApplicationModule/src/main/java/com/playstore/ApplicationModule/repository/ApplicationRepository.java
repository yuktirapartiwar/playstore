package com.playstore.ApplicationModule.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.playstore.ApplicationModule.model.Application;

@Repository
public interface ApplicationRepository extends JpaRepository<Application, Long>{

}
