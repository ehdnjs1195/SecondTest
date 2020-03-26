<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/updateform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<jsp:include page="../include/navbar.jsp" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
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
h3 {
    line-height: 1.66;
    letter-spacing: 1px;
    margin: 0;
    padding: 0;
    font-weight: 900;
    color: #222;
    font-family: 'Montserrat';
    font-size: 20px;
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
#info-form {
   
    !important: ;
    position: relative;
    margin: 0 auto;
}

.img-responsive{
	text-aling:center;
}
body {
    padding-top: 60px;
    background-color: #2d3436;
}

.bold {
	font-weight: bold;
}

.tm-border {
	border: 5px solid #fff;
	box-shadow: 2px 2px #000;
}

.shadow {
	text-shadow: 1px 1px #000;
}
header img {
  display: inline-block !important;
  text-align: center;
  
}
.tm-title {
	color: #1F618D;
	margin-top: 20px;
	
}


	h1 {font-size:40px;
}
	
	#profileForm{
		display: none;
	}
	
#update-form{
    background: #fff;
    border-radius: 10px;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    -o-border-radius: 10px;
    -ms-border-radius: 10px;
    padding: 50px 85px;
    opacity:0.9;
     width: 380px;
}

p{
	font:15px;
}


.img-responsive{
	display: block;
    max-width: 200px;
    height: 200px;
    margin: 0px auto;
}

.btn.btn-block {
    margin: inherit;
    display: block;
    width: 100%;
}
.btn-block {
    display: block;
    width: 100%;
}
</style>

<body>
<div id="backgroundImage"></div>

<div class="container" id="update-form">

	<div class="update-content">
	
	<h3>회원정보 수정폼</h3>
	
	<form action="update.do" method="post">
		<input type="hidden" name="id" value="${id }"/>
		<input type="hidden" name="url" value="${url }" />
		<div class="form-group">
			<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-user" style="width:9px;"></i></div>
		<input type="text" id="id" required name="id" class="form-control" placeholder="아이디" value="${id }" disabled/>
		</div>
		</div>
		<div class="form-group">
			<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-envelope" style="width:11px; margin-left:-2px;"></i></div>
			<input class="form-control" type="text" id="email" name="email"
				value="${dto.email }"/>
				</div>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">수정확인</button>
		<p style="text-align:center; margin-top:10px;"><a href="info.do">되돌아가기</a></p>
	</form>
</div>
</div>
</body>
</html>










