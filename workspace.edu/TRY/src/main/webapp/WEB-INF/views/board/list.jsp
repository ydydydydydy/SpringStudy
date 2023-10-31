<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="${cpath}/resources/css/style.css">
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<!--  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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
                <!-- 여기에 게시글 출력해보세요 -->
                <c:forEach items="${list}" var="vo" varStatus="i">
                   <tr>
                      <td>${i.count}</td>
                      <td>
                      
                      <c:if test="${vo.boardAvailable == 0}">
                         <a href="javascript:alert('삭제된 게시글입니다')">  <!-- 위치이동 x -->
                         <c:if test="${vo.boardLevel > 0}">  <!-- 댓글 표현 -->
                            <c:forEach begin="0" end="${vo.boardLevel}" step="1">
                               <span style="padding-left: 15px"></span>
                            </c:forEach>
                            <i class="bi bi-arrow-return-right"></i>
                            [RE]
                         </c:if>
                         삭제된 게시물입니다.</a>
                      </c:if>
                      
                      <c:if test="${vo.boardAvailable > 0}">
                         <a class="move" href="${vo.idx}">
                         <c:if test="${vo.boardLevel > 0}">  <!-- 댓글 표현 -->
                            <c:forEach begin="0" end="${vo.boardLevel}" step="1">
                               <span style="padding-left: 15px"></span>
                            </c:forEach>
                            <i class="bi bi-arrow-return-right"></i>
                            [RE]
                         </c:if>
                         <c:out value="${vo.title}" />
                         </a>
                      </c:if>
                      
                      </td>
                      <td>${vo.writer}</td>
                      <td>
                         <fmt:formatDate value="${vo.indate}" pattern="yyyy-MM-dd"/>
                      </td>
                      <td>${vo.count}</td>
                   </tr>
                </c:forEach>
             </tbody>
             
             <c:if test="${not empty mvo}">
             <tr>
                <td colspan="5">
                   <button id="regBtn" class="btn btn-xs btn-info pull-right">글쓰기</button>
                </td>
             </tr>
             </c:if>
          </table>
          
          <!-- 검색 메뉴 -->
          <div style="text-align: center;">
          	<form class="form-inline" action="${cpath}/board/list" method="post">
   				<div class="container">
				  <div class="input-group mb-3">
    				<div class="input-group-append">
   					  <select name="type" class="form-control">
   						<option value="writer" ${pageMaker.cri.type=='writer'? 'selected' : ''}>이름</option>
   						<option value="title" ${pageMaker.cri.type=='title'? 'selected' : ''}>제목</option>
					    <option value="content" ${pageMaker.cri.type=='content'? 'selected' : ''}>내용</option>
  					  </select>
  				  	</div>
   				 <input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword }">
   				 <div class="input-group-append">
   				 <button type="submit" class="btn btn-success">검색</button>
   				 </div>
    			</div>
  			  </div>
			</form>
		 </div>
		 
		 <br>
          
          <!-- 페이징 START -->
          	<ul class="pagination justify-content-center">
          <!-- 이전버튼처리 -->
              <c:if test="${pageMaker.prev}">
                 <li class="paginate_button previous page-item">
                    <a class="page-link" href="${pageMaker.startPage-1}">◀</a>
                 </li>
              </c:if>
          <!-- 페이지번호 처리 -->
             <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <c:if test="${pageMaker.cri.page != pageNum }">
                   <li class="paginate_button page-item"><a class="page-link" href="${pageNum}">${pageNum}</a></li>
                </c:if>
                
                <c:if test="${pageMaker.cri.page == pageNum }">
                   <li class="paginate_button active page-item"><a class="page-link" href="${pageNum}">${pageNum}</a></li>
                </c:if>
             </c:forEach>
             <!-- 다음버튼처리 -->
             <c:if test="${pageMaker.next}">
                 <li class="paginate_button previous page-item">
                    <a class="page-link" href="${pageMaker.endPage+1}">▶</a>
                 </li>
              </c:if>
           </ul>
           <!-- END -->
           <form id="pageFrm" action="${cpath}/board/list" method="post">
              <input type="hidden" id="page" name="page" value="${pageMaker.cri.page}">           
              <input type="hidden" id="perPageNum" name="perPageNum" value="${pageMaker.cri.perPageNum}"> 
              <!-- type과 keyword를 넘기기위한 부분 추가 -->
              <input type="hidden" name="type" value="${pageMaker.cri.type}">
              <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
           </form>
				
				<div class="col-lg-3">
					<jsp:include page="right.jsp"/>
				</div>
			</div>
		</div>
    <div class="card-footer">스프링_염다영</div>
  </div>
    <script type="text/javascript">
      $(document).ready(function(){
         
         // 페이지 번호 클릭 시 이동하기
         var pageFrm = $("#pageFrm");
         // li태그 안에 a태그 값 가져와서 form태그에 적용시켜 페이지이동
         
         $(".paginate_button a").on("click", function(e){  // 부모가 paginate button을 가진 a태그를 클릭했을 때 작동(function)
            // e -> 현재 클릭한 a태그 요소 자체
            e.preventDefault(); // a태그의 href속성 작동 막기
            var page = $(this).attr("href"); // 클릭한 a태그의 href값 가져오기
            pageFrm.find("#page").val(page);
            pageFrm.submit();
         });
         
         // 상세보기 클릭 시 이동
         $(".move").on("click", function(e){
            e.preventDefault(); // a태그의 href속성 작동 막기
            var idx = $(this).attr("href");
            var tag = "<input type='hidden' name='idx' value='"+idx+"'>";
            pageFrm.append(tag);
            pageFrm.attr("action", "${cpath}/board/get");
            pageFrm.submit();
         });
         
         // 책검색 버튼이 클릭 되었을 때 처리
         $("#search").on("click", function(){
        	 var bookname = $("#bookname").val();
        	 if(bookname==""){
            	alert("책 제목을 입력하세요");
            	return false;
         	 }
        	 // kakao 책 검색 openAPI 연동하기
        	 
         });
         
    
         
         var result = "${result}";
         checkModal(result);
         
         
         $("#regBtn").click(function(){
            location.href="${cpath}/board/register";
         });
         
      });
      
      function checkModal(result){
         if(result == ''){
            return;
         }
         if(parseInt(result) > 0){
            $(".modal-body").text("게시글" + result + "번이 등록되었습니다.");
            $("#myMessage").modal("show");
         }
         
         
      }
      
   
   </script>
</body>
</html>


















