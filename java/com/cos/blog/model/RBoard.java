package com.cos.blog.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder // 빌더 패턴
@Entity
public class RBoard {

	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 db의 넘버링 전략을 따라감
	private int ID; // auto_increment

	@JsonProperty(value="RBOARD_TITLE")
	@Column(nullable = false, length = 100)
	private String RBOARD_TITLE;

	@JsonProperty(value="RBOARD_USERNAME")
	@Column(nullable = false, length = 100)
	private String RBOARD_USERNAME; // 아이디

	@JsonProperty(value="RBOARD_CONTENT")
	@Lob // 대용량 데이터
	private String RBOARD_CONTENT;// 섬머노트 라이브러리 <html>태그가 섞여서 디자인됨

	@JsonProperty(value="RBOARD_COUNT")
	private int RBOARD_COUNT; // 조회수

	@JsonProperty(value="RBOARD_NM")
	private String RBOARD_NM; // 메뉴명

	@JsonProperty(value="RBOARD01")
	private String RBOARD01; // 만드는법

	@JsonProperty(value="RBOARD_IMG01")
	@Lob // 대용량 데이터
	private String RBOARD_IMG01; // 만드는법 이미지

	@JsonProperty(value="RBOARD02")
	private String RBOARD02; // 만드는법

	@JsonProperty(value="RBOARD_IMG02")
	@Lob // 대용량 데이터
	private String RBOARD_IMG02; // 만드는법 이미지

	@JsonProperty(value="RBOARD03")
	private String RBOARD03; // 만드는법

	@JsonProperty(value="RBOARD_IMG03")
	@Lob // 대용량 데이터
	private String RBOARD_IMG03; // 만드는법 이미지

	@JsonProperty(value="RBOARD04")
	private String RBOARD04; // 만드는법

	@JsonProperty(value="RBOARD_IMG04")
	@Lob // 대용량 데이터
	private String RBOARD_IMG04; // 만드는법 이미지

	@JsonProperty(value="RBOARD05")
	private String RBOARD05; // 만드는법

	@JsonProperty(value="RBOARD_IMG05")
	@Lob // 대용량 데이터
	private String RBOARD_IMG05; // 만드는법 이미지

	@JsonProperty(value="RBOARD06")
	private String RBOARD06; // 만드는법

	@JsonProperty(value="RBOARD_IMG06")
	@Lob // 대용량 데이터
	private String RBOARD_IMG06; // 만드는법 이미지

	@JsonProperty(value="RBOARD07")
	private String RBOARD07; // 만드는법

	@JsonProperty(value="RBOARD_IMG07")
	@Lob // 대용량 데이터
	private String RBOARD_IMG07; // 만드는법 이미지

	@JsonProperty(value="RBOARD08")
	private String RBOARD08; // 만드는법

	@JsonProperty(value="RBOARD_IMG08")
	@Lob // 대용량 데이터
	private String RBOARD_IMG08; // 만드는법 이미지

	@JsonProperty(value="RBOARD09")
	private String RBOARD09; // 만드는법

	@JsonProperty(value="RBOARD_IMG09")
	@Lob // 대용량 데이터
	private String RBOARD_IMG09; // 만드는법 이미지

	@JsonProperty(value="RBOARD10")
	private String RBOARD10; // 만드는법

	@JsonProperty(value="RBOARD_IMG10")
	@Lob // 대용량 데이터
	private String RBOARD_IMG10; // 만드는법 이미지








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
	private Timestamp RBOARD_CDATE;


}
