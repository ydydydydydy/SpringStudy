package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.ToString;

@Entity // Board VO가 Database Table로 만들때 설정
@Data
@ToString
public class Request { // VO <--- ORM ----> TABLE

	@Id // PK 의미    
	@Column(nullable = false)
	private String reqNum; // 사업자번호
	@Column(nullable = false)
//	@ManyToOne
//    @JoinColumn(name = "member", referencedColumnName = "username") // Adjust column names as needed
	private String username; //카테고리
	@Column(nullable = false)
	private String reuqest; // 기업명
	
}







