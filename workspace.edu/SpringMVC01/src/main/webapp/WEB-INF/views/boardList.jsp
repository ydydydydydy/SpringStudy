<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<h2>Spring MVC01</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Board</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover">  <!-- 마우스 올리면 반응 -->
					<tr class="active">  <!-- 색 넣기 -->
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
					<!-- model 안에 있는 list를 jstl을 활영하여 출력하시오 -->
					<!-- 그럼 model안에 값은 어떻게 가져오냐?! -->
					<!-- model은 request영역 안에 있다 -->
					<c:forEach items="${list}" var="vo" varStatus="i">
      				<tr>
						<td>${i.count}</td>
						<td><a href="boardContent.do?idx=${vo.idx}">${vo.title}</a></td>
						<td>${vo.writer}</td>
						<td>${fn:split( vo.indate, " ")[0]}</td> <!-- 작성 시간은 잘라내고 연도랑 날짜만 보여줌 -->
						<td>${vo.count}</td>
					</tr>
					</c:forEach>
				</table>
				
				<a href="boardForm.do" class="btn btn-primary btn-sm">글쓰기</a>  <!-- 버튼, 버튼색, 버튼 크기 -->
			
			</div>
			<div class="panel-footer">스프링게시판 - 염다영</div>
		</div>
	</div>
</body>
</html>