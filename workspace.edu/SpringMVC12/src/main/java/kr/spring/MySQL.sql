select * from tb_user;
select * from tb_news;
select * from tb_article;
-- show full processlist;
-- kill 13480;
show tables;

-- url : jdbc:mysql://project-db-stu3.smhrd.com:3307/Insa4_Spring_final_1
-- id : Insa4_Spring_final_1
-- pw : aischool1

-- select * from company;

select
        company0_.business_number as business1_1_,
        company0_.addr as addr2_1_,
        company0_.company_name as company_3_1_,
        company0_.industry as industry4_1_,
        company0_.open_date as open_dat5_1_,
        company0_.representative_name as represen6_1_ 
    from
        company company0_

SHOW TABLES;

select * from tb_request;
ALTER TABLE tb_request ADD COLUMN is_paid BOOLEAN DEFAULT false;

delete from tb_user where username='admin2@naver.com';


UPDATE tb_user
SET com_name = '인공지능사관학교'
WHERE username = 'admin@naver.com';



describe tb_request;
