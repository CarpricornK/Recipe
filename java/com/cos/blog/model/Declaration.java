package com.cos.blog.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder // 빌더 패턴
@Entity
public class Declaration {

	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 db의 넘버링 전략을 따라감
	private int ID; // auto_increment

	@JsonProperty(value="TITLE")
	@Column(nullable = false, length = 100)
	private String TITLE;

	@JsonProperty(value="CONTENT")
	@Lob // 대용량 데이터
	private String CONTENT;// 섬머노트 라이브러리 <html>태그가 섞여서 디자인됨

	@JsonProperty(value="HVAL")
	@Column(nullable = false, length = 100)
	private String HVAL;

	@JsonProperty(value="TYPE")
	@Column(nullable = false, length = 100)
	private String TYPE;

	@JsonProperty(value="NAME")
	@Column(nullable = false, length = 100)
	private String NAME;

	@JsonProperty(value="DDATE")
	@CreationTimestamp // 시간 자동 입력
	private Timestamp DDATE;


}
