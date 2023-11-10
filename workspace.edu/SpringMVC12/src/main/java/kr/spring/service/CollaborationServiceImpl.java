package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.tb_company;
import kr.spring.entity.tb_request;
import kr.spring.repository.CompanyRepository;
import kr.spring.repository.CollaborationRepository;

@Service
public class CollaborationServiceImpl implements CollaborationService{

	@Autowired
	private CollaborationRepository collaborationRepository;

	@Override
	public void request(tb_request vo) {
		// TODO Auto-generated method stub
		collaborationRepository.save(vo);
		
	}

	
}











