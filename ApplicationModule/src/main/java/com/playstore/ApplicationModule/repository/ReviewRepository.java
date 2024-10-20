package com.playstore.ApplicationModule.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.playstore.ApplicationModule.model.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long>{

}
