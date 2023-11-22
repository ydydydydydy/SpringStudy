<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 로그인한 계정정보 -->
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />  
<!DOCTYPE html>
<html lang="en">

<head>

<style>
.content_wrapper{
min-height: 400px;
}
:root {
  --background-color: #fff;
  --selection-color: ;
}

html,
body {
  min-height: 100vh;
  background-color: var(--background-color);
}

html {
  font-size: 12px;
  box-sizing: border-box;
}

body {
  display: flex;
  flex-direction: column;
  align-items: center;
}

*,
*:before,
*:after {
  box-sizing: inherit;
}

a {
  color: inherit;
  text-decoration: none;
  
}

img,
svg {
  display: block;
  max-width: 100%;
  height: auto;
}

::selection {
  background: var(--selection-color);
  color: white;
  text-shadow: none;
}

:root {
  --background-color: #0B0B3B;
}

body {
  overflow: auto;
}

.wrapper {
  width: 100%;
  max-width: 650px;
  display: grid;
  grid-gap: 20px;
  margin: auto;
  grid-template-columns: repeat(6, 1fr);
  color: white;
}

.card {
  cursor: pointer;
  overflow: hidden;
  border-radius: 12px;
  background: white;
  margin: 0;
  grid-column: span 3;
  box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.017), 0 6.7px 5.3px rgba(0, 0, 0, 0.024), 0 12.5px 10px rgba(0, 0, 0, 0.03), 0 22.3px 17.9px rgba(0, 0, 0, 0.036), 0 41.8px 33.4px rgba(0, 0, 0, 0.043), 0 100px 80px rgba(0, 0, 0, 0.06);
  height: 190px;
  padding: 20px;
  display: flex;
  justify-content: flex-end;
  flex-direction: column;
  position: relative;
  
}

.card:after {
  content: "";
  display: block;
  width: 50px;
  height: 50px;
  background-image: url("https://assets.codepen.io/66496/card-smile.svg");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: contain;
  position: absolute;
  top: 20px;
  right: 20px;
  transition: 0.3s;
  transition-property: opacity, transform;
  opacity: 0;
  transform: translateY(10px);
  border: 1px solid transparent; /* 왼쪽 테두리 없애기 */
  
}

.card__heading,
.card__text {
  height: 24px;
  width: 100%;
  border-radius: 4px;
  background-color: var(--background-color);
  font-size: 14px;
  padding-left: 6px;
  padding-right: 6px;
  display: flex;
  align-items: center;
  letter-spacing: 1px; /* 글자 간격을 조절할 수 있습니다. */
}

.card__heading {
  opacity: 0.5;
  width: fit-content; /* text 길이에 맞게 크기 조절*/
}

.card__text {
  opacity: 0.8;
  margin-top: 10px;
  
}

.card.is-active {
  grid-row: 1;
  grid-column: 1/span 6;
  height: 200px;
  order: 0;
}
.card.is-active:after {
  opacity: 1;
  transform: translateY(0);
}

.card.is-inactive {
  grid-column: span 2;
}

#mydiv {
  color: inherit;
  text-decoration: none;
  transition: color 0.3s ease; /* 부드러운 전환 효과를 추가할 수 있습니다. */
}

#mydiv:hover {
  background-color: #0B0B61;
  opacity: 1;

}

#mydiv {
  color: inherit;
  text-decoration: none;
  transition: color 0.3s ease; /* 부드러운 전환 효과를 추가할 수 있습니다. */
}

#mydiv:hover {
  background-color: #0B2161;
  opacity: 1;

}

#mydiv2 {
  color: inherit;
  text-decoration: none;
  transition: color 3s ease; /* 부드러운 전환 효과를 추가할 수 있습니다. */
}

#mydiv2:hover {
  background-color: #0B2161;
  font-color: #2E2E2E;
  opacity: 1;

}

</style>
<meta charset="utf-8">
    <title>DGital - Digital Agency HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="${cpath }/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
   
    <!-- Libraries Stylesheet -->
    <link href="${cpath }/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${cpath }/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${cpath }/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
   
    <!-- Customized Bootstrap Stylesheet -->
    <link href="${cpath }/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${cpath }/resources/css/style.css" rel="stylesheet">
    
   <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


    <%@include file="/WEB-INF/header.jsp"%>

            <div class="container-xxl bg-primary hero-header">
                <div class="container px-lg-5">
                    <div class="row g-5 align-items-end">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h1 class="text-white mb-4 animated slideInDown">A Digital Agency Of Inteligents & Creative People</h1>
                            <p class="text-white pb-3 animated slideInDown">Tempor rebum no at dolore lorem clita rebum rebum ipsum rebum stet dolor sed justo kasd. Ut dolor sed magna dolor sea diam. Sit diam sit justo amet ipsum vero ipsum clita lorem</p>
                            <a href="" class="btn btn-secondary py-sm-3 px-sm-5 rounded-pill me-3 animated slideInLeft">Read More</a>
                            <a href="" class="btn btn-light py-sm-3 px-sm-5 rounded-pill animated slideInRight">Contact Us</a>
                        </div>
                        <div class="col-lg-6 text-center text-lg-start">
                            <img class="img-fluid animated zoomIn" src="${cpath }resources/img/hero.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->

        

        <!-- myPage Start -->

	<div class="content_wrapper">
      <div class='wrapper'>
         <div class='card'>
            <div class='card__heading'>${username}</div>
            <div class='card__text'>${userVo.com_name}</div>
         </div>
         <div class='card'>
            <div class='card__heading' id="mydiv">
               <a href="${pageContext.request.contextPath}/member/update" style="color:#FFFFFF;">수정 페이지로 이동</a>
               <br>
               
            </div>
            <div class='card__text' id="mydiv2">
            	<a href="#" data-bs-toggle="modal" data-bs-target="#confirmModal" style="color:#A4A4A4" >회원 탈퇴</a>
            </div>
         </div>
         <div class='card'>
            <div class='card__heading' id="mydiv" >신청내역</div>
            <div class='card__text'></div>
         </div>
      </div>

        <!-- Mypage End -->
        </div>

        <!-- Footer Start -->
        <div class="container-fluid bg-primary text-light footer wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5 px-lg-5">
                <div class="row g-5">
                    <div class="col-md-6 col-lg-3">
                        <p class="section-title text-white h5 mb-4">Address<span></span></p>
                        <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <p class="section-title text-white h5 mb-4">Quick Link<span></span></p>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                        <a class="btn btn-link" href="">Career</a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <p class="section-title text-white h5 mb-4">Gallery<span></span></p>
                        <div class="row g-2">
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath }/resources/img/portfolio-1.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath }/resources/img/portfolio-2.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath }/resources/img/portfolio-3.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath }/resources/img/portfolio-4.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath }/resources/img/portfolio-5.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath }/resources/img/portfolio-6.jpg" alt="Image">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <p class="section-title text-white h5 mb-4">Newsletter<span></span></p>
                        <p>Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulpu</p>
                        <div class="position-relative w-100 mt-3">
                            <input class="form-control border-0 rounded-pill w-100 ps-4 pe-5" type="text" placeholder="Your Email" style="height: 48px;">
                            <button type="button" class="btn shadow-none position-absolute top-0 end-0 mt-1 me-2"><i class="fa fa-paper-plane text-primary fs-4"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container px-lg-5">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved. 
                     
                     <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                     Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a><br><br> 
                            Distributed By a <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
        
   <!-- 회원 탈퇴 모달 -->
   <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title" id="confirmModalLabel">회원 탈퇴 확인</h5>
                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                   <p>기존 비밀번호를 입력하세요.</p>
                   <input type="password" id="currentPassword" class="form-control" required>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                   <button type="button" class="btn btn-danger" id="confirmDeleteBtn">회원 탈퇴</button>
               </div>
           </div>
       </div>
   </div>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${cpath }/resources/lib/wow/wow.min.js"></script>
    <script src="${cpath }/resources/lib/easing/easing.min.js"></script>
    <script src="${cpath }/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${cpath }/resources/lib/counterup/counterup.min.js"></script>
    <script src="${cpath }/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${cpath }/resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${cpath }/resources/lib/lightbox/js/lightbox.min.js"></script>


    <!-- Template Javascript -->
    <script src="${cpath }/resources/js/main.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/Flip.min.js"></script>


   <script type="text/javascript">
       $(document).ready(function() {
           // 회원 탈퇴 버튼 클릭 시
           $("#confirmDeleteBtn").click(function() {
               var currentPassword = $("#currentPassword").val();
   
               // Ajax 요청
               $.ajax({
                   type: "POST",
                   url: "${pageContext.request.contextPath}/member/delete",
                   data: { password: currentPassword },
                   success: function(response) {
                      console.log(response);
                       if (response === "success") {
                           alert("회원 탈퇴가 완료되었습니다.");
                           window.location.href = "${pageContext.request.contextPath}/";
                       } else {
                           alert("비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
                       }
                   },
                   error: function() {
                       alert("오류가 발생하였습니다. 다시 시도해주세요.");
                   }
               });
           });
       });
       
       
       gsap.registerPlugin(Flip);

       const activeClass = "is-active";
       const inactiveClass = "is-inactive";
       const cards = document.querySelectorAll(".card");

       cards.forEach((card, idx) => {
           card.addEventListener("click", () => {
               const state = Flip.getState(cards);
               const isCardActive = card.classList.contains(activeClass);

               cards.forEach((otherCard, otherIdx) => {
                   otherCard.classList.remove(activeClass);
                   otherCard.classList.remove(inactiveClass);
                   if (!isCardActive && idx !== otherIdx)
                       otherCard.classList.add(inactiveClass);
               });

               if (!isCardActive) {
                   card.classList.add(activeClass);
               }

               Flip.from(state, {
                   duration: 1,
                   ease: "expo.out",
                   absolute: true
               });
           });
       });
   </script>
   
</body>
</html>