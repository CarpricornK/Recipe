package com.cos.blog.repository;

import com.cos.blog.model.Declaration;
import com.cos.blog.model.Mealplan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface MealplanRepository extends JpaRepository<Mealplan, Integer> {

    Page<Mealplan> findAll(Pageable pageable);

    @Modifying(clearAutomatically = true)
    @Query(value = "DELETE FROM mealplan WHERE PlanDate = :date",
            nativeQuery = true)
    int DeleteMplan(@Param("date") String date);
}
