<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="${pageContext.request.contextPath }/include/navbar.jsp"></jsp:include>
<jsp:include page="${pageContext.request.contextPath }/include/resource.jsp"></jsp:include>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<style>
.neon{
	font-family: fantasy, sans-serif;
}
.input-group .form-control-feedback {
    z-index: 3;
}

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
  width: 460px;
  padding: 0px;
  margin: 0px;
}
/* 배경화면*/
#backgroundImage{
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
.signup-content{
	background:#fff;
	-webkit-border-radius: 10px;
	padding: 50px 85px;
}
#signup-form {
    width: 660px;
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
/* 체크박스 스타일*/
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

input[type="checkbox"] + label:last-child { margin-bottom: 0; margin-top: 3px;}

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

</style>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div id="backgroundImage"></div>
    <div class="main">
	

</div>
<script>

</script>
</body>
</html>






