package kr.spring.mapper;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j // 실행 결과를 콘솔창에 나오게 하기 위함
@RunWith(SpringJUnit4ClassRunner.class) // 실행하기 위해 스프링 컨테이너에 올리는 코드
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
	// root-context.xml 경로를 잡아주는 과정
public class DataSourceTest {
	// root-contest.xml이 이상없는지 test하는 클래스
	
	
}
