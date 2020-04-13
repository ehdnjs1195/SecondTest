<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<style>

.neon{
	font-family: fantasy, sans-serif;
	padding: 0px 72px;
	top: -20px;	
	position: relative;
	font-size: 3em;
    color: dimgrey;
}
.neon:after{
    content: attr(data-text);
    position: absolute;
    top: 0;
    left: 0;
    padding: 0 20px;
    z-index: -1;
    color: #ff005b;
    filter: blur(15px);
}
.neon::before{
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #fe3a80;
    z-index: -2;
    opacity: .5;
    filter: blur(40px);
}
/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
.help-block, .form-control-feedback {
	display: none;
}

.btn btn-primary {
	width: 100%;
	background-color: #2d3436;
	border-color: #2d3436;
	margin-bottom: 0.5em;
	border-radius: 0;
}
.btn{
	font-size: smaller !important;
	font-family: fantasy;
}
.btn-primary:hover {
   	color: #00ffd0 !important;
}

.input-group .form-control {
	margin: 0px !important;
}

div.scroll-wrapper {
	overflow: auto;
	border: solid 1px gray;
	height: 200px;
	width: 460px;
	overflow-x: auto;
	overflow-y: auto;
}

.agreement-title {
	
}

.scroll-wrapper:hover {
	background-color: #FEF9E7;
}

.h4 {
	background-color: lightgrey;
	width: 500px;
	padding: 0px;
	margin: 0px;
}
/* 배경화면*/
#backgroundImage {
	z-index: 1;
}

#backgroundImage:before {
	content: "";
	position: fixed;
	z-index: -1;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.8)),
		url(${pageContext.request.contextPath }/resources/images/bg.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size : auto;
	filter: grayscale(80%);
	height: auto;
	width: auto;
	opacity: 0.3;
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
.login-content {
	background: #fff;
	-webkit-border-radius: 10px;
	padding: 50px 85px;
}

#login-form {
	width: 480px; !
	important:;
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
input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
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

input[type="checkbox"]+label:last-child {
	margin-bottom: 0;
}

input[type="checkbox"]+label:before {
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

input[type="checkbox"]:checked+label:before {
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

.img-responsive {
	text-align: center;
}

body {
	padding-top: 60px;
	background-color: #2d3436;
}
#background{
	display: none;
}
#navbarContainer{
	height: 61.781px;
}
.login-content{
    margin-top: 10px;
}
.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #2d3436 !important;
    border: #FBFCFC ;
}
// footer CSS
.footer-menu-items {
	padding-left: 0px;
	font-family: auto;
}
.items img {
	height: 263.469px !important;
}

body #kn-footer .container .kn-info-wrapper {
	position: relative;
	padding: 50px 0;
	margin: 0 auto;
	text-align: center;
}

body #kn-footer .container .kn-info-wrapper .kinolights-ci {
	position: absolute;
	left: 0;
	top: 40px;
	width: 91px;
	height: 53px;
	text-align: center;
}

body #kn-footer .container .kn-info-wrapper .kn-copyright {
	margin-top: 15px;
	font-size: 12px;
	font-weight: normal;
	color: #546cb2;
}

body #kn-footer .container .kn-info-wrapper .sns-items {
	position: absolute;
	right: 0;
	top: 55px;
	display: inline-block;
	vertical-align: middle;
}

ol, ul {
	list-style: none;
	text-align: center;
	padding:0;
}

body #kn-footer .container .kn-info-wrapper .sns-items .sns-item {
	float: left;
	margin-right: 15px;
	margin-bottom: 12px;
	line-height: 24px;
}

body #kn-footer .container .kn-info-wrapper .sns-items .sns-item:last-of-type
	{
	margin-right: 0;
}

body #kn-footer .container .kn-info-wrapper .kn-info .footer-menu-items .footer-menu-item a
	{
	text-decoration: none;
	font-size: 14px;
	font-weight: normal;
	color: #b3bfdd;
}


/* Media Queries by. 유석 */
@media screen and (min-width: 389px) and (max-width: 767px) {
	#genre {
		margin-top: 30px;
	}
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<body>
	<div id="backgroundImage"></div>
	<div class="main">
		<div class="container" id="login-form">
			<div class="login-content">
				<form class="form-signin" action="login.do" method="post">
					<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>
					<input type="hidden" name="url" value="${url }" />
						<!-- 홈페이지 링크와 버튼을 넣어둘 div -->
			<div class="loginform-header">
					<a class="loginform-brand" href="${pageContext.request.contextPath }/home.do">
				<span class="neon" data-text="SPOILER">SPOILER</span>
								</a>
			<button class="navbar-toggle" data-toggle="collapse" data-target="#one"></button>
			</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-user" style="width: 10px;"></i>
							</div>
							<input type="text" id="id" required name="id" class="form-control" placeholder="아이디" value="${savedId }" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-lock" style="width: 10px;"></i>
							</div>
							<input type="password" required id="pwd" name="pwd" class="form-control" placeholder="비밀번호" value="${savedPwd }">
						</div>
					</div>
					<div class="form-group form-check">
						<input type="checkbox" name="isSave" value="yes" class="form-check-input" id="idPwdSave"
							<c:if test="${not empty savedId }">
								checked
							</c:if>
						> 
						<label class="form-check-label" for="idPwdSave" style="color: black">
							아이디,비밀번호 저장
						</label> 
					</div>
					<div>
						<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
					</div>
				</form>
				<hr style="background-color: #FA8072">
				<p class="signuphere" style="margin-top: 6px; font-weight: bold; text-align: center">
					<a href="signup_form.do" class="signuphere-link">회원가입</a>
				</p>
			</div>
		</div>
		<jsp:include page="../include/footer.jsp"></jsp:include>


    
</body>
</html>







