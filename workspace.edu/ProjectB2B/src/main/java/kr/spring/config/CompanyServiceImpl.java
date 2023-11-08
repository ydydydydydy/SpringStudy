package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.entity.Company;
import kr.spring.repository.BoardRepository;
import kr.spring.repository.CompanyRepository;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyRepository companyRepository;

	@Override
	public List<Company> getList() {
		List<Company> list = companyRepository.findAll();
		return list;
	}

	@Override
	public Company get(String idx) {
		Optional<Company> vo = companyRepository.findById(idx);
		return vo.get();
	}
	
}











