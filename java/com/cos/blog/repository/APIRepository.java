package com.cos.blog.repository;

import com.cos.blog.model.Board;
import com.cos.blog.model.MongoDTO;
import org.bson.types.ObjectId;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;


public interface APIRepository extends MongoRepository<MongoDTO, ObjectId>{

    Page<MongoDTO> findByRcpNMContains(String search, Pageable pageable);
}