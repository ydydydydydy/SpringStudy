package kr.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import kr.spring.entity.tb_user;


public interface UserRepository extends JpaRepository<tb_user, String>{
	
	@Query("SELECT u FROM tb_user u WHERE u.username = :username")
	List<tb_user> findByUsername(@Param("username")String username);

}
