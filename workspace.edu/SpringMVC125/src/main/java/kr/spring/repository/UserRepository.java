package kr.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.entity.tb_user;


public interface UserRepository extends JpaRepository<tb_user, String>{
	
	@Transactional
    void deleteByUsername(String username);
	
}
