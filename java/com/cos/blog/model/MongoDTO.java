package com.cos.blog.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.persistence.Entity;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder // 빌더 패턴
@Document(collection = "MongoDTO")
public class MongoDTO {



    @Id
    String ID;


    String id2;

    @JsonProperty(value="user_nm")
    String user_nm; // 이름

    @JsonProperty(value="addr")
    String addr; // 주소

    Integer api_COUNT; // 조회수

    String email; // 이메일
    String aaa;
    String rcp_PARTS_DTLS;
    String rcp_WAY2;
    String rcp_SEQ;
    String info_NA;
    String info_WGT;
    String info_PRO;
    String info_FAT;
    String rcp_PAT2;
    String info_CAR;
    String info_ENG;
    String rcp_NM;
    String rcpNM;
    String att_FILE_NO_MK;
    String att_FILE_NO_MAIN;
    String manual_IMG01;
    String manual_IMG02;
    String manual_IMG03;
    String manual_IMG04;
    String manual_IMG05;
    String manual_IMG06;
    String manual_IMG07;
    String manual_IMG08;
    String manual_IMG09;
    String manual_IMG10;
    String manual_IMG11;
    String manual_IMG12;
    String manual_IMG13;
    String manual_IMG14;
    String manual_IMG15;
    String manual_IMG16;
    String manual_IMG17;
    String manual_IMG18;
    String manual_IMG19;
    String manual_IMG20;
    String manual01;
    String manual02;
    String manual03;
    String manual04;
    String manual05;
    String manual06;
    String manual07;
    String manual08;
    String manual09;
    String manual10;
    String manual11;
    String manual12;
    String manual13;
    String manual14;
    String manual15;
    String manual16;
    String manual17;
    String manual18;
    String manual19;
    String manual20;
}

