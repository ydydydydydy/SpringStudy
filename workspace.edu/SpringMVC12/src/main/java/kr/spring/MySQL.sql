SELECT * FROM member;
select * from company;
INSERT INTO company values("41345","광주 북구","북구청","공공기관","2021","허연지");
commit;

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

