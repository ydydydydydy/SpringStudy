package kr.spring.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kr.spring.entity.Criteria;
import kr.spring.entity.tb_company;
import kr.spring.repository.CompanyRepository;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    @Override
    public List<tb_company> getList() {
        return companyRepository.findAll();
    }

    @Override
    public List<tb_company> searchByCompanyName(String companyName) {
        return companyRepository.findCom_NameByContaining(companyName);
    }
    
    @Override
    public long totalCount() {
        return companyRepository.count();
    }

    @Override
    public List<tb_company> getList(Criteria cri) {
        Pageable pageable = PageRequest.of(cri.getPage() - 1, cri.getPerPageNum()); // 페이지 번호를 0부터 시작하므로 1을 빼줌
        Page<tb_company> page = companyRepository.findAll(pageable);
        return page.getContent(); // getContent()로 실제 데이터를 가져옴
    }

	@Override
	public Page<tb_company> findPagedData(Pageable pageable) {
		// TODO Auto-generated method stub
		return  companyRepository.findAll(pageable);
	}
    
    
}