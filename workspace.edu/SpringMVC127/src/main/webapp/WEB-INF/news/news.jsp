<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!-- 로그인한 계정정보 -->
<c:set var="user"
   value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth"
   value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />
<!DOCTYPE html>
<html lang="en">

<head>

<!-- <meta charset="utf-8"> -->
<title>DGital - Digital Agency HTML Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap"
   rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
   rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${cpath}/resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="${cpath}/resources/lib/owlcarousel/assets/owl.carousel.min.css"
   rel="stylesheet">
<link href="${cpath}/resources/lib/lightbox/css/lightbox.min.css"
   rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="${cpath}/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${cpath}/resources/css/style.css" rel="stylesheet">
<script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js"></script>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-tag-cloud.min.js"></script>
<style>
#myModal .modal-dialog {
  max-width: 50%; /* 모달 창 너비 */
  max-height: 80%; /* 모달 창 높이 */
  margin: 1.75rem auto;
}
#btn_original {
    font-size: 13px;
    border: none; /* 테두리 제거 */
    opacity: 70%;
    margin-bottom: 3px;
}
#news_pre{
width:100%;
overflow-x:hidden;
overflow-y:auto;
 white-space: pre-wrap; /* 줄 바꿈 허용 */
}


#myModal .news-view-body .img img {
  max-width: 100%; /* 이미지 최대 너비 */
  height: auto; /* 높이 자동 조정하여 비율 유지 */
  display: block;
  margin: 0 auto; /* 이미지 중앙 정렬 */
}

.modal-content{
    padding: 40px 45px 60px;
    min-width: 900px;
    border-radius: 10px;
    box-shadow: 4px 3px 12px 0 rgba(0, 0, 0, 0.42);
    border: solid 1px #707070;
    background-color: #ffffff;
    width:100%;
}
.news-view .provider img{
    height: 30px;
    vertical-align: top;
}
.news-view .caption{
    max-width: 80%;
    margin-left: auto;
    margin-right: auto;
}

img{
    vertical-align: middle;
}
.news-view .provider{
    margin-bottom: 2px;
}
#chkProviderImage img {
    width: 70px;  /* 이미지의 최대 너비를 부모 요소에 맞게 설정 */
    height: auto;     /* 이미지의 높이를 자동으로 조정하여 비율 유지 */
}
  .info {
    list-style: none;
    padding: 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
</style>
</head>

<body>
   <div class="container-xxl bg-white p-0">
      <!-- Spinner Start -->
      <div id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
         <div class="spinner-grow text-primary"
            style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
         </div>
      </div>
      <!-- Spinner End -->


      <!-- Navbar & Hero Start -->
      <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="${cpath}/home" class="navbar-brand p-0">
                    <h1 class="m-0">Bridge To Be</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                
                
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav mx-auto py-0">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">request</a>
                            <div class="dropdown-menu m-0">
                                <a href="${cpath}/collaboration/request" class="dropdown-item">신청하기</a>
                                <a href="${cpath}/collaboration/list" class="dropdown-item">신청내역</a>
                            </div>
                        </div>
                        <a href="${cpath}/company/list" class="nav-item nav-link">List</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0">
                               <a href="${cpath}/member/mypage" class="dropdown-item">MyPage</a>
                                <a href="${cpath}/member/update" class="dropdown-item">회원정보 수정</a>
                            </div>
                        </div>
                        <a href="${cpath}/news/news" class="nav-item nav-link">News</a>
                    </div>
                    <c:if test="${empty user}">
                    <a href="${cpath}/member/login" class="btn rounded-pill py-2 px-4 ms-3 d-none d-lg-block">Log in</a>
                    </c:if>
                    <c:if test="${not empty user}">
	                    <form action="${cpath}/member/logout">
	    					<button type="submit" class="btn rounded-pill py-2 px-4 ms-3 d-none d-lg-block">Log out</button>
	    				</form>
	    			</c:if>
                </div>
            </nav>

         <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
               <div class="row g-5 py-5">
                  <div class="col-12 text-center">
                     <h1 class="text-white animated slideInDown">News</h1>
                     <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                           <li class="breadcrumb-item"><a class="text-white" href="#">Keywords</a></li>
                           <li class="breadcrumb-item"><a class="text-white" href="#">News</a></li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Navbar & Hero End -->


      <!-- Keyword Start -->
      <div class="container-xxl py-5">
         <div class="container py-5 px-lg-5">
            <div class="wow fadeInUp" data-wow-delay="0.1s">
               <p class="section-title text-secondary justify-content-center">
                  <span></span>Keyword<span></span>
               </p>
               <h1 class="text-center mb-5">Month's Keywords</h1>
            </div>
            
            <!-- 워드클라우드 부분 -->
            <div class="row justify-content-center">
               <div class="col-lg-7">
                  <div class="wow fadeInUp" data-wow-delay="0.3s">
                     <p class="text-center mb-4">
                        콜라보(협력)에 대한 연관성(가중치, 키워드 빈도수)이 높은 키워드를 시각화하여 보여주는 서비스입니다.
                     </p>
                     <div class="chart-area">
                           <div id="container" style="width:100%; height:300px;"></div>
                     </div>
                  </div>
               </div>
            </div>
            
            <br>
            
            <!-- News Start -->
            <div class="wow fadeInUp" data-wow-delay="0.1s">
               <p class="section-title text-secondary justify-content-center">
                  <span></span>News<span></span>
               </p>
               <h1 class="text-center mb-5">Month's News</h1>
            </div>
            <br>
            
            <c:forEach var="vo" items="${list}" varStatus="i">
            <div class="news-item" data-id="07100501.20230814140022002">
            
               <div class="news-inner">
                  <div class="cont">
                  <a href="#" onclick="newsDetail(
                    '${vo.news_num}'
                  )" class="news-detail" title="팝업창이 열림">
                    <strong class="title">${vo.news_title}</strong><!-- 제목부분 -->
                  </a>



                     <div class="info">
                        <div>
                                  <a href="http://www.etnews.com/20230814000159" target="_blank" class="provider" data-toggle="tooltip" data-placement="bottom" title="원본 기사 보러가기">
                                      ${vo.news_name}
                                  </a>
                        <p class="name"></p>
                        </div>
                        <p class="name">${vo.news_reporter}</p>
                     </div>
                  </div>
               </div>
            </div>
            </c:forEach>
            
            
            
                 <!--  페이징 -->
            <div style="text-align: center;">
                  <ul class="pagination" style="display: inline-block;">

                     <!-- 이전버튼처리 -->
                     <c:if test="${pageMaker.prev}">
                        <li class="paginate_button previous"  style="display: inline-block; font-size: 24px;"><a
                           href="?page=${pageMaker.startPage - 1}">◀</a></li>
                     </c:if>

                     <!-- 페이지번호 처리 -->
                     <c:forEach var="pageNum" begin="${pageMaker.startPage}"
                        end="${pageMaker.endPage}">
                        <c:choose>
                           <c:when test="${pageMaker.cri.page == pageNum }">
                              <li class="paginate_button active"  style="display: inline-block; font-size: 32px; font-weight: bold;"><a
                                 href="?page=${pageNum}">${pageNum}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li class="paginate_button"  style="display: inline-block; font-size: 24px;"><a href="?page=${pageNum}" style="color: #848484;">${pageNum}</a></li>
                           </c:otherwise>
                        </c:choose>
                         <!-- 페이지 번호 사이에 공백 추가 -->
                          &nbsp;
                     </c:forEach>
                     <!-- 다음버튼처리 -->
                     <c:if test="${pageMaker.next}">
                        <li class="paginate_button previous"  style="display: inline-block; font-size: 24px;"><a
                           href="?page=${pageMaker.endPage + 1}">▶</a></li>
                     </c:if>

                  </ul>


                  <form action="${cpath}/company/list" id="pageFrm">
                     <input type="hidden" id="page" name="page"
                        value="${pageMaker.cri.page}"> <input type="hidden"
                        id="perPageNum" name="perPageNum"
                        value="${pageMaker.cri.perPageNum}">
                  </form>




               </div>
              
                <!--  페이징 끝 -->
                
            
            
            
            
               
   
         </div>
      </div>
      <!-- News End -->
      
      
      
      
      <!-- Modal Start -->
      <div class="modal" id="myModal">
      <div class="modal-dialog">
      <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
      <!-- modal-body -->
      <div class="modal-body">
         <div class="news-view">
            <div class="news-view-head">
               <p class="provider" id="chkProviderImage">
                  <img id="dynamicImage2" src="">
               </p>

               <h1 class="title" id="newsTitle"></h1>
               <div class="item1">
                  <div class="keyword-wp">
                     <!-- <span class="bullet-keyword"></span> -->
                  </div>
                  <ul class="info">
                     <li id="newsDate"></li>
                      <li id="newsReporter"></li>
                  </ul>
               </div>
               <div class="item2">
                  <div>
                            <button type="button" class="btn-original btn btn-xsm" id="btn_original">기사원문</button>
                  </div>
               </div>
            </div>
            <div class="news-view-body">
                  <div class="img">   
                     <img  id="dynamicImage" src=""  >    
                  </div>     
                  <br>
                  <div id="newsContent" >
                  
                  </div>             
                 </div>
            
         </div>
      </div>
      <!-- //modal-body -->
      
      
      
      
      
      
      
      
      
      
      <div class="modal-footer">
         <button type="button" class="btn btn-round btn-wh" data-bs-dismiss="modal">닫기</button>
      </div>
   </div>
   </div>
   </div>
      <!-- Modal End -->







      <!-- Footer Start -->
      <div class="container-fluid bg-primary text-light footer wow fadeIn"
         data-wow-delay="0.1s">
         <div class="container py-5 px-lg-5">
            <div class="row g-5">
               <div class="col-md-6 col-lg-3">
                  <p class="section-title text-white h5 mb-4">
                     Address<span></span>
                  </p>
                  <p>
                     <i class="fa fa-map-marker-alt me-3"></i>123 Street, New York,
                     USA
                  </p>
                  <p>
                     <i class="fa fa-phone-alt me-3"></i>+012 345 67890
                  </p>
                  <p>
                     <i class="fa fa-envelope me-3"></i>info@example.com
                  </p>
                  <div class="d-flex pt-2">
                     <a class="btn btn-outline-light btn-social" href=""><i
                        class="fab fa-twitter"></i></a> <a
                        class="btn btn-outline-light btn-social" href=""><i
                        class="fab fa-facebook-f"></i></a> <a
                        class="btn btn-outline-light btn-social" href=""><i
                        class="fab fa-instagram"></i></a> <a
                        class="btn btn-outline-light btn-social" href=""><i
                        class="fab fa-linkedin-in"></i></a>
                  </div>
               </div>
               <div class="col-md-6 col-lg-3">
                  <p class="section-title text-white h5 mb-4">
                     Quick Link<span></span>
                  </p>
                  <a class="btn btn-link" href="">About Us</a> <a
                     class="btn btn-link" href="">Contact Us</a> <a
                     class="btn btn-link" href="">Privacy Policy</a> <a
                     class="btn btn-link" href="">Terms & Condition</a> <a
                     class="btn btn-link" href="">Career</a>
               </div>
               <div class="col-md-6 col-lg-3">
                  <p class="section-title text-white h5 mb-4">
                     Gallery<span></span>
                  </p>
                  <div class="row g-2">
                     <div class="col-4">
                        <img class="img-fluid" src="${cpath}/resources/img/portfolio-1.jpg"
                           alt="Image">
                     </div>
                     <div class="col-4">
                        <img class="img-fluid" src="${cpath}/resources/img/portfolio-2.jpg"
                           alt="Image">
                     </div>
                     <div class="col-4">
                        <img class="img-fluid" src="${cpath}/resources/img/portfolio-3.jpg"
                           alt="Image">
                     </div>
                     <div class="col-4">
                        <img class="img-fluid" src="${cpath}/resources/img/portfolio-4.jpg"
                           alt="Image">
                     </div>
                     <div class="col-4">
                        <img class="img-fluid" src="${cpath}/resources/img/portfolio-5.jpg"
                           alt="Image">
                     </div>
                     <div class="col-4">
                        <img class="img-fluid" src="${cpath}/resources/img/portfolio-6.jpg"
                           alt="Image">
                     </div>
                  </div>
               </div>
               <div class="col-md-6 col-lg-3">
                  <p class="section-title text-white h5 mb-4">
                     Newsletter<span></span>
                  </p>
                  <p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi.
                     Curabitur facilisis ornare velit non vulpu</p>
                  <div class="position-relative w-100 mt-3">
                     <input class="form-control border-0 rounded-pill w-100 ps-4 pe-5"
                        type="text" placeholder="Your Email" style="height: 48px;">
                     <button type="button"
                        class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2">
                        <i class="fa fa-paper-plane text-primary fs-4"></i>
                     </button>
                  </div>
               </div>
            </div>
         </div>
         <div class="container px-lg-5">
            <div class="copyright">
               <div class="row">
                  <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                     &copy; <a class="border-bottom" href="#">Your Site Name</a>, All
                     Right Reserved.

                     <!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                     Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML
                        Codex</a><br>
                     <br> Distributed By a <a class="border-bottom"
                        href="https://themewagon.com" target="_blank">ThemeWagon</a>
                  </div>
                  <div class="col-md-6 text-center text-md-end">
                     <div class="footer-menu">
                        <a href="">Home</a> <a href="">Cookies</a> <a href="">Help</a> <a
                           href="">FQAs</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Footer End -->


      <!-- Back to Top -->
      <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i
         class="bi bi-arrow-up"></i></a>
   </div>

   <!-- JavaScript Libraries -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
   <script src="${cpath}/resources/lib/wow/wow.min.js"></script>
   <script src="${cpath}/resources/lib/easing/easing.min.js"></script>
   <script src="${cpath}/resources/lib/waypoints/waypoints.min.js"></script>
   <script src="${cpath}/resources/lib/counterup/counterup.min.js"></script>
   <script src="${cpath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
   <script src="${cpath}/resources/lib/isotope/isotope.pkgd.min.js"></script>
   <script src="${cpath}/resources/lib/lightbox/js/lightbox.min.js"></script>

   <!-- Template Javascript -->
   <script src="${cpath}/resources/js/main.js"></script>


</body>
<script>
anychart.onDocumentReady(function () {
   var data = [
       { "x": "MZ세대", "value": 57 },
       { "x": "피아니스트 8인", "value": 6 },
       { "x": "팝업스토어", "value": 77 },
       { "x": "삼성전자", "value": 48 },
       { "x": "롯데백화점", "value": 32 },
       { "x": "종근당건강", "value": 15 },
       { "x": "고객들", "value": 60 },
       { "x": "CU", "value": 54 },
       { "x": "맘키즈", "value": 10 },
       { "x": "디자", "value": 175 },
       { "x": "영재 피아니스트 2인", "value": 6 },
       { "x": "소비자들", "value": 31 },
       { "x": "디즈니", "value": 129 },
       { "x": "성원", "value": 13 },
       { "x": "락토핏", "value": 71 },
       { "x": "펄어비스", "value": 19 },
       { "x": "울산", "value": 65 },
       { "x": "Favorite", "value": 10 },
       { "x": "Sonatine", "value": 10 },
       { "x": "사람들", "value": 22 },
       { "x": "올리브영", "value": 17 },
       { "x": "극대화", "value": 12 },
       { "x": "예술 작품", "value": 9 },
       { "x": "대한민국", "value": 24 },
       { "x": "김해", "value": 39 },
       { "x": "이프랜드", "value": 20 },
       { "x": "LG전자", "value": 17 },
       { "x": "우리카드", "value": 24 },
       { "x": "진주", "value": 27 },
       { "x": "수원시음악협회", "value": 12 },
       { "x": "롯데칠성음료", "value": 11 }
   ];
    var chart = anychart.tagCloud(data);
    chart.angles([0]);
    chart.container("container");
    // chart.getCredits().setEnabled(false);
    chart.draw();
});

document.addEventListener("DOMContentLoaded", function() {
    // 여기에 newsDetail 함수와 이미지 설정 코드를 넣으세요.
});
function newsDetail(newsNum) {
   
    $.ajax({
         type: 'GET',
         url: '${cpath}/news/detail',
         data: { "newsNum": newsNum },
         success: function (data) {
             // 서버로부터 받아온 데이터를 출력
             console.log(data);
             $("#newsTitle").text(data.news_title);
            $("#newsDate").text(data.news_date);
            $("#newsReporter").text(data.news_reporter);
           
            $("#newsContent").html("<pre id='news_pre'>" + data.news_content + "</pre>");
            document.getElementById("btn_original").onclick = function() {
               openArticle(data.news_url);
            };
          
            const imageUrl = "https://www.bigkinds.or.kr/resources/images/"+data.news_id+"/"+ data.news_date+"/"+ data.news_num+".01.jpg";
            const imageUrl2 = "https://www.bigkinds.or.kr/images/nspIcon_"+data.news_id+".png";
            document.getElementById("dynamicImage2").src = imageUrl2;

            // 이미지가 존재하는지 확인
            var img = new Image();
            var img = new Image();
            img.onload = function () {
                console.log("이미지가 존재합니다.");
                document.getElementById("dynamicImage").style.display = "block";
                document.getElementById("dynamicImage").src = imageUrl;
            };
            img.onerror = function () {
                console.error("이미지가 존재하지 않습니다.");
                document.getElementById("dynamicImage").style.display = "none";
            };
            img.src = imageUrl;
            
   
          
           // 모달 보이기
           $("#myModal").modal("show");
         },
         error: function (error) {
             console.error('Error during search:', error);
         }
     });
 
   

    
   
   
}
function openArticle(url) {
    window.open(url, '_blank');
}


</script>

</html>