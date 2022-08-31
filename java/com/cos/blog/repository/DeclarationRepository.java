package com.cos.blog.repository;

import com.cos.blog.model.Board;
import com.cos.blog.model.Declaration;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface DeclarationRepository extends JpaRepository<Declaration, Integer>{

    Page<Declaration> findAll(Pageable pageable);
    Page<Declaration> findByHVALContains(Integer hval, Pageable pageable);
}