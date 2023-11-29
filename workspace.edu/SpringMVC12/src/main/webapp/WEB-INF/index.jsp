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
<html>
<head>
<meta charset="utf-8">
<title>Bridge To Be</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="resources/img/favicon.ico" rel="icon">

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
<link href="resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="resources/lib/owlcarousel/assets/owl.carousel.min.css"
   rel="stylesheet">
<link href="resources/lib/lightbox/css/lightbox.min.css"
   rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">

<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

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

<%@include file="/WEB-INF/header.jsp"%>
   

         <div class="container-xxl bg-primary hero-header" style="
    padding-bottom: 150px;
    padding-top: 150px;
    margin-bottom: 0px;
">
            <div class="container px-lg-5">
               <div class="row g-5 align-items-end">
                  <div class="col-lg-6 text-center text-lg-start">
            
                  </div>
                  <div class="swiper mySwiper">
                     <div class="swiper-wrapper">
                      
                      <div class="swiper-slide" style="background : #0B0B3B; color:#fff;">
                         <div style="margin: 0px 0px 0px 100px;">
                            <h1 class="text-white mb-4 animated slideInDown">우리는 이러한 서비스를 합니다.</h1>
                           <p class="text-white pb-3 animated slideInDown">기업정보, 마케팅 대상, 의뢰하고 싶은 내용을 작성하세요. 그이후에 협업을 원하는 기업을 검색하고 자신의 기업과 협업을 원하는 의뢰 내용에 대한 결과 값을 확인할 수 있습니다.</p>
                        </div>
                     <div>
                        <img src="resources/img/swiper2.png" style="width:100%; height:100%;  margin: 0px 100px 0px 0px;">
                     </div>
                     </div>
                      <div class="swiper-slide" style="background : #0B0B3B; color:#fff; font-size:1.3em;" >
                       <div style="margin: 0px 0px 0px 50px;">
                          <h1 class="text-white mb-4 animated slideInDown">Special corporate matching B2B services</h1>
                        <p class="text-white pb-3 animated slideInDown">B2B 서비스란 기업이 제품이나 서비스를 다른 기업에 판매하거나 다양한 사업적 상호작용을 하는 서비스를 말합니다.</p>
                     </div>
                     <div>
                        <img src="resources/img/b2b.png" style="width:60%; height:60%;  margin: 0px 0px 0px 50px;"></div>
                     </div>
                      
                     </div>
                     <div class="swiper-button-next"></div>
                     <div class="swiper-button-prev"></div>
                     <div class="swiper-pagination"></div>
                   </div>
                   
               
                   
                   <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
               
                   <!-- Initialize Swiper -->
                   <script>
                     var swiper = new Swiper(".mySwiper", {
                       spaceBetween: 30,
                       centeredSlides: true,
                       autoplay: {
                         delay: 5000,
                         disableOnInteraction: false,
                       },
                       pagination: {
                         el: ".swiper-pagination",
                         clickable: true,
                       },
                       navigation: {
                         nextEl: ".swiper-button-next",
                         prevEl: ".swiper-button-prev",
                       },
                     });
               
                   </script>
               <!-- 스와이퍼슬라이드 종료 --> 
               </div>
               
            </div>
         </div>
            <div class="container-xxl py-5">
         <div class="container py-5 px-lg-5">
            <div class="row g-4">
               <div class="col-lg-4" data-wow-delay="0.1s">
                  <div class="feature-item bg-light rounded text-center p-4">
                     <img src="${cpath}/resources/img/collabo.png" style="width: 63px; height:57px;">
                     <br>
                     <br>
                     <h5 class="mb-3">협업하세요</h5>
                     <p class="m-0">우리의 플랫폼은 기업 간 협력의 이점을 파악하여, 회원님의 콜라보레이션에서 시너지를 창출해냅니다. </p>
                  </div>
               </div>
               <div class="col-lg-4 " data-wow-delay="0.3s">
                  <div class="feature-item bg-light rounded text-center p-4">
                     <i class="fa fa-3x fa-search text-primary mb-4"></i>
                     <h5 class="mb-3">결과를 검색하세요</h5>
                     <p class="m-0">원하는 결과를 검색해보세요. 기업의 이익을 상승시키는 사례를 찾아 검색어에 맞는 검색결과를 한눈에 알려드립니다!</p>
                  </div>
               </div>
               <div class="col-lg-4 " data-wow-delay="0.5s">
                  <div class="feature-item bg-light rounded text-center p-4">
                     <i class="fa fa-3x fa-laptop-code text-primary mb-4"></i>
                     <h5 class="mb-3">원하는 기업을 확인하세요</h5>
                     <p class="m-0">여러분의 기업과 협업을 원하는 기업을 찾아보세요! 다양한 기업 프로필을 살펴보고 목표에 부합하는 파트너 기업을 선택해 성공을 위한 첫걸음을 내딛어보세요.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Navbar & Hero End -->
      

      <!-- Feature Start -->
      <div class="container-xxl">
      	<img src="${cpath}/resources/img/b2bmain.png" style="max-width: 100%; height: auto;">
         <img src="${cpath}/resources/img/main1.png" style="width: 1200px; display: block; margin: 0 auto;">
         <img src="${cpath}/resources/img/main2.png" style="width: 1200px; display: block; margin: 0 auto;">
         <img src="${cpath}/resources/img/main3.png" style="width: 1200px; display: block; margin: 0 auto;">
      </div>          
      <!-- Feature End -->

      


      <!-- Facts Start -->
      <div class="container-xxl bg-primary fact py-5 wow fadeInUp"
         data-wow-delay="0.1s" style="visibility: visible;animation-delay: 0.1s;margin-top: 0px;">
         <div class="container py-5 px-lg-5">
            <div class="row g-4">
               <div class="col-md-6 col-lg-3 text-center wow fadeIn"
                  data-wow-delay="0.1s">
                  <i class="fa fa-certificate fa-3x text-secondary mb-3"></i>
                  <h1 class="text-white mb-2" data-toggle="counter-up">30000</h1>
                  <p class="text-white mb-0">30000건 이상의 뉴스데이터</p>
               </div>
               <div class="col-md-6 col-lg-3 text-center wow fadeIn"
                  data-wow-delay="0.3s">
                  <i class="fa fa-users-cog fa-3x text-secondary mb-3"></i>
                  <h1 class="text-white mb-2" data-toggle="counter-up">5</h1>
                  <p class="text-white mb-0">Team Members</p>
               </div>
               <div class="col-md-6 col-lg-3 text-center wow fadeIn"
                  data-wow-delay="0.5s">
                  <i class="fa fa-users fa-3x text-secondary mb-3"></i>
                  <h1 class="text-white mb-2" data-toggle="counter-up">3000</h1>
                  <p class="text-white mb-0">3000건 이상의 기업데이터</p>
               </div>
               <div class="col-md-6 col-lg-3 text-center wow fadeIn"
                  data-wow-delay="0.7s">
                  <i class="fa fa-check fa-3x text-secondary mb-3"></i>
                  <h1 class="text-white mb-2" data-toggle="counter-up">60</h1>
                  <p class="text-white mb-0">1분 안에 결과확인가능</p>
               </div>
            </div>
         </div>
      </div>
      <!-- Facts End -->


      
      <!-- Testimonial End -->


      <!-- Team Start -->
      <div class="container-xxl py-5">
         <div class="container py-5 px-lg-5">
            <div class="wow fadeInUp" data-wow-delay="0.1s">
               <p class="section-title text-secondary justify-content-center">
                  <span></span>Our Team<span></span>
               </p>
               <h1 class="text-center mb-5">Our Team Members</h1>
            </div>
            <div class="row g-4">
               <div class="col-lg-1 col-md-6 wow fadeInUp" data-wow-delay="0.1s" style="width: 12.499999995%; flex: 0 0 20%; max-width: 20%;">
                  <div class="team-item bg-light rounded">
                     <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4"
                           src="resources/img/team-1.png" alt="">
                        <h5>이혁빈</h5>
                        <span>담당</span>
                     </div>
                     <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href=""><i
                           class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-twitter"></i></a> <a
                           class="btn btn-square mx-1" href=""><i
                           class="fab fa-instagram"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-linkedin-in"></i></a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-1 col-md-6 wow fadeInUp" data-wow-delay="0.3s" style="width: 12.499999995%; flex: 0 0 20%; max-width: 20%;">
                  <div class="team-item bg-light rounded">
                     <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4"
                           src="resources/img/park.png" alt="">
                        <h5>박한빈</h5>
                        <span>담당</span>
                     </div>
                     <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href=""><i
                           class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-twitter"></i></a> <a
                           class="btn btn-square mx-1" href=""><i
                           class="fab fa-instagram"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-linkedin-in"></i></a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-1 col-md-6 wow fadeInUp" data-wow-delay="0.5s" style="width: 12.499999995%; flex: 0 0 20%; max-width: 20%;">
                  <div class="team-item bg-light rounded">
                     <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4"
                           src="resources/img/team-3.png" alt="">
                        <h5>염다영</h5>
                        <span>담당</span>
                     </div>
                     <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href=""><i
                           class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-twitter"></i></a> <a
                           class="btn btn-square mx-1" href=""><i
                           class="fab fa-instagram"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-linkedin-in"></i></a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-1 col-md-6 wow fadeInUp" data-wow-delay="0.7s" style="width: 12.499999995%; flex: 0 0 20%; max-width: 20%;">
                  <div class="team-item bg-light rounded">
                     <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4"
                           src="resources/img/team-4.png" alt="">
                        <h5>이준영</h5>
                        <span>응원담당</span>
                     </div>
                     <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href=""><i
                           class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-twitter"></i></a> <a
                           class="btn btn-square mx-1" href=""><i
                           class="fab fa-instagram"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-linkedin-in"></i></a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-1 col-md-6 wow fadeInUp" data-wow-delay="0.9s" style="width: 12.499999995%; flex: 0 0 20%; max-width: 20%;">
                  <div class="team-item bg-light rounded">
                     <div class="text-center border-bottom p-4">
                        <img class="img-fluid rounded-circle mb-4"
                           src="resources/img/heo.png" alt="">
                        <h5>허연지</h5>
                        <span>담당</span>
                     </div>
                     <div class="d-flex justify-content-center p-4">
                        <a class="btn btn-square mx-1" href=""><i
                           class="fab fa-facebook-f"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-twitter"></i></a> <a
                           class="btn btn-square mx-1" href=""><i
                           class="fab fa-instagram"></i></a> <a class="btn btn-square mx-1"
                           href=""><i class="fab fa-linkedin-in"></i></a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Team End -->


      


      <!-- Back to Top -->
      <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i
         class="bi bi-arrow-up"></i></a>
<%@include file="/WEB-INF/footer.jsp"%>
   </div>
   <!-- JavaScript Libraries -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
   <script src="resources/lib/wow/wow.min.js"></script>
   <script src="resources/lib/easing/easing.min.js"></script>
   <script src="resources/lib/waypoints/waypoints.min.js"></script>
   <script src="resources/lib/counterup/counterup.min.js"></script>
   <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
   <script src="resources/lib/isotope/isotope.pkgd.min.js"></script>
   <script src="resources/lib/lightbox/js/lightbox.min.js"></script>

   <!-- Template Javascript -->
   <script src="resources/js/main.js"></script>
   
        
      <!-- Swiper JS -->
       <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
   
       <!-- Initialize Swiper -->
      
   
</body>
</html>