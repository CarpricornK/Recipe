package com.cos.blog.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class Reply {
	@Id //Primary key
	@GeneratedValue(strategy=GenerationType.IDENTITY)// 프로젝트에서 연결된 db의 넘버링 전략을 따라감
    private int id; //auto_increment

	@JsonProperty(value="REPLY_CONTENT")
	@Column(nullable = false,length = 200)
	private String REPLY_CONTENT;

	@JsonProperty(value="REPLY_USERNAME")
	@Column(length = 100)
	private String REPLY_USERNAME;

	@JsonProperty(value="REPLY_TYPE")
	@Column(length = 10)
	private String REPLY_TYPE;

	@JsonProperty(value="REPLY_NUM1")
	@Column(length = 10)
	private String REPLY_NUM1;

	@JsonProperty(value="BOARDID")
	@ManyToOne
	@JoinColumn(name="BOARDID")
	private Board board;
	
	@ManyToOne
	@JoinColumn(name="USERID")
	private User user;

	
	@CreationTimestamp
	private Timestamp REPLY_CDATE;
}
