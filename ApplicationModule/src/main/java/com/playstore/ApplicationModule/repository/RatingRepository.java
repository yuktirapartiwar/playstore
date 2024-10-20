package com.playstore.ApplicationModule.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.playstore.ApplicationModule.model.Rating;

@Repository
public interface RatingRepository extends JpaRepository<Rating, Long>{

}
