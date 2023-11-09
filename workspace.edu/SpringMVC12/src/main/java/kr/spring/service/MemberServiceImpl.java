package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.entity.Member;
import kr.spring.entity.Role;
import kr.spring.repository.BoardRepository;
import kr.spring.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void join(Member vo) {
		String encPw = vo.getPassword();
		vo.setPassword(passwordEncoder.encode(encPw));
		vo.setRole(Role.MEMBER);
		memberRepository.save(vo);
	}

	@Override
	public boolean select(String username) {
		return memberRepository.existsById(username);
	}
	
	

}











