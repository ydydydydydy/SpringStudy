package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.tb_company;
import kr.spring.repository.CompanyRepository;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyRepository companyRepository;

	@Override
	public List<tb_company> getList() {
		List<tb_company> list = companyRepository.findAll();
		return list;
	}

	
	
}











