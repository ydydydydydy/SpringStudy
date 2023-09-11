<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
   <div class="container">
     <h2>Spring MVC02</h2>
     <div class="panel panel-default">
       <div class="panel-heading">Board</div>
       <div class="panel-body">
         <table class="table table-bordered table-hover">
            <tr class="active">
               <td>번호</td>
               <td>제목</td>
               <td>작성자</td>
               <td>작성일</td>
               <td>조회수</td>
            </tr>
            <tbody id="#view">
            <!-- 비동기 방식으로 가져온 게시글 나오게할 부분 -->
            
            
            </tbody>
         </table>         
      </div>
       <div class="panel-footer">스프링게시판 - 박병관</div>
     </div>
   </div>
   
   <script type="text/javascript">
      $(document).ready(function(){
         // HTML이 다 로딩되고나서 아래 코드실행
         loadList();
      });
   
   
      function loadList(){
         // 비동기방식으로 게시글 리스트 가져오기 기능
         // ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
         $.ajax({
            url : "boardList.do",
            type : "get",
            dataType : "json",
            success : makeView, // 콜백함수
            error : function() { alert("error"); }
         });
      }
      
      function makeView(data){
         console.log(data);
      }
   
   </script>
   
</body>
</html>












