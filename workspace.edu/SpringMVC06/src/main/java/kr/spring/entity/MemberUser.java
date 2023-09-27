package kr.spring.entity;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Data

public class MemberUser extends User{  // User 클래스는 -> UserDetails 클래스를 상속받음
	// Spring Security에 Member 객체를 담을 수 있게 해주는 클래스
	
	private Member member;
	
	public MemberUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		// MemberUser 객체 생성시 아이디, 비밀번호, 권한을 입력받는다
		// 실제로 우리는 이 생성자를 사용하지 않는다
		// 그럼에도 구현한 이유는? 추상메소드라서 어쩔 수 없이 구현해야 한다
		super(username, password, authorities);  // 부모에 있는 메서드
	}
	// 실제로 우리가 사용할 생성자
	public MemberUser(Member mvo) {
		// User 클래스의 생성자를 사용해서 구현한다
		// 생성자 (아이디, 비밀번호, 권한을 넣어준다)
		super(mvo.getMemID(), mvo.getMemPassword(),
				/* User클래스의 생성자에 사용하는 권한정보는 */
				/* Collection<SimpleGrantedAuthority>로 변경해서 넣어야 함 */
				mvo.getAuthList().stream()  /* 바이트로 변경 */
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				/* List<Auth> -> Collection 안에 들어갈 수 있게 변경 */
				.collect(Collectors.toList())
				/* 최종 컬렉션 리스트로 변경 */
				);
		this.member = mvo;  // 나머지 계정 정보(나이, 성별..)을 member에 넣어줌
	}
}
