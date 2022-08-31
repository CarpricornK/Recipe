package com.cos.blog.repository;

import java.util.Optional;

import com.cos.blog.model.RBoard;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.blog.model.Board;
import com.cos.blog.model.User;
import org.springframework.data.jpa.repository.Query;


public interface BoardRepository extends JpaRepository<Board, Integer>{

    Page<Board> findAll(Pageable pageable);
    Page<Board> findByBOARDTITLEContains(String word, Pageable pageable);

    Page<Board> findByBOARDCOUNTGreaterThanEqual(Integer count, Pageable pageable);
}