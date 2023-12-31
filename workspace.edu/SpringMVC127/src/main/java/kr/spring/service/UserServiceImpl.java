package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.spring.entity.Role;
import kr.spring.entity.tb_user;
import kr.spring.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void join(tb_user vo) {
		String encPw = vo.getPassword();
		vo.setPassword(passwordEncoder.encode(encPw));
		vo.setRole(Role.MEMBER);
		userRepository.save(vo);
	}
	 

	@Override
	public boolean select(String username) {
		return userRepository.existsById(username);
	}

	@Override
	public tb_user getList(String username) {
		return userRepository.findById(username).get();
	}

	@Override
	public tb_user update(tb_user vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void delete(String username) {
	    // username에 해당하는 사용자 정보를 삭제
	    userRepository.deleteById(username);
	}


	@Override
	public void checkPassword(String username, String password) {
		// TODO Auto-generated method stub
		
	}

}
