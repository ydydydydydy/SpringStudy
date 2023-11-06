package kr.spring.entity;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class Member {

	@Id
	private String username; // Spring Sequrity에서는 id가 아닌 username으로 지정
	
	private String password; // Spring Sequrity에서는 pw가 아닌 password로 지정
	
	@Enumerated(EnumType.STRING) // @Enumerated -> 열거형 (권한이 여러개이기 때문에)
	private Role role; // 권한정보
	
	private String name;  // 이름
	
	private boolean ebled; // 계정 활성화/비활성화 부분
	
}











