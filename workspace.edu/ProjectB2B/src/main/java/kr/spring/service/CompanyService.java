package kr.spring.service;

import java.util.List;

import kr.spring.entity.Company;

public interface CompanyService {
	
	public List<Company> getList(); // 게시글 전체조회

	public Company get(String idx);

	
}







