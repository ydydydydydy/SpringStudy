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

#send:hover {
  background-color: #FFA500; /* 예시로 주황색 배경색을 사용합니다. */
  color: #000000; /* 예시로 흰색 텍스트 색상을 사용합니다. */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 그림자 효과를 추가할 수도 있습니다. */
  border: 1px solid #A4A4A4;
}
#link {color: #E45635;display:block;font: 12px "Helvetica Neue", Helvetica, Arial, sans-serif;text-align:center; text-decoration: none;}
#link:hover {color: #CCCCCC}

#link, #link:hover {-webkit-transition: color 0.5s ease-out;-moz-transition: color 0.5s ease-out;-ms-transition: color 0.5s ease-out;-o-transition: color 0.5s ease-out;transition: color 0.5s ease-out;}

/** BEGIN CSS **/
        body {background: #333333;}
        @keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-moz-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-webkit-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-o-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-moz-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-webkit-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-o-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }

        @-moz-keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }

        @-webkit-keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }

        @-o-keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }
        .loading-container,
        .loading {
            height: 100px;
            position: relative;
            width: 100px;
            border-radius: 100%;
        }


        .loading-container { margin: 40px auto }

        .loading {
            border: 2px solid transparent;
            border-color: transparent #000000 transparent #000000;
            -moz-animation: rotate-loading 1.5s linear 0s infinite normal;
            -moz-transform-origin: 50% 50%;
            -o-animation: rotate-loading 1.5s linear 0s infinite normal;
            -o-transform-origin: 50% 50%;
            -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;
            -webkit-transform-origin: 50% 50%;
            animation: rotate-loading 1.5s linear 0s infinite normal;
            transform-origin: 50% 50%;
        }

        .loading-container:hover .loading {
            border-color: transparent #E45635 transparent #E45635;
        }
        .loading-container:hover .loading,
        .loading-container .loading {
            -webkit-transition: all 0.5s ease-in-out;
            -moz-transition: all 0.5s ease-in-out;
            -ms-transition: all 0.5s ease-in-out;
            -o-transition: all 0.5s ease-in-out;
            transition: all 0.5s ease-in-out;
        }

        #loading-text {
            -moz-animation: loading-text-opacity 2s linear 0s infinite normal;
            -o-animation: loading-text-opacity 2s linear 0s infinite normal;
            -webkit-animation: loading-text-opacity 2s linear 0s infinite normal;
            animation: loading-text-opacity 2s linear 0s infinite normal;
            color: #000000;
            font-family: "Helvetica Neue, "Helvetica", ""arial";
            font-size: 10px;
            font-weight: bold;
            margin-top: 45px;
            opacity: 0;
            position: absolute;
            text-align: center;
            text-transform: uppercase;
            top: 0;
            width: 100px;
        }
</style>
<meta charset="UTF-8">
<title>Bridge To Be</title>
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
    <!-- font -->
   <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
</head>
<style>

</style>
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
        <%@include file="/WEB-INF/header.jsp"%>


            <div class="container-xxl bg-primary hero-header">
                <div class="container px-lg-5">
                    <div class="row g-5 align-items-end">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h1 class="text-white mb-4 animated slideInDown">Artificial Intelligence Marketer</h1>
                            <p class="text-white pb-3 animated slideInDown">소싱 의뢰를 등록 시 정보를 상세하게 기재 해 주세요. 구체적일수록, 정확도가 높아지며 고객님께 적합한 업체가 매칭됩니다.</p>
                        </div>
                        <div class="col-lg-6 text-center text-lg-start">
                            <img class="img-fluid animated zoomIn" src="resources/img/hero.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        
        <!-- Navbar & Hero End -->


        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container py-5 px-lg-5">
                <div class="wow fadeInUp" data-wow-delay="0.1s">
                    <p class="section-title text-secondary justify-content-center"><span></span>Request Form<span></span></p>
                    <h1 class="text-center mb-5">의뢰서 작성</h1>
                    <br>
                </div>
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="wow fadeInUp" data-wow-delay="0.3s">
                  <form action="${cpath}/collaboration/request" method="post">
                     <div class="requestForm">
                        <div class="col-12">
                           <div class="form-floating">
                              <input type="hidden" class="form-control" id="writer"
                                 name="username" placeholder="username"
                                 value="${user.username}">
                           </div>
                        </div>
                        <br>
                        <div class="col-12">
                           <div class="form-floating">
                              <input type="text" class="form-control" id="industry"
                                 name="industry" placeholder="industry" required> <label
                                 for="industry">제품 또는 서비스의 업종을 작성해 주세요</label>
                           </div>
                        </div>
                        <br>
                        <div class="col-12">
                           <div class="form-floating">
                              <input type="text" class="form-control" id="target"
                                 name="target" placeholder="target" required> <label
                                 for="target">마케팅 대상(타겟)을 입력해 주세요</label>
                           </div>
                        </div>
                        <br>
                        <div class="col-12">
                           <div class="form-floating">
                              <textarea class="form-control" name="req_content"
                                 placeholder="Leave a message here" id="content"
                                 style="height: 500px" required></textarea>
                              <label for="content">상담요청내용</label>
                              <!-- 수정: label을 "content"로 변경 -->
                           </div>
                        </div>
                        <br>
									<div class="col-12">
										<button onclick="sendMessage()"
											class="btn btn-primary w-100 py-3" type="button" id="send">Send
											Message</button>
										<div class="loading-container" id="loading-container" style="display:none";>
											<div class="loading"></div>
											<div id="loading-text">loading</div>
										</div>
									</div>
								</div>
                  </form>
               </div>
                   <div id="result">
                   </div>
                        <div id="error"></div>
                        <!-- gpt불러와보자 -->
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->
        

       <%@include file="/WEB-INF/footer.jsp"%>
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
    
    <script type="text/javascript">
    const sendButton = document.getElementById('send');
    
    function sendMessage() {
    	document.getElementById('send').style.display = 'none';
        document.getElementById('loading-container').style.display = 'block';
       
       var industry = $('#industry').val();
        var target = $('#target').val();
         var content = $('#content').val(); // 사용자의 상담 요청 내용을 가져옴
         var keyword = "업종: " + industry+ ", 타겟층: " + target;
         var question = keyword + ", 상세요청: " + content;
         

         if (industry.trim() === '' || target.trim() === '' || content.trim() === '') {
             // 필드가 비어있다면 실행하지 않음
             alert("모든 필드를 입력하세요.");
             return;
         }
         
         
       var username = $("#writer").val();
      
       $.ajax({
          url: "${cpath}/collaboration/request", // 수정: 실제 컨트롤러의 URL로 변경
          type: "post",
          data: {
             "username": username,
             "req_content": content, // 수정: 요청 내용은 req_content로 변경
             "req_keyword": keyword // 수정: 제목은 키워드로 변경
          },
          success: function(data) {
             // 성공 시의 동작
             askQuestion(question, data);
             
          },
          error : function(error){
             
          }
       });
       
       
    }
    
   
    </script>
    
    <!-- gpt실행결과 db저장해보기 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    function askQuestion(question, req_num) {
       var data = { 'question': question, 'req_num': req_num };
       console.log(data);
        $.ajax({
            type: 'POST',
            url: 'http://localhost:5000/ask_question',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (data) {
               
               window.location.href = '${cpath}/collaboration/result?req_num='+req_num;
                var solContent = data.result || data.error;
                // 결과를 서버로 보내서 DB에 저장
              

                $('#error').text(""); // 성공 시 에러 메시지 초기화
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
                $('#error').text("에러 발생: " + error); // 에러 메시지 표시
            }
        });
    }
    


    </script>
    
    
</body>
</html>