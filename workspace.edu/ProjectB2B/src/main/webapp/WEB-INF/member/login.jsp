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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
  background-color: transparent;
  border-color: #FFFFFF;
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
  background-color: #eee;
  border: none;
  padding: 12px 15px;
  margin: 8px 0;
  width: 100%;
}

.container {
  background-color: #fff;
  border-radius: 10px;
    box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
      0 10px 10px rgba(0,0,0,0.22);
  position: relative;
  overflow: hidden;
  width: 768px;
  max-width: 100%;
  min-height: 600px;
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
  background: linear-gradient(to right, #FF4B2B, #FF416C);
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



</style>
<title>Insert title here</title>
</head>
<body>
   <h2>집가고</h2>
   <div class="container" id="container">
     <div class="form-container sign-up-container">
       <form action="${cpath}/member/join" method="post">
         <h1>Create Account</h1>
         <input type="text" placeholder="아이디" name="username"/>
         
         <input type="password" placeholder="비밀번호" name="password" id="password"/>
         
         <!-- <input type="password" placeholder="비밀번호확인" name="password2" id="password2"/> -->
         <input type="text" placeholder="이름" name="name"/>
         <input type="tel" placeholder="휴대전화번호" name="phone" />
         
         <div class="form-group">
            <label for="sel1">업종 1차:</label>
            <select class="form-control" id="sel1" name="industry1">
             <option>1</option>
             <option>2</option>
             <option>3</option>
             <option>4</option>
           </select>
         
         
         
            <label for="sel2">업종 2차:</label>
            <select class="form-control" id="sel2" name="industry2">
             <option>1</option>
             <option>2</option>
             <option>3</option>
             <option>4</option>
           </select>
         </div>
         
         
         <input type="text" placeholder="회사명" name="company"/>
         <input type="email" placeholder="업무용 이메일" name="email" />
         <input type="text" placeholder="사업자번호" name="businessNumber" />
         <button>Sign Up</button>
       </form>
     </div>
     <div class="form-container sign-in-container">
     
     
       <form action="${cpath}/member/login" method="post">
       
         <h1>Sign in</h1>
         <input id="username" name="username" type="text" placeholder="Email" />
         <input id="password" name="password" type="password" placeholder="Password" />
         <a href="#">Forgot your password?</a>
         <input type="submit" class="fadeIn fourth" value="Log In">
         
       </form>
       
     </div>

    <div class="modal" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header" id="checkType">
              <h4 class="modal-title">메세지 확인</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body" >
              <p id="checkMessage"> <h6 class="modal-body">아이디, 비밀번호를 다시 입력해주세요</h6></p>
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
           <button class="ghost" id="signIn">Sign In</button>
         </div>
         <div class="overlay-panel overlay-right">
           <h1>Hello, Friend!</h1>
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
             if(${msgType eq "성공메세지"}){
                $("#messageType").attr("class", "modal-content panel-success");
             }
             $("#myModal").modal("show");
          }
          if (window.location.href.endsWith("login?error")) {
               // URL이 "localhost:8080/boot/login?error"와 같은 패턴인 경우
               // 로그인 실패 모달 창을 띄우는 코드를 여기에 작성합니다.
             $("#myModal").modal("show");
             }

       });
      
   </script>


   
</body>
</html>