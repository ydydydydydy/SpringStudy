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
    <title>Bridge To Be</title>
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
	<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
    <script
            type="text/javascript"
            src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script>
    <!-- iamport.payment.js -->
    <script
            type="text/javascript"
            src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
    ></script>
    <script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<style>
.blurry-section {
    filter: blur(15px);
}


    
</style> 

    
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

            <div class="container-xxl py-5 bg-primary hero-header">
                <div class="container my-5 py-5 px-lg-5">
                
                    <div class="row g-5 py-5">
                        <div class="col-12 text-center">
                            <h1 class="text-white animated slideInDown">Solution</h1>
                            <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                            <nav aria-label="breadcrumb">
                               <h3 class="text-white">의뢰내용: ${req_content.req_content}</h3>
                                
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
  
        <!-- Navbar & Hero End -->


        <!-- Feature Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
             <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>RECOMMEND SUMMARY<span></span></p>
                   </div>
                <br>
                <div class="row g-4">
                    <c:forEach var="vo" items="${result_list}" varStatus="i">
                        <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="feature-item bg-light rounded text-center p-4" onclick="scrollToTeamSection(${i.index})">
                            <i class="fa fa-3x fa-search text-primary mb-4"></i>
                            <h5 class="mb-3">솔루션번호: ${vo.sol_num } </h5>
                            <p class="m-0">의뢰번호: ${vo.req_num.req_num }</p>
                            <input type="hidden" id="req_num" value="${vo.req_num.req_num}" />
                            <p class="m-0">솔루션: ${vo.sol_content }</p>
                            <p class="m-0">추천업종: ${vo.reco_industry }</p>
                        </div>
                       </div>
                   </c:forEach>
                </div>
            </div>
        </div>
        <!-- Feature End -->

   <div class="blurry-section">
    <!-- 블러 처리할 내용 -->
        <!-- About Start -->
        <div class="container-xxl py-5" >
            <div class="container py-5 px-lg-5">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="section-title text-secondary">Recommend industry<span></span></p>
                        <h1 class="mb-5">추천 업종</h1>
                        <p class="mb-4">AI 매칭을 통한 추천 업종은 고객의 요구사항과 기업의 서비스를 인공지능이 분석하여, 최적화된 세 가지 업종을 추천합니다</p>
                        
                        <c:forEach var="vo" items="${result_list}" varStatus="i">
                        <div class="skill mb-4">
                            <div class="d-flex justify-content-between">
                                <p class="mb-2">${vo.reco_industry }</p>
                            </div>
                              <div class="progress">
                          <%-- <c:if test="${i.index % 2 == 0}">
                              <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="${vo.pred_score}" aria-valuemin="0" aria-valuemax="100"></div>
                          </c:if>
                          <c:if test="${i.index % 2 != 0}">
                              <div class="progress-bar bg-secondary" role="progressbar" aria-valuenow="${vo.pred_score}" aria-valuemin="0" aria-valuemax="100"></div>
                          </c:if> --%>
                            </div>
                        </div>
                        </c:forEach>

                    </div>
                    <div class="col-lg-6">
                        <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="${cpath}/resources/img/about.png">
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->
        </div>
<input type="hidden" id="username" value="${user.username}"/>

        <button type="button" id="paymentButton" onclick="KGpay()" class="btn btn-primary py-sm-3 px-sm-5 rounded-pill mt-3" style="display: block; margin: 0 auto;" >결제하기</button>
<div class="blurry-section">
     
        

        <!-- Team Start -->
        <div class="container-xxl py-5" id="team-section">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>RECOMMEND LIST<span></span></p>
                    <h1 class="text-center mb-5">업종 추천 기업</h1>
                </div>
                <br>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item bg-light rounded">
                            <div class="text-center border-bottom p-4">
                                <img class="img-fluid rounded-circle mb-4" src="${cpath}/resources/img/team-1.jpg" alt="">
                                <h5 id="company"></h5>
                                <span>CEO & Founder</span>
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
                           
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="team-item bg-light rounded">
                            <div class="text-center border-bottom p-4">
                                <img class="img-fluid rounded-circle mb-4" src="${cpath}/resources/img/team-3.jpg" alt="">
                                <h5>Tony Johnson</h5>
                                <span>SEO Expert</span>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->
    </div> 

        
<%@include file="/WEB-INF/footer.jsp"%>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-secondary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
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
    
    $(document).ready(function() {
        var is_paid = ${is_paid}; // 여기에 is_paid의 상태를 가져와 설정하세요.
		console.log(is_paid);
        // is_paid가 true이면 블러 효과 제거
        if (is_paid) {
            $('.blurry-section').removeClass('blurry-section');
            $('#paymentButton').hide();
        }
    });

    
    var resultList = ${result_list};
    
    
    
       function scrollToTeamSection(idx) {
           // team-section 섹션으로 스크롤
           console.log(idx);
           console.log(resultList[idx]);
          /*  $('#company').html(`${result_list[idx].company1}`); */
           
           document.getElementById('team-section').scrollIntoView({
               behavior: 'smooth'
               
           });
       }
       function KGpay(username){
    	   //var username = document.getElementById('username').value;
    	   var IMP = window.IMP;
    	   IMP.init("imp71714542");
    	   IMP.request_pay({
    	       pg : 'html5_inicis',
    	       pay_method : 'card',
    	       merchant_uid: username+'_'+new Date().getTime(), // 상점에서 관리하는 주문 번호를 전달
    	       name :'Bridge To Be 유료서비스',
    	       amount : 100,//100이 최소금액
    	       buyer_email : username,
    	       buyer_name : username,
    	      
    	      
    	   },function(rsp) {
    	       if ( rsp.success ) {
    	       	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	       	jQuery.ajax({
    	       		url: "/collaboration/result", //cross-domain error가 발생하지 않도록 주의해주세요
    	       		type: 'POST',
    	       		dataType: 'json',
    	       		data: {
    	   	    		imp_uid : rsp.imp_uid,
    	   	    		merchant_uid : rsp.merchant_uid
    	   	    		//기타 필요한 데이터가 있으면 추가 전달
    	       		}
    	       	}).done(function(data) {
    	       		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    	       		if ( everythings_fine ) {
    	       			var msg = '결제가 완료되었습니다.';
    	       			msg += '\n고유ID : ' + rsp.imp_uid;
    	       			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    	       			msg += '\결제 금액 : ' + rsp.paid_amount;
    	       			msg += '카드 승인번호 : ' + rsp.apply_num;
    	       			
    	       			const form = new FormData();
    	                   form.append('impuid', rsp.imp_uid)
    	                   form.append('merchantuid', rsp.merchant_uid)
    	                   form.append('paidamount', rsp.paid_amount)
    	                   form.append('applynum', rsp.apply_num)
    	                   form.append('email', username)
    	                   
    	                   console.log(form)
    	       			alert(msg);
    	                   
    	       		} 
    	       	});
    	       } else {
    	           var msg = '결제에 실패하였습니다.';
    	           msg += "\n"+ rsp.error_msg;
    	           
    	           alert(msg);
    	       }
    	   });
    	   }
    </script>
    
</body>

</html>