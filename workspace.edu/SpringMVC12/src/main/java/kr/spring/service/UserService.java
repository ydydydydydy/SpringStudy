package kr.spring.service;

import java.util.List;

import kr.spring.entity.tb_user;

public interface UserService {
	
	public void join(tb_user vo);

	public boolean select(String username);

	public List<tb_user> getList(String username);
}







