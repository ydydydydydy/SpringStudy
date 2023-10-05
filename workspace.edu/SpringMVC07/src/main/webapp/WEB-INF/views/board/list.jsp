<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 줄바꿈 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/> <!-- cpath = contextPath -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>Spring MVC07</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Board</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="vo" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${vo.title}</td>
								<td>${vo.writer}</td>
								<td>
									<fmt:formatDate value="${vo.indate}" pattern="yyyy-MM-dd"/>
								</td>
								<td>${vo.count}</td>
							</tr>
						</c:forEach>
						
					</tbody>
					
					<tr>
						<td colspan="5">
							<button id="regBtn" class="btn btn-xs btn-info pull-right">글쓰기</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="panel-footer">스프링게시판 - 염다영</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#regBtn").click(function(){
				location.href="${cpath}/board/register";
			});
			
		});
	</script>
</body>
</html>