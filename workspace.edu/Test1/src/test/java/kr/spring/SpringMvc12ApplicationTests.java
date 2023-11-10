package kr.spring;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import kr.spring.entity.Member;
import kr.spring.entity.Role;
import kr.spring.repository.MemberRepository;

@SpringBootTest
class SpringMvc12ApplicationTests {
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Test
	void contextLoads() {
		// 회원가입테스트
		Member m = new Member();
		m.setUsername("pcw");
		m.setPassword(passwordEncoder.encode("1234"));

		m.setRole(Role.MEMBER);
		memberRepository.save(m);
		
	}

}






