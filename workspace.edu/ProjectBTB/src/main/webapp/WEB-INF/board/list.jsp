<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />  


<!-- 로그인한 계정정보 -->
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />  
    <link rel="stylesheet" href="${cpath}/resources/css/back.css">
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>	
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68319702969941b5f16a6c6089998014"></script>
  
</head>
<body>
  
  <div class="card">
    <div class="card-header">
    	<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		    <h1>Spring MVC11</h1>
		    <p>Java -> HTML -> CSS -> JavaScript -> JSP&Servlet -> Spring F/W -> Spring Boot</p>
		  </div>
		</div>
    </div>
    <div class="card-body">
    	<div class="row">
    		<div class="col-lg-2">
    			<div class="card" style="min-height: 500px; max-height: 1000px;">
    				<div class="card-body">
    					<h4 class="card-title">
							<sec:authentication property="principal.member.name"/>
						</h4>
    					<p class="card-text">회원님 Welcome!</p>
    					<form action="${cpath}/member/logout">
    						<button type="submit" class="form-control btn btn-sm btn-primary">로그아웃</button>
    					</form>
    					
    					<br>
    					현재 권한 : <sec:authentication property="principal.member.role"/>
    					
    					<!-- 권한에 따른 화면구성 다르게 보여주기 -->
    					<sec:authorize access="hasRole('ADMIN')">
    						<button class="btn btn-info form-control">관리자페이지</button>
    						<br>
    						<br>
    						<button class="btn btn-success form-control">회원목록</button>
    						<br>
    						<br>
    						<button class="btn btn-warning form-control">개인정보수정</button>
    					</sec:authorize>
    					
    					<sec:authorize access="hasRole('MANAGER')">
    						<button class="btn btn-success form-control">회원목록</button>
    						<br>
    						<br>
    						<button class="btn btn-warning form-control">개인정보수정</button>
    					</sec:authorize>
    					
    					<sec:authorize access="hasRole('MEMBER')">
    						<button class="btn btn-warning form-control">개인정보수정</button>
    					</sec:authorize>
    					<br>
    					<br>
    					<button type="button" data-oper="list" class="btn btn-info form-control">게시글보기</button>
    					<br>
    					<br>
    					<button type="button" data-oper="book" class="btn btn-success form-control">도서검색</button>
    					<br>
    					<br>
    					<button type="button" data-oper="map" class="btn btn-warning form-control">지도검색</button>
    					
    					
    				</div>
    			</div>
    		</div>
    		<div  class="col-lg-5">
    			<div class="card" style="min-height: 500px; max-height: 1000px;">
    				<div class="card-body">
    					<table class="table table-bordered table-hover">
    						<thead>
    							<th>번호</th>
    							<th>제목</th>
    							<th>작성일</th>
    							<th>조회수</th>
    						</thead>
    						<tbody>
    							<c:forEach var="vo" items="${list}" varStatus="i">
    								<tr>
    									<td>${i.count}</td>
    									<td><a href="${vo.idx}">${vo.title}</a></td>
    									<td><fmt:formatDate value="${vo.indate}" pattern="yyyy-MM-dd" /> </td>
    									<td>${vo.count}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    		<div  class="col-lg-5">
    			<div class="card" style="min-height: 500px; max-height: 1000px;">
    				
    				<div class="card-body" id="board">
    					<form id="regForm" action="${cpath}/board/register" method="post">
    					
    						<input type="hidden" id="idx" name="idx" value="">
    						
    						<div class="form-group">
    							<label for="title">제목</label>
    							<input type="text" class="form-control" id="title" name="title" placeholder="Enter Title">
    						</div>
    						<div class="form-group">
    							<label for="content">내용</label>
    							<textarea id="content" name="content" class="form-control" placeholder="Enter Content" rows="7" cols=""></textarea>
    						</div>
    						<div class="form-group">
    							<label for="writer">작성자</label>
    							<input readonly="readonly" value="<sec:authentication property='principal.member.name' />" type="text" class="form-control" id="writer" name="writer" placeholder="Enter Writer">
    						</div>
    						<div id="regDiv">
	    						<button type="button" data-oper="register" class="btn btn-sm btn-primary">등록</button>
	    						<button type="button" data-oper="reset" class="btn btn-sm btn-warning">취소</button>
    						</div>
    						
    						<div id="updateDiv" style="display: none;">
    							<button class="btn btn-sm btn-primary" data-oper="list" type="button">목록</button>
    							<span id="update">
    							<button class="btn btn-sm btn-warning" data-oper="updateForm" type="button">수정</button>
    							</span>
    							<button class="btn btn-sm btn-success" data-oper="remove" type="button">삭제</button>
    						</div>
    						
    					</form>
    				</div>
    				
    				<div class="card-body" id="book" style="display: none;">
    					<h4>Book Search</h4>
    					<div class="input-group mb-3">
    						<input type="text" id="bookname" class="form-control" placeholder="Search">
    						<div class="input-group-append">
    							<button type="button" id="search" class="btn btn-secondary">GO</button>
    						</div>
    					</div>
    					<div id="bookList">
    					
    					</div>
    				</div>
    				
    				<div class="card-body" id="mapView" style="display: none;">
    					<h4>Map Search</h4>
    					<div class="input-group mb-3">
    						<input type="text" id="address" class="form-control" placeholder="Search">
    						<div class="input-group-append">
    							<button type="button" id="mapBtn" class="btn btn-secondary">GO</button>
    						</div>
    					</div>
    					<div id="map" style="width: 100%; height: 500px;">
    					
    					</div>
    				</div>
    				
    			</div>
    		</div>
    	</div>
    </div> 
    <div class="card-footer">스프링 - 박병관</div>
  </div>
  
  <script type="text/javascript">
  	$(document).ready(function(){
  		
  		$("#mapBtn").on("click", function(){
  			var address = $("#address").val();
  			if(address == ""){
  				alert("주소를 입력하세요");
  				return false;
  			}
  			$.ajax({
  				url : "https://dapi.kakao.com/v2/local/search/address.json",
  				headers : {"Authorization" : "KakaoAK a7886c989e578d945764d9d300f7a041"},
  				type : "get",
  				data : {"query" : address},
  				dataType : "json",
  				success : mapView,
  				error : function() { alert("error"); }
  			});
  		});  		
  		
  		var regForm = $("#regForm");
  		
  		$("button").on("click", function(){
  			
  			var oper = $(this).data("oper");
  			
  			if(oper == "register"){
  				regForm.submit();		
  			}else if(oper == "reset"){
  				regForm[0].reset();
  			}else if(oper == "list"){
  				console.log("dd");
  				location.href = "${cpath}/board/list";
  			}else if(oper == "remove"){
  				var idx = regForm.find("#idx").val();
  				location.href = "${cpath}/board/remove?idx="+idx;
  			}else if(oper == "updateForm"){
  				regForm.find("#title").attr("readonly", false);
  				regForm.find("#content").attr("readonly", false);
  				var upBtn = "<button onclick='goUpdate()' class='btn btn-sm btn-info' type='button'>수정완료</button>";
  				$("#update").html(upBtn);
  			}else if(oper == "book"){
  				$("#board").css("display", "none");
  				$("#book").css("display", "block");
  				$("#mapView").css("display", "none");
  				$("#book").val("");
  			}else if(oper == "map"){
  				$("#board").css("display", "none");
  				$("#book").css("display", "none");
  				$("#mapView").css("display", "block");
  			}
  			
  		});
  		
  		$("a").on("click",function(e){
  			
  			e.preventDefault();
  			var idx = $(this).attr("href");
  			
  			$.ajax({
  				url : "${cpath}/board/get",
  				type : "get",
  				data : {"idx" : idx},
  				dataType : "json",
  				success : printBoard,
  				error : function() { alert("error"); }
  			});
  		});
  		
  		$("#search").on("click",function(){
  			var bookname = $("#bookname").val();
  			if(bookname==""){
  				alert("책 제목을 입력하세요.");
  				return false;
  			}
  			
  			//"https://dapi.kakao.com/v3/search/book?target=title" \
  			//9af82c6bca549cc0697309bf17cab3c0
  			
  			$.ajax({
  				url : "https://dapi.kakao.com/v3/search/book?target=title",
  				headers : {"Authorization" : "KakaoAK a7886c989e578d945764d9d300f7a041" },
  				type : "get",
  				data : {"query" : bookname},
  				success : bookPrint,
  				error : function() { alert("error"); }
  			});
  			
  			
  		});
  		
  	});
  	
  	function printBoard(vo){
  		
  		var regForm = $("#regForm");
  		regForm.find("#title").val(vo.title);
  		regForm.find("#content").val(vo.content);
  		regForm.find("#writer").val(vo.writer);
  		
  		regForm.find("input").attr("readonly", true);
  		regForm.find("textarea").attr("readonly", true);
  		
  		$("#regDiv").css("display", "none");
  		$("#updateDiv").css("display", "block");
  		
  		regForm.find("#idx").val(vo.idx);
  		
  		if("${user.member.name}" == vo.writer){
  			$("button[data-oper='updateForm']").attr("disabled", false);
  			$("button[data-oper='remove']").attr("disabled", false);
  		}else{
  			$("button[data-oper='updateForm']").attr("disabled", true);
  			$("button[data-oper='remove']").attr("disabled", true);
  		}
  		
  	}
  	
  	function goUpdate(){
  		var regForm = $("#regForm");
  		regForm.attr("action", "${cpath}/board/modify");
  		regForm.submit();
  	}
  	
  	
  	function goList(){
  		location.href = "${cpath}/board/list";
  	}
  	
  	function bookPrint(data){
  		var bList = "<table class='table table-hover'>";
  		bList += "<thead>";
  		bList += "<tr>";
  		bList += "<th>책이미지</th>";
  		bList += "<th>책가격</th>";
  		bList += "</tr>";
  		
  		bList += "</thead>";
  		
  		$.each(data.documents, function(index, obj){
  			bList += "<tr>";
  			bList += "<td><a target='_blank'  href='"+obj.url+"'>";
  			bList += "<img src='" + obj.thumbnail+"' width='50px' height='60px' >";
  			bList += "</a><td>";
  			bList += "<td>" + obj.price+"원</td>";
  			bList += "</tr>";
  		});
  		
  		bList += "<tbody>";
  		$("#bookList").html(bList);
  	}
  	
  	
  	function mapView(data){
  		console.log(data);
  		 var x=data.documents[0].x; // 경도
		 var y=data.documents[0].y; // 위도
		 
		 console.log(y+"/"+x);
	  	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	  	    mapOption = { 
	  	        center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
	  	        level: 2 // 지도의 확대 레벨
	  	    };
	  	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	  	var map = new kakao.maps.Map(mapContainer, mapOption); 
	  	
	  	// 마커가 표시될 위치입니다 
	  	var markerPosition  = new kakao.maps.LatLng(y, x); 

	  	// 마커를 생성합니다
	  	var marker = new kakao.maps.Marker({
	  	    position: markerPosition
	  	});
	  	// 마커가 지도 위에 표시되도록 설정합니다
	  	marker.setMap(map);
	  	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	  	var iwContent = '<div style="padding:5px;"></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	  	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	  	// 인포윈도우를 생성합니다
	  	var infowindow = new kakao.maps.InfoWindow({
	  	    content : iwContent,
	  	    removable : iwRemoveable
	  	});

	  	// 마커에 클릭이벤트를 등록합니다
	  	kakao.maps.event.addListener(marker, 'click', function() {
	  	      // 마커 위에 인포윈도우를 표시합니다
	  	      infowindow.open(map, marker);  
	  	});
  		
  	}
  
  </script>
  
  
  
  

</body>
</html>
    
    
    
    