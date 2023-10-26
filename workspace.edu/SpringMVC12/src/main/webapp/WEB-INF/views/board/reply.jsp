<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!--  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
  <link rel="stylesheet" href="${cpath}/resources/css/style.css">
  
</head>
<body>

  <div class="card">
    <div class="card-header">Header
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1>Spring Framework</h1>
				<p>HTML -> CSS -> JavaScript -> JSP&Servlet -> Spring Framework-> Sprint boot</p>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-lg-2">
					<jsp:include page="left.jsp" />
				</div>
				<div class="col-lg-7">
				          <form id="frm" method="post">
            <input type="hidden" name="page" value="${cri.page}">
            <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
            
            <!-- type과 keyword를 넘기기위한 부분 추가 (form태그 안 어디에 있든 상관X) -->
            <input type="hidden" name="type" value="${cri.type}">
            <input type="hidden" name="keyword" value="${cri.keyword}">
            
            <input id="memID" type="hidden" name="memID" value="${mvo.memID}">
            <!-- 부모글의 게시글 번호 -->
            <input id="idx" type="hidden" name="idx" value="${vo.idx}">
           
             <div class="form-group">
                <label>제목</label>
                <input id="title" value="<c:out value='${vo.title}' />" type="text" name="title" class="form-control">
             </div>
             
             <div class="form-group">
                <label>답변</label>
                <textarea id="content" class="form-control" name="content" rows="10" cols=""></textarea>
             </div>
          
             <div class="form-group">
                <label>작성자</label>
                <input id="writer" value="${mvo.memName}" readonly="readonly" type="text" name="writer" class="form-control">
             </div>
             
             <button data-btn="reply" type="button" class="btn btn-default btn-sm">답변</button>
             <button data-btn="reset" type="button" class="btn btn-default btn-sm">취소</button>
             <button data-btn="list" type="button" class="btn btn-default btn-sm">목록</button>
          
          
          </form>
				</div>
				<div class="col-lg-3">
					<jsp:include page="right.jsp"/>
				</div>
			</div>
		</div>
    <div class="card-footer">스프링_염다영</div>
  </div>
     <script type="text/javascript">
   // 링크처리
   $(document).ready(function(){
      $("button").on("click", function(e){
         var formData = $("#frm");
         var btn = $(this).data("btn");

         if(btn == "list"){
            formData.attr("action","${cpath}/board/list");
            formData.attr("method", "get");
            
            formData.find("#idx").remove();
            formData.find("#memID").remove();
            formData.find("#title").remove();
            formData.find("#content").remove();
            formData.find("#writer").remove();
            
         }else if(btn == "reply"){
            formData.attr("action","${cpath}/board/reply");
         }else if(btn == "reset"){
        	 formData[0].reset();
        	 return;
         }
         
         formData.submit();
         
      });
   });
   </script>
</body>
</html>


















