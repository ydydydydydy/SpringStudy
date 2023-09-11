<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<form action="../boardUpdate.do" method="post">

				<input type="hidden" name="idx" value="${vo.idx}"> <!-- 서버로 데이터를 보내는데 겉으로는 보여주지 않을 때 -->
				<table class="table">
					<tr>
						<td>제목</td>
						<td><input value="${vo.title}" type="text" name="title" class="form-control"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea class="form-control" name="content" rows="7" cols="">${vo.content}</textarea></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input value="${vo.writer}" type="text" name="writer" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button class="btn btn-success btn-sm" type="submit">수정</button>
							<button class="btn btn-warning btn-sm" type="reset">취소</button>
							<a href="../boardList.do" class="btn btn-info btn-sm">목록</a>
						</td>
					</tr>					
				</table>
				</form>
				
			</div>
			<div class="panel-footer">스프링게시판 - 염다영</div>
		</div>
	</div>
</body>
</html>