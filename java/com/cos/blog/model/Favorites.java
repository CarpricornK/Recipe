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
public class Favorites {

	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 db의 넘버링 전략을 따라감
	private int ID; // auto_increment

	@JsonProperty(value="FAVORITE_TITLE")
	@Column(nullable = false, length = 100)
	private String FAVORTIE_TITLE;

	@ManyToOne(fetch = FetchType.EAGER) // Many=board, User=One
	@JoinColumn(name = "BOARD_ID")
	private Board board; // DB는 오브젝트를 저장할 수 없다. FK, 자바는 오브젝트를 저장할 수 있다.

	@JsonProperty(value="FAVORITE_NAME")
	@Column(nullable = false, length = 100)
	private String FAVORTIE_NAME;

	private int FAVORITE_VALUE;


	@CreationTimestamp
	private Timestamp BOARD_CDATE;

}
