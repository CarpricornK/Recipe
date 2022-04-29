package com.cos.blog.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.boot.context.properties.bind.Name;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder // 빌더 패턴
@Entity
public class Board {

	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 db의 넘버링 전략을 따라감
	private int ID; // auto_increment

	@JsonProperty(value="BOARD_TITLE")
	@Column(nullable = false, length = 100)
	private String BOARD_TITLE;

	@JsonProperty(value="BOARD_USERNAME")
	@Column(nullable = false, length = 100)
	private String BOARD_USERNAME; // 아이디

	@JsonProperty(value="BOARD_TYPE")
	@Column(length = 10)
	private String BOARD_TYPE; // 공지여부

	@JsonProperty(value="BOARD_CONTENT")
	@Lob // 대용량 데이터
	private String BOARD_CONTENT;// 섬머노트 라이브러리 <html>태그가 섞여서 디자인됨

	@JsonProperty(value="BOARD_COUNT")
	private int BOARD_COUNT; // 조회수

	@ManyToOne(fetch = FetchType.EAGER) // Many=board, User=One
	@JoinColumn(name = "USERID")
	private User user; // DB는 오브젝트를 저장할 수 없다. FK, 자바는 오브젝트를 저장할 수 있다.

	// EAGER 안치면 자동으로 LAZY
	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE) // mappedBy 연관관계의 주인이 아니다 (난
																							// FK가 아니에요) DB에 칼럼을 만들지 마세요
	@JsonIgnoreProperties({ "board" })
	@OrderBy("id desc")
	private List<Reply> replys;


	@CreationTimestamp
	private Timestamp BOARD_CDATE;

}
