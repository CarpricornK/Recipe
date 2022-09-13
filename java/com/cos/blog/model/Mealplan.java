package com.cos.blog.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder // 빌더 패턴
@Entity
public class Mealplan {

	@Id // Primary key
	@GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 db의 넘버링 전략을 따라감
	private int PlanID; // auto_increment

	@JsonProperty(value="PlanTITLE")
	@Column(nullable = false, length = 100)
	private String PlanTITLE;

	@JsonProperty(value="PlanUSERNAME")
	@Column(nullable = false, length = 100)
	private String PlanUSERNAME; // 아이디

	@JsonProperty(value="PlanDate")
	@Column(nullable = false, length = 100)
	private String PlanDate; //

	@JsonProperty(value="PlanKcal")
	@ColumnDefault("0") //default 0
	private Integer PlanKcal;

	@JsonProperty(value="PlanNa")
	@ColumnDefault("0") //default 0
	private Integer PlanNa; //

	@JsonProperty(value="PlanPro")
	@ColumnDefault("0") //default 0
	private Integer PlanPro; //

	@JsonProperty(value="PlanCarb")
	@ColumnDefault("0") //default 0
	private Integer PlanCarb; //

	@CreationTimestamp
	private Timestamp PlanCDATE;

}
