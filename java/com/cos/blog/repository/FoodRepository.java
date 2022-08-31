package com.cos.blog.repository;

import com.cos.blog.model.FOOD;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;


public interface FoodRepository extends JpaRepository<FOOD, Integer>{

}