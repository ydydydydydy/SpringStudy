<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style >
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

* {
  box-sizing: border-box;
}

body {
  background: #f6f5f7;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: 'Montserrat', sans-serif;
  height: 100vh;
  margin: -20px 0 50px;
}

h1 {
  font-weight: bold;
  margin: 0;
}

h2 {
  text-align: center;
}

p {
  font-size: 14px;
  font-weight: 100;
  line-height: 20px;
  letter-spacing: 0.5px;
  margin: 20px 0 30px;
}

span {
  font-size: 12px;
}

a {
  color: #333;
  font-size: 14px;
  text-decoration: none;
  margin: 15px 0;
}

button {
  border-radius: 20px;
  border: 1px solid #FF4B2B;
  background-color: #FF4B2B;
  color: #FFFFFF;
  font-size: 12px;
  font-weight: bold;
  padding: 12px 45px;
  letter-spacing: 1px;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
}

button:active {
  transform: scale(0.95);
}

button:focus {
  outline: none;
}

button.ghost {
  background-color: #fc9a07;
  border: 2px solid #FFFFFF;
  color: #000000;
}

button.ghost:hover {
  background-color: #FF8000;
  border: 2px solid #FFFFFF;
  color: #000000;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

#UserButton {
  background-color: #0B0B3B;
  color: #FFFFFF;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

#UserButton:hover {
  background-color: #FFA500; /* 예시로 주황색 배경색을 사용합니다. */
  color: #000000; /* 예시로 흰색 텍스트 색상을 사용합니다. */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 그림자 효과를 추가할 수도 있습니다. */
}

form {
  background-color: #FFFFFF;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 50px;
  height: 100%;
  text-align: center;
}

input {
  background-color: #F2F2F2;
  border: 1px solid #BDBDBD;
  border-radius: 5px;
  padding: 12px 15px;
  margin: 8px 0;
  width: 100%;
  
}

input:hover {
  background-color: #D8D8D8;
  color: #000000;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

.container {
  background-color: #fff;
  border-radius: 10px;
    box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
      0 10px 10px rgba(0,0,0,0.22);
  position: relative;
  overflow: hidden;
  width: 950px;
  max-width: 100%;
  min-height: 640px;
}

.form-container {
  position: absolute;
  top: 0;
  height: 100%;
  transition: all 0.6s ease-in-out;
}

.sign-in-container {
  left: 0;
  width: 50%;
  z-index: 2;
}

.container.right-panel-active .sign-in-container {
  transform: translateX(100%);
}

.sign-up-container {
  left: 0;
  width: 50%;
  opacity: 0;
  z-index: 1;
}

.container.right-panel-active .sign-up-container {
  transform: translateX(100%);
  opacity: 1;
  z-index: 5;
  animation: show 0.6s;
}

@keyframes show {
  0%, 49.99% {
    opacity: 0;
    z-index: 1;
  }
  
  50%, 100% {
    opacity: 1;
    z-index: 5;
  }
}

.overlay-container {
  position: absolute;
  top: 0;
  left: 50%;
  width: 50%;
  height: 100%;
  overflow: hidden;
  transition: transform 0.6s ease-in-out;
  z-index: 100;
}

.container.right-panel-active .overlay-container{
  transform: translateX(-100%);
}

.overlay {
  background: #FF416C;
  background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
  background: linear-gradient(to right, #A4A4A4, #0B0B3B);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: 0 0;
  color: #FFFFFF;
  position: relative;
  left: -100%;
  height: 100%;
  width: 200%;
    transform: translateX(0);
  transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
    transform: translateX(50%);
}

.overlay-panel {
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 40px;
  text-align: center;
  top: 0;
  height: 100%;
  width: 50%;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
}

.overlay-left {
  transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
  transform: translateX(0);
}

.overlay-right {
  right: 0;
  transform: translateX(0);
}

.container.right-panel-active .overlay-right {
  transform: translateX(20%);
}

.social-container {
  margin: 20px 0;
}

.social-container a {
  border: 1px solid #DDDDDD;
  border-radius: 50%;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  margin: 0 5px;
  height: 40px;
  width: 40px;
}

footer {
    background-color: #222;
    color: #fff;
    font-size: 14px;
    bottom: 0;
    position: fixed;
    left: 0;
    right: 0;
    text-align: center;
    z-index: 999;
}

footer p {
    margin: 10px 0;
}

footer i {
    color: red;
}

footer a {
    color: #3c97bf;
    text-decoration: none;
}

.fadeIn.fourth {
  border: none;
  background-color: #fc9a07;
  border-radius: 20px;
  border: 3px solid #0B2161;
  font-family: 'Montserrat';
  font-weight: bold;
}

.fadeIn.fourth:hover {
  background-color: #FF8000;
  color: #000000;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  font-weight: bold;
}

.modal-dialog {
  display: flex;
  justify-content: center; /* 가로로 가운데 정렬 */
  align-items: center; /* 세로로 가운데 정렬 */
  height: 80vh; /* 화면 높이만큼 모달을 중앙에 배치합니다. */
}

.modal-title {
  background: linear-gradient(to bottom, rgba(11, 11, 59, 0.9), rgba(11, 11, 59, 0.7)); /* 그라데이션과 투명도 조절 */
  color: #FFFFFF; /* 텍스트 색상 설정 */
  padding: 10px; /* 내부 여백 설정 */
  font-size: 17px;
}


</style>
<title>Insert title here</title>
</head>

<body>
        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="${cpath}/home" class="navbar-brand p-0">
                    <h1 class="m-0">Bridge2B</h1>
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
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="404.html" class="dropdown-item">404 Page</a>
                            </div>
                        </div>
                        <a href="${cpath}/news/news" class="nav-item nav-link">News</a>
                    </div>
                   
                </div>
            </nav>
        </div>



   <div class="container" id="container">
     <div class="form-container sign-up-container">
         <form action="${cpath}/member/join" method="post" class="was-validated">
         <h1>Create Account</h1>
        
         <input type="email" placeholder="업무용 이메일" name="username" id="username"required/>
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         <button type="button" onclick="registerCheck()">중복확인</button>
        
         <input type="password" placeholder="비밀번호" name="password" id="password" onkeyup="passwordCheck()" required/>
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         <input type="password" placeholder="비밀번호확인" name="passwordConfrim" id="passwordConfrim" onkeyup="passwordCheck()" required/>
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         <span id="passMessage" style="color:red;"></span>
           
         
         <label for="sel1" class="form-label">업종:</label>
          <select class="form-select" id="sel1" name="industry">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
          </select>
         
         
         <input type="text" placeholder="사업자번호" name="bno" id="bno" required/>
         <button type="button" onclick="check()">진위여부</button>
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         
         
         <input type="text" placeholder="회사명" name="com_name" required/>
         <div class="valid-feedback"></div>
         <div class="invalid-feedback"></div>
         <button id="join">Sign Up</button>
       </form>

     </div>
     <div class="form-container sign-in-container">
     
     	
       <form action="${cpath}/member/login" method="post">
       
      	 <h1 style="color:#1E274D;">Login</h1>
      	 <br>
         <input id="username" name="username" type="email" placeholder="Email" />
         <input id="password" name="password" type="password" placeholder="Password" />
         <a href="#">Forgot your password?</a>
         <input type="submit" class="fadeIn fourth" value="Log In">
         
       </form>
       
     </div>
     <!-- 회원가입 성공시 Modal -->
 <div class="modal" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">${msgType}</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
      
            <!-- Modal body -->
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

    <div class="modal" id="myModal1">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header" id="checkType">
              <h4 class="modal-title">로그인 실패</h4>
              <!-- <button type="button" class="btn-close" data-bs-dismiss="modal"></button>  -->
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" >
              <p id="checkMessage1"> <h6 class="modal-body">아이디 또는 비밀번호를 잘못 입력하셨습니다.</h6></p>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
      
          </div>
        </div>
      </div>
      
    <div class="modal" id="checkModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header" id="checkType">
              <h4 class="modal-title">메세지 확인</h4>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" >
              <p id="checkMessage"></p>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
      
          </div>
        </div>
      </div>

     <div class="overlay-container">
       <div class="overlay">
         <div class="overlay-panel overlay-left">
           <h1>Welcome Back!</h1>
           <p>To keep connected with us please login with your personal info</p>
		   <button class="ghost" id="signIn">Log In</button>
         </div>
         <div class="overlay-panel overlay-right">
           <h1>Bridge to we</h1>
           <p>Enter your personal details and start journey with us</p>
           <button class="ghost" id="signUp">Sign Up</button>
         </div>
       </div>
     </div>
   </div>



   <script type="text/javascript">
      const signUpButton = document.getElementById('signUp');
      const signInButton = document.getElementById('signIn');
      const container = document.getElementById('container');
   
      signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
      });
   
      signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
      });
      
      
      $(document).ready(function(){
          if(${not empty msgType}){
             //회원가입성공
             if(${msgType eq "성공메세지"}){
                $("#messageType").attr("class", "modal-content panel-success");
             }
             $("#myModal").modal("show");
          }
          //로그인실패
          if (window.location.href.endsWith("login?error")) {
               // URL이 "localhost:8080/boot/login?error"와 같은 패턴인 경우
               // 로그인 실패 모달 창을 띄우는 코드를 여기에 작성합니다.
                 $("#checkMessage").text("이미 사용중인 이메일 입니다.");
                   $("#checkType").attr("class","modal-content panel-warning");
             $("#myModal1").modal("show");
             }

       });
      
      function registerCheck(){
          var username = $("#username").val();
          $.ajax({
             url : "${cpath}/member/registerCheck",
             type : "get", 
             data : {"username" : username},
             success : function(data){
                // 중복유무 확인 -> (data=1 사용가능 data=0 사용불가능)
                if(data){
                   $("#checkMessage").text("이미 사용중인 이메일 입니다.");
                   $("#checkType").attr("class","modal-content panel-warning");
                   $("#join").prop("disabled", true);
                   $("#join").css("border", "1px solid");
                   $("#join").css("background-color", "gray");
                }else{
                   $("#checkMessage").text("사용할 수 있는 이메일 입니다.");
                   $("#checkType").attr("class","modal-content panel-success");
                   $("#join").prop("disabled", false);
                   $("#join").css("border", "1px solid #FF4B2B");
                   $("#join").css("background-color", "#FF4B2B");
                }
                
                $("#checkModal").modal("show");
                
             },
             
             error : function(){alert("error");}
             
          });

          
       }
       
       
       function passwordCheck(){
          var password = $("#password").val();
          var passwordConfrim = $("#passwordConfrim").val();
          
          
          if(password != passwordConfrim){
             $("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
             $("#join").prop("disabled", true);
             $("#join").css("border", "1px solid");
             $("#join").css("background-color", "gray");
          }else{
             $("#passMessage").html("");
             $("#join").prop("disabled", false);
             $("#join").css("border", "1px solid #FF4B2B");
             $("#join").css("background-color", "#FF4B2B");
          }
       }
       
       function check(){ // 예시 사업자등록번호 : 6948102044
          var businessNumber = $("#businessNumber").val();
          var data = {
                 "b_no": [businessNumber] // 사업자번호 "xxxxxxx" 로 조회 시,
                }; 
          $.ajax({
             url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=t3yqqSdPU84m8Cqhi7cl%2BNCRNn9x237g%2FV32UbaM5G%2FEUlx8dJtNawws2jgNYpmppv1bm7B8Moo43FZn4leuOg%3D%3D&returnType=JSON",  // serviceKey 값을 xxxxxx에 입력
             type: "POST",
             data: JSON.stringify(data),// json 을 string으로 변환하여 전송
             dataType: "JSON",
             contentType: "application/json",
             accept: "application/json",
             success: function(result) {
                 console.log(result["data"][0]["tax_type"]);
                 if(result["data"][0]["tax_type"] == "국세청에 등록되지 않은 사업자등록번호입니다."){
                    $("#checkMessage").text(result["data"][0]["tax_type"]);
                       $("#checkType").attr("class","modal-content panel-warning");
                       $("#join").prop("disabled", true);
                       $("#join").css("border", "1px solid");
                       $("#join").css("background-color", "gray");
                 }else{
                    $("#checkMessage").text("정상적인 사업자등록번호입니다.");
                       $("#checkType").attr("class","modal-content panel-success");
                       $("#join").prop("disabled", false);
                       $("#join").css("border", "1px solid #FF4B2B");
                       $("#join").css("background-color", "#FF4B2B");
                 }
                 $("#checkModal").modal("show");
             },
             error:function(result){alert("error");console.log(result.responseText); }
             
           });

           
        }
        
   </script>


   
</body>
</html>