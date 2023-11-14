package kr.spring.service;

import java.util.List;
import kr.spring.entity.tb_company;

public interface CompanyService {
    List<tb_company> getList(); // 게시글 전체조회

    List<tb_company> searchByCompanyName(String companyName); // 기업명으로 검색
}