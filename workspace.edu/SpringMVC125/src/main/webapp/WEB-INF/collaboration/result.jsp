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
     <meta charset="utf-8">
    <title>DGital - Digital Agency HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${cpath}/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${cpath}/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${cpath}/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${cpath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${cpath}/resources/css/style.css" rel="stylesheet">
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
                            <h1 class="text-white animated slideInDown">Solution</h1>
                            <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                            <nav aria-label="breadcrumb">
                            	<h3 class="text-white">의뢰내용: ${req_content.req_content}</h3>
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                                    <li class="breadcrumb-item text-white active" aria-current="page">About</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Feature Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="row g-4">
        		      <c:forEach var="vo" items="${result_list}" varStatus="i">
                        <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="feature-item bg-light rounded text-center p-4" onclick="scrollToTeamSection()">
                            <i class="fa fa-3x fa-search text-primary mb-4"></i>
                            <h5 class="mb-3">솔루션번호: ${vo.sol_num } </h5>
                            <p class="m-0">의뢰번호: ${vo.req_num.req_num }</p>
                            <p class="m-0">솔루션: ${vo.sol_content }</p>
                            <p class="m-0">적합도: ${vo.pred_score }</p>
                            <p class="m-0">추천업종: ${vo.reco_industry }</p>
                        </div>
                    	</div>
	                </c:forEach>
                </div>
            </div>
        </div>
        <!-- Feature End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="section-title text-secondary">About Us<span></span></p>
                        <h1 class="mb-5">#1 추천업종 적합도</h1>
                        <p class="mb-4">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore. Clita erat ipsum et lorem et sit, sed stet no labore lorem sit clita duo justo eirmod magna dolore erat amet</p>
                        
                        <c:forEach var="vo" items="${result_list}" varStatus="i">
                        <div class="skill mb-4">
                            <div class="d-flex justify-content-between">
                                <p class="mb-2">${vo.reco_industry }</p>
                                <p class="mb-2">${vo.pred_score } </p>
                            </div>
                           	<div class="progress">
					           <c:if test="${i.index % 2 == 0}">
					               <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="${vo.pred_score}" aria-valuemin="0" aria-valuemax="100"></div>
					           </c:if>
					           <c:if test="${i.index % 2 != 0}">
					               <div class="progress-bar bg-secondary" role="progressbar" aria-valuenow="${vo.pred_score}" aria-valuemin="0" aria-valuemax="100"></div>
					           </c:if>
                            </div>
                        </div>
                        </c:forEach>

                        <a href="" class="btn btn-primary py-sm-3 px-sm-5 rounded-pill mt-3">Read More</a>
                    </div>
                    <div class="col-lg-6">
                        <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="${cpath}/resources/img/about.png">
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Facts Start -->
        <div class="container-xxl bg-primary fact py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container py-5 px-lg-5">
                <div class="row g-4">
                    <div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.1s">
                        <i class="fa fa-certificate fa-3x text-secondary mb-3"></i>
                        <h1 class="text-white mb-2" data-toggle="counter-up">1234</h1>
                        <p class="text-white mb-0">Years Experience</p>
                    </div>
                    <div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.3s">
                        <i class="fa fa-users-cog fa-3x text-secondary mb-3"></i>
                        <h1 class="text-white mb-2" data-toggle="counter-up">1234</h1>
                        <p class="text-white mb-0">Team Members</p>
                    </div>
                    <div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.5s">
                        <i class="fa fa-users fa-3x text-secondary mb-3"></i>
                        <h1 class="text-white mb-2" data-toggle="counter-up">1234</h1>
                        <p class="text-white mb-0">Satisfied Clients</p>
                    </div>
                    <div class="col-md-6 col-lg-3 text-center wow fadeIn" data-wow-delay="0.7s">
                        <i class="fa fa-check fa-3x text-secondary mb-3"></i>
                        <h1 class="text-white mb-2" data-toggle="counter-up">1234</h1>
                        <p class="text-white mb-0">Compleate Projects</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Facts End -->
        

        <!-- Team Start -->
        <div class="container-xxl py-5" id="team-section">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>${vo.reco_industry }<span></span></p>
                    <h1 class="text-center mb-5">추천 기업 리스트</h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item bg-light rounded">
                            <div class="text-center border-bottom p-4">
                                <img class="img-fluid rounded-circle mb-4" src="${cpath}/resources/img/team-1.jpg" alt="">
                                <h5>John Doe</h5>
                                <span>CEO & Founder</span>
                            </div>
                            <div class="d-flex justify-content-center p-4">
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="team-item bg-light rounded">
                            <div class="text-center border-bottom p-4">
                                <img class="img-fluid rounded-circle mb-4" src="${cpath}/resources/img/team-2.jpg" alt="">
                                <h5>Jessica Brown</h5>
                                <span>Web Designer</span>
                            </div>
                            <div class="d-flex justify-content-center p-4">
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="team-item bg-light rounded">
                            <div class="text-center border-bottom p-4">
                                <img class="img-fluid rounded-circle mb-4" src="${cpath}/resources/img/team-3.jpg" alt="">
                                <h5>Tony Johnson</h5>
                                <span>SEO Expert</span>
                            </div>
                            <div class="d-flex justify-content-center p-4">
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-instagram"></i></a>
                                <a class="btn btn-square mx-1" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->
        

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
                                <img class="img-fluid" src="${cpath}/resources/img/portfolio-1.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath}/resources/img/portfolio-2.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath}/resources/img/portfolio-3.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath}/resources/img/portfolio-4.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath}/resources/img/portfolio-5.jpg" alt="Image">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid" src="${cpath}/resources/img/portfolio-6.jpg" alt="Image">
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
							
							<!--/*** This template is free as long as you keep the footer authorâs credit link/attribution link/backlink. If you'd like to use the template without the footer authorâs credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
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


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${cpath}/resources/lib/wow/wow.min.js"></script>
    <script src="${cpath}/resources/lib/easing/easing.min.js"></script>
    <script src="${cpath}/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="${cpath}/resources/lib/counterup/counterup.min.js"></script>
    <script src="${cpath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${cpath}/resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${cpath}/resources/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${cpath}/resources/js/main.js"></script>
    
    <script type="text/javascript">
	    function scrollToTeamSection() {
	        // team-section 섹션으로 스크롤
	        document.getElementById('team-section').scrollIntoView({
	            behavior: 'smooth'
	        });
	    }
    
    </script>
    
</body>

</html>