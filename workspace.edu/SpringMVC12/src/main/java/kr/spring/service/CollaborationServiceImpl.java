package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.entity.Company;
import kr.spring.entity.Request;
import kr.spring.repository.BoardRepository;
import kr.spring.repository.CompanyRepository;
import kr.spring.repository.CollaborationRepository;

@Service
public class CollaborationServiceImpl implements CollaborationService{

	@Autowired
	private CollaborationRepository collaborationRepository;

	@Override
	public void request(Request vo) {
		// TODO Auto-generated method stub
		collaborationRepository.save(vo);
		
	}

	
}











