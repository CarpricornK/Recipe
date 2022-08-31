package com.cos.blog.repository;

import com.cos.blog.model.Board;
import com.cos.blog.model.RBoard;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Pageable;

public interface RBoardRepository extends JpaRepository<RBoard, Integer>{

    Page<RBoard> findAll(Pageable pageable);
    Page<RBoard> findByRBOARDTITLEContains(String word, Pageable pageable);
    Page<RBoard> findByRBOARDFTYPEContains(String CF, Pageable pageable);
    Page<RBoard> findByRBOARDCOUNTGreaterThanEqual(Integer count, Pageable pageable);
}