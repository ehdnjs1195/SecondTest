<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_updateform.jsp</title>
<jsp:include page="../include/resource.jsp" />
<jsp:include page="../include/navbar.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
	
#pwd-form{
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
}

</style>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<body>

	<div id="backgroundImage"></div>

	<div class="main">
		<div class="container" id="pwd-form">
			<div class="signin-content">

				<form class="form-signin" action="pwd_update.do" method="post">
					<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>

					<h3 style="font-weight: bold; text-align: center">회원 비밀번호 변경</h3>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-lock"></i>
							</div>
							<input type="password" required id="pwd" name="pwd"
								class="form-control" placeholder="현재 비밀번호">

						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-lock"></i>
							</div>
							<input type="password" required id="newPwd" name="newPwd"
								class="form-control" placeholder="새 비밀번호">
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-lock"></i>
							</div>
							<input type="password" required id="newPwd2" name="newPwd2"
								class="form-control" placeholder="새 비밀번호 확인">
						</div>
					</div>

					<div>

						<button class="btn btn-lg btn-primary btn-block" type="submit">비밀번호
							변경</button>
						
					</div>
				
				</form>
							<p style="margin-top:6px; font-weight:bold; text-align:center">
							<a href="info.do">되돌아가기</a></p>
			</div>
		</div>


	</div>
	<script>
		//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
		$("form").on("submit", function() {
			//새 비밀번호 2개가 일치하는지 확인
			var pwd = $("#newPwd").val();
			var pwd2 = $("#newPwd2").val();
			if (pwd != pwd2) {
				alert("새로운 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");//알림 띄우기
				$("#newPwd").focus();//포커스 주기
				return false;//폼 전송 막기
			}
		});
	</script>
</body>
</html>











