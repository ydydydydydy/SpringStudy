package kr.spring.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;

import com.sun.istack.NotNull;

import lombok.Data;
import lombok.NonNull;
import lombok.ToString;

@Entity
@Data
@ToString
public class Member {

   @Id
   private String username; // Spring Sequrity에서는 id가 아닌 username으로 지정
   
   @Column(nullable = false)
   private String password; // Spring Sequrity에서는 pw가 아닌 password로 지정
   
   @Column(nullable = false)
   private String businessNumber; // 사업자번호
   @Column(nullable = false)
   private String industry; //카테고리
   @Column(nullable = false)
   private String company; // 기업명
   
   @Enumerated(EnumType.STRING) // @Enumerated -> 열거형 (권한이 여러개이기 때문에)
   private Role role; // 권한정보
   

   

   
}










