package com.cos.blog.repository;

import com.cos.blog.model.Declaration;
import com.cos.blog.model.Mealplan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface MealplanRepository extends JpaRepository<Mealplan, Integer> {

    Page<Mealplan> findAll(Pageable pageable);
}
