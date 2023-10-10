<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<h2>Spring Book</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Book</div>
			<div class="panel-body">
				<table id="boardList" class="table table-bordered table-hover">
					<tr class="active">
						<td>번호</td>
						<td>제목</td>
						<td>작가</td>
						<td>출판사</td>
						<td>ISBN</td>
						<td>보유도서수</td>
					</tr>
					<tbody id="view">
						<!-- 비동기 방식으로 가져온 게시글 나오게할 부분 -->
					</tbody>
				
					<tr>
						<td colspan="5">
							<button onclick="goForm()" class="btn btn-primary btn-sm">수정</button>
						</td>
					</tr>
				</table>
			</div>

			<!-- 글쓰기 폼 -->
			<div class="panel-body" id="wform" style="display: none">
				<!-- display:none 눈에 안 보이게 하는 코드 -->
				<form id="frm">
					<table class="table">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" class="form-control"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea class="form-control" name="content" rows="7"
									cols=""></textarea></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" name="writer" class="form-control"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button class="btn btn-success btn-sm" type="button"
									onclick="goInsert()">등록</button>
								<button class="btn btn-warning btn-sm" type="reset" id="fclear">취소</button>
								<button onclick="goList()" href="boardList.do"
									class="btn btn-info btn-sm">목록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>



			<div class="panel-footer">스프링게시판 - 염다영</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			// HTML이 다 로딩되고나서 아래 코드실행
			loadList();
		});

		function loadList() {
			// 비동기방식으로 게시글 리스트 가져오기 기능
			// ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
			$.ajax({
				url : "book/all",
				type : "get",
				dataType : "json",
				success : makeView, // 콜백함수
				error : function() {
					alert("error");
				}
			});
		}

		function makeView(data) {

			var listHtml = "";
			$
					.each(
							data,
							function(index, obj) {
								listHtml += "<tr>";
								listHtml += "<td>" + (index + 1) + "</td>";
								listHtml += "<td id='t" + obj.idx + "'>";
								listHtml += "<a href='javascript:goContent("
										+ obj.idx + ")'>"; // a태그 안에서 javascript 작동
								listHtml += obj.title;
								listHtml += "</a>";
								listHtml += "</td>";
								listHtml += "<td id='w" + obj.idx + "'>"
										+ obj.writer + "</td>";
								listHtml += "<td>" + obj.indate + "</td>";
								listHtml += "<td>" + obj.count + "</td>";
								listHtml += "</tr>";

								// 상세보기 화면
								listHtml += "<tr id='c"	+ obj.idx +	"' style='display : none'>";
								listHtml += "<td>내용</td>";
								listHtml += "<td colspan='4'>";
								listHtml += "<textarea id='ta" + obj.idx + "' readonly rows='7' class='form-control'>"; // readonly -읽기전용
								// listHtml += obj.content; 제목을 클릭하는 순간 보여주기 위해 주석처리
								listHtml += "</textarea>";

								// 수정 삭제 화면
								listHtml += "<br>";
								listHtml += "<span id='ub"+ obj.idx + "'>";
								listHtml += "<button onclick='goUpdateForm("
										+ obj.idx
										+ ")' class='btn btn-sm btn-success'>수정화면</button></span> &nbsp;";
								listHtml += "<button onclick='goDelete("
										+ obj.idx
										+ ")' class='btn btn-sm btn-warning'>삭제</button> &nbsp;";
								listHtml += "<td>";
								listHtml += "</tr>";
							});

			$("#view").html(listHtml);

			goList();

		}
		// goForm 함수를 만들어서 boardList는 감추고 wform은 보이게하기

		function goForm() {
			$("#boardList").css("display", "none");
			$("#wform").css("display", "block");
		}

		function goList() {
			$("#boardList").css("display", "table-row");
			$("#wform").css("display", "none");
		}

		function goInsert() {
			// 게시글 등록기능 - 비동기
			// title="안녕"&content"반가워"&writer="호두아빠"
			var fData = $("#frm").serialize();

			$.ajax({
				url : "board/new",
				type : "post",
				data : fData,
				success : loadList,
				error : function() {
					alert("error")
				}
			});

			$("#fclear").trigger("click");
		}


		function goDelete(idx) {
			$.ajax({
				url : "board/" + idx,
				type : "delete",
				data : {"idx" : idx},
				success : loadList,
				error : function() {
					alert("error");
				},
			});
		}

		function goUpdateForm(idx) {

			$("#ta" + idx).attr("readonly", false);

			var title = $("#t" + idx).text(); // 수정을 눌렀을 때 기존 제목이 남아있도록 -아래 value= '"+title+ "'까지
			var newTitle = "<input id='nt"+idx+"' value='" +title+ "' type='text' class='form-control' >";
			$("#t" + idx).html(newTitle);

			var writer = $("#w" + idx).text(); // 수정을 눌렀을 때 기존 제목이 남아있도록 -아래 value= '"+writle+ "'까지
			var newWriter = "<input id= 'nw"+idx+"' value='" +writer+ "' type='text' class='form-control' >";
			$("#w" + idx).html(newWriter);

			var newBtn = "<button onclick='goUpdate(" + idx
					+ ")' class='btn btn-primary btn-sm'>수정</button>";
			$("#ub" + idx).html(newBtn);

		}

		function goUpdate(idx) {
			var title = $("#nt" + idx).val();
			var content = $("#ta" + idx).val();
			var writer = $("#nw" + idx).val();

			$.ajax({
				url : "board/update",
				type : "put",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify({
					"num" : num,
					"title" : title,
					"writer" : writer,
					"company" : company,
					"isbn" : isbn,
					"count" : count
				}),
				success : loadList,
				error : function() { alert("error") }
			});

		}
		
	</script>

</body>
</html>




