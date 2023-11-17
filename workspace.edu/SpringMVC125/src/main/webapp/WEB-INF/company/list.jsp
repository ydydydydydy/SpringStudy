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
    <link href="${cpath}/resources/img/favicon.ico" rel="icon">

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
                            <h1 class="text-white animated slideInDown">List</h1>
                            <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                            <nav aria-label="breadcrumb">
								<ol class="breadcrumb justify-content-center">
									<li class="breadcrumb-item"><a class="text-white" href="#">Enterprise</a></li>
								</ol>
							</nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Projects Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>Enterprise<span></span></p>
                    <h1 class="text-center mb-5">Our Enterprise</h1>
                </div>
                <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="col-12 text-center">
                        <ul class="list-inline mb-5" id="portfolio-flters">
                            <li class="mx-2 active" data-filter="*">All</li>
                            <li class="mx-2" data-filter=".first">제조</li>
                            <li class="mx-2" data-filter=".second">전문·과학및기술서비스</li>
                            <li class="mx-2" data-filter=".third">금융·보험</li>
                            <li class="mx-2" data-filter=".four">교육서비스</li>
                            <li class="mx-2" data-filter=".five">도매·소매</li>
                            <br>
                            <li class="mx-2" data-filter=".six">숙박·음식점</li>
                            <li class="mx-2" data-filter=".seven">사업시설관리·사업지원및임대서비스</li>
                            <li class="mx-2" data-filter=".eight">정보통신</li>
                            <li class="mx-2" data-filter=".nine">광업</li>
                            <li class="mx-2" data-filter=".ten">운수·창고</li>
                            <li class="mx-2" data-filter=".ten1">건설</li>
							<li class="mx-2" data-filter=".ten2">전기·가스·증기·공기조절공급</li>
							<br>
							<li class="mx-2" data-filter=".ten3">부동산</li>
							<li class="mx-2" data-filter=".ten4">소프트웨어</li>
							<li class="mx-2" data-filter=".ten5">공공행정·국방·사회보장행정</li>
							<li class="mx-2" data-filter=".ten6">서비스업</li>
							<li class="mx-2" data-filter=".ten7">보건, 사회복지서비스</li>
							<li class="mx-2" data-filter=".ten8">농업·임업·어업</li>
							<li class="mx-2" data-filter=".ten9">협회·단체·수리·기타개인서비스</li>
							<li class="mx-2" data-filter=".twenty">예술·스포츠·여가관련서비스</li>
							<li class="mx-2" data-filter=".twenty1">수도·하수·폐기물처리·원료재생</li>

                        </ul>
              
                 <!-- 기업검색 -->
                   <form onsubmit="searchCompanies(); return false;" style="margin-bottom: 20px; display: flex; align-items: center;">
    <input type="text" id="companySearch" name="companyName" style="flex: 1;">
    <input type="submit" value="검색" style="background-color: #6222cc; color: white; border: 1px solid white; padding: 5px 10px; cursor: pointer; border-radius: 5px;">
    <button id="resetSearch" class="btn btn-primary" style="margin-left: 5px; padding: 3px 8px;">초기화</button>
</form>


                    
                    </div>
                </div>
                
                
                <div class="row g-4 portfolio-container">

					<c:forEach var="vo" items="${list}" varStatus="i">
						<c:set var="portfolioClass" value="" />
						<c:set var="portfolioImage" value="" />
						<c:choose>
							<c:when test="${vo.industry == '제조'}">
								<c:set var="portfolioClass" value="first" />
								<c:set var="portfolioImage" value="portfolio-1.jpg" />
							</c:when>
							<c:when test="${vo.industry == '전문·과학및기술서비스'}">
								<c:set var="portfolioClass" value="second" />
								<c:set var="portfolioImage" value="portfolio-2.jpg" />
							</c:when>
							<c:when test="${vo.industry == '금융·보험'}">
								<c:set var="portfolioClass" value="third" />
								<c:set var="portfolioImage" value="portfolio-3.jpg" />
							</c:when>
							<c:when test="${vo.industry == '교육서비스'}">
								<c:set var="portfolioClass" value="four" />
								<c:set var="portfolioImage" value="portfolio-4.jpg" />
							</c:when>
							<c:when test="${vo.industry == '도매·소매'}">
								<c:set var="portfolioClass" value="five" />
								<c:set var="portfolioImage" value="portfolio-5.jpg" />
							</c:when>
							<c:when test="${vo.industry == '숙박·음식점'}">
								<c:set var="portfolioClass" value="six" />
								<c:set var="portfolioImage" value="portfolio-6.jpg" />
							</c:when>
							<c:when test="${vo.industry == '사업시설관리·사업지원및임대서비스'}">
								<c:set var="portfolioClass" value="seven" />
								<c:set var="portfolioImage" value="portfolio-7.jpg" />
							</c:when>
							<c:when test="${vo.industry == '정보통신'}">
								<c:set var="portfolioClass" value="eight" />
								<c:set var="portfolioImage" value="portfolio-8.jpg" />
							</c:when>
							<c:when test="${vo.industry == '광업'}">
								<c:set var="portfolioClass" value="nine" />
								<c:set var="portfolioImage" value="portfolio-9.jpg" />
							</c:when>
							<c:when test="${vo.industry == '운수·창고'}">
								<c:set var="portfolioClass" value="ten" />
								<c:set var="portfolioImage" value="portfolio-10.jpg" />
							</c:when>
							<c:when test="${vo.industry == '건설'}">
								<c:set var="portfolioClass" value="eleven" />
								<c:set var="portfolioImage" value="portfolio-11.jpg" />
							</c:when>
							<c:when test="${vo.industry == '전기·가스·증기·공기조절공급'}">
								<c:set var="portfolioClass" value="ten2" />
								<c:set var="portfolioImage" value="portfolio-12.jpg" />
							</c:when>
							<c:when test="${vo.industry == '부동산'}">
								<c:set var="portfolioClass" value="ten3" />
								<c:set var="portfolioImage" value="portfolio-13.jpg" />
							</c:when>
							<c:when test="${vo.industry == '소프트웨어'}">
								<c:set var="portfolioClass" value="ten4" />
								<c:set var="portfolioImage" value="portfolio-14.jpg" />
							</c:when>
							<c:when test="${vo.industry == '공공행정·국방·사회보장행정'}">
								<c:set var="portfolioClass" value="ten5" />
								<c:set var="portfolioImage" value="portfolio-15.jpg" />
							</c:when>
							<c:when test="${vo.industry == '서비스업'}">
								<c:set var="portfolioClass" value="ten6" />
								<c:set var="portfolioImage" value="portfolio-16.jpg" />
							</c:when>
							<c:when test="${vo.industry == '보건, 사회복지서비스'}">
								<c:set var="portfolioClass" value="ten7" />
								<c:set var="portfolioImage" value="portfolio-17.jpg" />
							</c:when>
							<c:when test="${vo.industry == '농업·임업·어업'}">
								<c:set var="portfolioClass" value="ten8" />
								<c:set var="portfolioImage" value="portfolio-18.jpg" />
							</c:when>
							<c:when test="${vo.industry == '협회·단체·수리·기타개인서비스'}">
								<c:set var="portfolioClass" value="ten9" />
								<c:set var="portfolioImage" value="portfolio-19.jpg" />
							</c:when>
							<c:when test="${vo.industry == '예술·스포츠·여가관련서비스'}">
								<c:set var="portfolioClass" value="twenty" />
								<c:set var="portfolioImage" value="portfolio-20.jpg" />
							</c:when>
							<c:when test="${vo.industry == '수도·하수·폐기물처리·원료재생'}">
								<c:set var="portfolioClass" value="twenty1" />
								<c:set var="portfolioImage" value="portfolio-21.jpg" />
							</c:when>
							
						</c:choose>
						<!-- 나머지 산업 분야에 대한 설정 추가 -->
						<!-- ... -->
						<c:set var="portfolioItemHTML">
							<c:if test="${not empty portfolioClass}">
								<div
									class="col-lg-4 col-md-6 portfolio-item ${portfolioClass} wow fadeInUp"
									data-wow-delay="0.1s">
									<div class="rounded overflow-hidden">
										<div class="position-relative overflow-hidden">
											<img class="img-fluid w-100"
												src="${cpath}/resources/img/${portfolioImage}" alt="">
											<div class="portfolio-overlay">
												<a class="btn btn-square btn-outline-light mx-1"
													href="${cpath}/resources/img/${portfolioImage}"
													data-lightbox="portfolio"><i class="fa fa-eye"></i></a> <a
													class="btn btn-square btn-outline-light mx-1" href=""
													data-industry="${vo.industry}"
													data-company="${vo.com_name}" data-addr="${vo.com_addr}"
													data-scale="${vo.com_type}"><i class="fa fa-link"></i></a>
											</div>
										</div>

										<div class="bg-light p-4">
											<p class="text-primary fw-medium mb-2">${vo.industry}</p>
											<h5 class="lh-base mb-0">${vo.com_name}</h5>
										</div>
									</div>
								</div>
							</c:if>
						</c:set>

 				${portfolioItemHTML}
					</c:forEach>

					
				</div>
                
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
        
        
        
        <!-- 모달부분 -->
        <div class="modal" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">${msgType}</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
      
            <!-- Modal body -->
             <div id="map" style="width: 100%; height: 400px;"></div>
            <div class="modal-body">
              ${msg}
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
      
          </div>
        </div>
       </div> 
     
        <!-- Projects End -->


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
                     Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d222eefd3278a8d9470378244c58b31&libraries=services"></script>
<script>
    $(document).ready(function() {
        $('.btn-square').on('click', function(e) {
            e.preventDefault();
            var industry = $(this).data('industry');
            var companyName = $(this).data('company');
            var addr = $(this).data('addr');
            var scale = $(this).data('scale');

            $('#myModal .modal-title').text(companyName);
            $('#myModal .modal-body').html(
                "<p><strong>Industry:</strong> " + industry + " </p>" +
                "<p><strong>Addr:</strong> " + addr + " </p>" +
                "<p><strong>com_type:</strong> " + scale + " </p>"
            );

            $('#myModal').modal('show');

            // Perform geocoding and map initialization
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };

            var map = new kakao.maps.Map(container, options);

            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(addr, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:100px;text-align:center;padding:6px 0;">'+companyName+'</div>'
                    });
                    infowindow.open(map, marker);
                    map.setCenter(coords);
                }
            });
        });

        function searchCompanies() {
            var companyName = $('#companySearch').val();

            $.ajax({
                type: 'GET',
                url: '/boot/company/search',
                data: { companyName: companyName },
                success: function (data) {
                    $('#searchResults').html(data);
                    $('#companySearch').val('');

                    $('#searchResults').append('<button id="resetSearch" class="btn btn-primary">검색결과 초기화</button>');

                    $('#resetSearch').on('click', function() {
                        window.location.href = '/boot/company/list';
                    });
                },
                error: function (error) {
                    console.error('Error during search:', error);
                }
            });
        }

        $('#searchButton').on('click', function() {
            searchCompanies();
        });
    });
</script>


</body>

</html>