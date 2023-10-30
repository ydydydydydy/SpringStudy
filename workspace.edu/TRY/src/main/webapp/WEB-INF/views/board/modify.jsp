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
			<form id="frm" method="post" action="${cpath}/board/modify">
	    	<table class="table table-bordered">
	    		<tr>
	    			<td>번호</td>
	    			<td><input id="idx" readonly="readonly" value="${vo.idx}" name="idx" type="text" class="form-control"></td>
	    		</tr>
	    		<tr>
	    			<td>제목</td>
	    			<td><input id="title" value="<c:out value='${vo.title}'/>" class="form-control" name="title" type="text"></td>
	    		</tr>
	    		<tr>
	    			<td>내용</td>
	    			<td>
	    				<textarea id="content" name="content" class="form-control" rows="10" cols"" ><c:out value="${vo.content}" />${vo.content}</textarea>
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<td>작성자</td>
	    			<td><input id="writer" readonly="readonly" value="${vo.writer}" class="form-control" name="writer" type="text"></td>
	    		</tr>
	    		
	    		<tr>
	    			<td colspan="2" style="text-align: center;">
	    			
	    				<c:if test="${not empty mvo && mvo.memID eq vo.memID }">
	    					<button data-btn="modify" type="button" class="btn btn-sm btn-primary">수정</button>
	    					<button data-btn="remove" type="button" class="btn btn-sm btn-success">삭제</button>
	    				</c:if>
	    				
	    				<c:if test="${empty mvo or mvo.memID ne vo.memID }">  <!-- 로그인을 하지 않거나 작성자가 아닐 때-->
	    					<button disabled="disabled" type="submit" class="btn btn-sm btn-primary">수정</button>
	    					<button disabled="disabled" type="button" class="btn btn-sm btn-success">삭제</button>
	    				</c:if>
	    				
	    				<button data-btn="list" type="button" class="btn btn-sm btn-warning">목록</button>
	    			</td>
	    		</tr>
	    	</table>
	    		<input type="hidden" name="page" value="${cri.page}">
	    		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	    		
	    		<!-- type과 keyword를 넘기기위한 부분 추가 -->
                <input type="hidden" name="type" value="${cri.type}">
                <input type="hidden" name="keyword" value="${cri.keyword}">
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
				
				if(btn == "remove"){
					formData.attr("action","${cpath}/board/remove");
					formData.attr("method","get");
					
					formData.find("#title").remove();
					formData.find("#content").remove();
					formData.find("#writer").remove();
							
				}else if(btn == "list"){
					formData.attr("action","${cpath}/board/list");
					formData.find("#idx").remove();
					formData.attr("method","get");
					
					formData.find("#title").remove();
					formData.find("#content").remove();
					formData.find("#writer").remove();
					formData.find("#idx").remove();
					
				}else if(btn == "modify"){
					formData.attr("action","${cpath}/board/modify");
					formData.attr("method","post");
				}
				
				formData.submit();
				
			});
		});
	</script>
</body>
</html>


















