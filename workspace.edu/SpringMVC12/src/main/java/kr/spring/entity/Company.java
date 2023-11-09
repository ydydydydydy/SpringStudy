package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.ToString;

@Entity // Board VO가 Database Table로 만들때 설정
@Data
@ToString
public class Company { // VO <--- ORM ----> TABLE

	@Id // PK 의미    
	@Column(nullable = false)
	private String num; // 사업자번호
	@Column(nullable = false)
	private String industry; //카테고리
	@Column(nullable = false)
	private String companyName; // 기업명
	
//	private String openDate; // 개업일자
//	
//	private String representativeName; // 대표자명
	
	@Column(updatable = false) // 수정할때 작성자는 안바꿔 주겠다
	private String addr;  // 주소
	
	private String scale;
}








