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
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Bridge To Be</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
<%--     <link href="${cpath}/resources/lib/animate/animate.min.css" rel="stylesheet"> --%>
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
  <%@include file="/WEB-INF/header.jsp"%>

        <!-- Navbar & Hero Start -->
        <div class="container-xxl py-5 bg-primary hero-header">
            <div class="container my-5 py-5 px-lg-5">
               <div class="row g-5 py-5">
                  <div class="col-12 text-center">
                     <h1 class="text-white animated slideInDown">의뢰내역</h1>
                     <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                           <li class="breadcrumb-item"><a class="text-white" href="#">Request details</a></li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
        <!-- Navbar & Hero End -->


   
                 <div class="container-xxl py-5">
                     <div class="container py-5 px-lg-5">
                       <div class="wow fadeInUp" data-wow-delay="0.1s">
                             <p class="section-title text-secondary justify-content-center"><span></span>request details
                             <span></span></p>
                             <h1 class="text-center mb-5">나의 의뢰 내역</h1>
                         </div>
                         <br>
                                                 
                   
                   
                   <div class="wrapper_card">
                    <div class="cols_card">
                       <c:forEach var="vo" items="${req_list}" varStatus="i">
                       
                         <div class="col_card" ontouchstart="this.classList.toggle('hover');" onclick="window.location='${cpath}/collaboration/result?req_num=${vo.req_num}'">
                           <div class="container_card">
                             <div class="front_card">
                               <div class="inner_card">
                                 <p>${vo.req_num}</p>
                                 <p>${vo.req_keyword}</p>
                                 <span><fmt:formatDate value="${vo.req_at}" pattern="yyyy-MM-dd"/></span>
                               </div>
                             </div>
                             <div class="back_card">
                               <div class="inner_card">
                                 
                                 <p>${vo.req_content}</p>
                               </div>
                             </div>
                           </div>
                         </div>
                       
                       </c:forEach>
                    </div>
               </div>

                  </div>
                   </div>  
                 
             
         
                      
             
             <!-- 수정한 카드틀 -->
             
                
            
        
        <!-- Service End -->

        

        <%@include file="/WEB-INF/footer.jsp"%>


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
</body>

</html>