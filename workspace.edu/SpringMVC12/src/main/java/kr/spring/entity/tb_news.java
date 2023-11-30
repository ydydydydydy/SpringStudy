package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.sun.istack.NotNull;

import lombok.Data;
import lombok.NonNull;
import lombok.ToString;

@Entity
@Data
@ToString
public class tb_news {

   @Id
   private String news_num; // 뉴스번호
   
   @Column(nullable = false)
   private String news_id;
   @Column(nullable = true)
   private String news_date;
   @Column(nullable = false)
   private String news_name;
   @Column(nullable = false)
   private String news_reporter;
   @Column(nullable = false)
   private String news_title;
   @Column(nullable = false)
   private String news_content;
   @Column(nullable = false)
   private String news_url;

}










