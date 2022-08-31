package com.cos.blog.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

//@Data
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder // 빌더 패턴
//@Document(collection = "KamisDTO")

@Getter
@Setter
public class KamisDTO {

    String item_name;
    String item_code;
    String kind_name;
    String kind_code;
    String rank;
    String rank_code;
    String unit;
    String day1;
    String dpr1;
    String day2;
    String dpr2;
    String day3;
    String dpr3;
    String day4;
    String dpr4;
    String day5;
    String dpr5;
    String day6;
    String dpr6;
    String day7;
    String dpr7;
}

