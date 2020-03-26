<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<jsp:include page="../include/navbar.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>

<style>

/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
	.help-block, .form-control-feedback{
		display: none;
	}
	.btn btn-primary {
	width: 100%;
	background-color: #2d3436;
	border-color: #2d3436;
	margin-bottom: 0.5em;
	border-radius: 0;
}
 
.input-group .form-control {
    margin: 0px !important;
}
	div.scroll-wrapper{

    overflow: auto;

    border:solid 1px gray;

    height: 200px;

    width: 460px;
    
	overflow-x: auto;
	overflow-y: auto;
}

.agreement-title{
}

.scroll-wrapper:hover{

		background-color:#FEF9E7;
}

.h4 {
  background-color: lightgrey;
  width: 500px;
  padding: 0px;
  margin: 0px;
}
/* 배경화면*/
#backgroundImage{
	z-index: 1;
	
}

#backgroundImage:before {
   content: "";
   position: absolute;
   z-index: -1;
   top: 0;
   bottom: 0;
   left: 0;
   right: 0;
   background-image: linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.8) ),url(${pageContext.request.contextPath }/resources/images/bg.jpg);
    background-repeat: no-repeat;
    background-size: 100%;
    filter: grayscale(80%);
    height:100%;
    width:100%;
    opacity:0.3;
 }
/* 제목*/	
h1 {
    line-height: 1.66;
    letter-spacing: 5px;
    margin: 0;
    padding: 0;
    font-weight: 900;
    color: #222;
    font-family: 'Montserrat';
    font-size: 24px;
    text-transform: uppercase;
    text-align: center;
    margin-bottom: 20px;
}
/*  컨테이너 css*/
.login-content{
	background:#fff;
	-webkit-border-radius: 10px;
	padding: 50px 85px;
}
#login-form {
    width: 480px;
    !important: ;
    position: relative;
    margin: 0 auto;
}
.loginhere {
    color: #555;
    font-weight: 500;
    text-align: center;
    margin-top: 91px;
    margin-bottom: 5px;
}



/*Checkboxes styles*/
input[type="checkbox"] { display: none; }

input[type="checkbox"] + label {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 20px;
  font: 14px/20px 'Open Sans', Arial, sans-serif;
  color: #ddd;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}

input[type="checkbox"] + label:last-child { margin-bottom: 0; }

input[type="checkbox"] + label:before {
  content: '';
  display: block;
  width: 20px;
  height: 20px;
  border: 1px solid #6cc0e5;
  position: absolute;
  left: 0;
  top: 0;
  opacity: .6;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

input[type="checkbox"]:checked + label:before {
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity: 1;
  border-top-color: transparent;
  border-left-color: transparent;
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}
.img-responsive{
	text-align:center;
}
body {
    padding-top: 60px;
    background-color: #2d3436;
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<body>
<div id="backgroundImage"></div>
<div class="main">
<div class="container" id="login-form">
	<div class="login-content">
	<form class="form-signin" action="login.do" method="post">
		<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>
		<input type="hidden" name="url" value="${url }" />
		<p style="left:50%">
		<img src="${pageContext.request.contextPath }/resources/images/acorn.png" alt="logo" class="img-responsive"
		onclick="location.href='../home.do'" style="margin:0px 0px 20px 0px; cursor:pointer; width:210px; heigh:180px;" />
			</p>
		<div class="form-group">
			<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-user" style="width:10px;"></i></div>
		<input type="text" id="id" required name="id" class="form-control" placeholder="아이디" value="${savedId }"/>
		</div>
		</div>
		<div class="form-group">
		<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-lock" style="width:10px;"></i></div>
				<input type="password" required id="pwd" name="pwd" class="form-control" 
				placeholder="비밀번호" value="${savedPwd }">
			</div>
		</div>
		
		<div class="form-group form-check">
    	<input type="checkbox" name="isSave" value="yes" class="form-check-input" id="idPwdSave">
   		 <label class="form-check-label" for="idPwdSave" style="color:black">아이디,비밀번호 저장</label>
  </div>
		
		<div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		<hr style="background-color:#FA8072">
		<p class="signuphere" style="margin-top:6px; font-weight:bold; text-align:center">
                    <a href="signup_form.do" class="signuphere-link" >회원가입</a>
                    </p>
	
	</div>
	</form>	
	
	</div>
</div>
</div>

</body>
</html>







