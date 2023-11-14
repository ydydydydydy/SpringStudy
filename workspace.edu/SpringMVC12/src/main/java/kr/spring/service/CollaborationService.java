package kr.spring.service;

import java.util.List;

import kr.spring.entity.tb_company;
import kr.spring.entity.tb_request;

public interface CollaborationService {
   
   public void request(tb_request vo);
   public List<tb_request> getList(String username);
   
public static tb_request get(Long req_num) {
	// TODO Auto-generated method stub
	return null;
	}
   
}