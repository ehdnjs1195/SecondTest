<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_updateform.jsp</title>
<jsp:include page="../include/resource.jsp" />
<jsp:include page="../include/navbar.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>
<style>
.input-group .form-control-feedback {
    z-index: 3;
}
/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
.help-block, .form-control-feedback {
	display: none;
}

.btn btn-primary {
	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
	margin: inherit;

	
}
.btn btn-primary:hover {
	 box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
  background: tomato; 

  color: white;

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
.login-content {
	background: #fff;
	-webkit-border-radius: 10px;
	padding: 50px 85px;
}

#info-form { !
	important:;
	position: relative;
	margin: 0 auto;
}

.img-responsive {
	text-aling: center;
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

h1 {
	font-size: 40px;
}

#profileForm {
	display: none;
}

#pwd-form {
	background: #fff;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-o-border-radius: 10px;
	-ms-border-radius: 10px;
	padding: 50px 85px;
	opacity: 0.9;
	width: 420px;
}

p {
	font: 15px;
}

.img-responsive {
	display: block;
	max-width: 200px;
	height: 200px;
	margin: 0px auto;
}

#background{
	display: none;
}
.neon{
    font-family: fantasy;
}
#navbarContainer{
	height: 61.781px;
}
.pull-right{
	margin-top: 5px;
}
#pwd-form{
	margin-top: 10px;
}
/* footer */
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

.footer-menu-items {
	padding-left: 0px;
	font-family: auto;
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
								class="form-control" placeholder="현재 비밀번호"> <span>
								<span class="glyphicon glyphicon-remove form-control-feedback"></span>
								<span class="glyphicon glyphicon-ok form-control-feedback"></span>
							</span>

						</div>
						<p class="help-block" id="pwd_notmatch">비밀번호가 일치하지 않습니다.</p>
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-lock"></i>
							</div>
							<input type="password" required id="newPwd" name="newPwd"
								class="form-control" placeholder="새 비밀번호"> <span>
								<span class="glyphicon glyphicon-remove form-control-feedback"></span>
								<span class="glyphicon glyphicon-ok form-control-feedback"></span>
							</span>
						</div>
						<p class="help-block" id="newPwd_required">필수 정보입니다.</p>
						<p class="help-block" id="noSpace_required">공백은 입력할수없습니다.</p>
						<p class="help-block" id="newPwd_notequal">아래의 확인란과 동일하게 입력하세요</p>
						<p class="help-block" id="pwdChk_required">영문, 숫자, 특수문자 조합
							8자리~20자리 이내로 입력하세요.</p>
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
						<button disabled="disabled" class="btn btn-primary" type="submit"
							style="width: 100%;">비밀번호 변경</button>
					</div>
				</form>
				<p style="margin-top: 6px; font-weight: bold; text-align: center">
					<a href="info.do">되돌아가기</a>
				</p>
			</div>
		</div>
	</div>
	<!-- footer -->
	<footer id="kn-footer" style="font-family: auto;">
		<div class="container">
			<div class="kn-info-wrapper">
				<div class="kinolights-ci"></div>
				<div class="kn-info">
					<ul class="footer-menu-items">
						<li class="footer-menu-item"><a href="#" target="_blank">이용약관</a>
						</li>
						<li class="footer-menu-item"><a href="#" target="_blank">개인정보취급방침</a>
						</li>
						<li class="footer-menu-item"><a href="#">사용 설명서</a></li>
						<li class="footer-menu-item"><a href="#"
							class="btn-kn-report-db">이용문의 및 DB제보</a></li>
					</ul>
				</div>
				<div class="kn-copyright">
					<p>
						<strong style="color: #b3bfdd;">업무 제휴 문의 : <a
							href="mailto:znql16@gmail.com" style="color: #b3bfdd;">znql16@gmail.com</a></strong>
					</p>
					<br> Copyright © 스포일러 Spoiler ALL RIGHTS RESERVED.
				</div>
				<ul class="sns-items">
					<li class="sns-item"><a
						href="https://post.naver.com/my.nhn?memberNo=43999716"
						target="_blank" rel="noopener" aria-label="네이버 포스트"
						title="네이버 포스트"> <i class="icon-post"></i>
					</a></li>
					<li class="sns-item"><a
						href="https://www.facebook.com/KINOLIGHTS/" target="_blank"
						rel="noopener" aria-label="페이스북" title="페이스북"> <i
							class="icon-facebook"></i>
					</a></li>
					<li class="sns-item"><a
						href="https://www.instagram.com/kinolights/" target="_blank"
						rel="noopener" aria-label="인스타그램" title="인스타그램"> <i
							class="icon-instagram"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</footer>
<script>
//비밀번호를 확인란과 같게 입력 했는지 여부 
var isPwdEqual=false;
//비밀번호를 입력했는지 여부 
var isPwdInput1=false;
var isPwdInput2=false;
// 비밀번호 정규식 
var rightPw = false;
// 아이디 정규식
//비밀번호를 입력할때 실행할 함수 등록
var isPwdDirty1=false;
var isPwdDirty2=false;
var isPwdDirty3=false;

var isPwdright=false;
var Message=false;
	
	if(Message){
		$("#pwd_notmatch").show();
	}else{
		$("#pwd_notmatch").hide();
	}
	
	$("#newPwd, #newPwd2").on("input", function(){
		//상태값을 바꿔준다. 
		isPwdDirty2=true;
		rightPw = chkPw();	
		//입력한 비밀번호를 읽어온다.
		var newPwd = $("#newPwd").val();
		var newPwd2= $("#newPwd2").val();
		
		 
		
		
	
		if(newPwd != newPwd2){//두 비밀번호를 동일하게 입력하지 않았다면
			isPwdEqual=false;
		}else{
			isPwdEqual=true;
		}
		//isPwdEqual = pwd != pwd2 ? false : true;
		if(newPwd.length == 0){
			isPwdInput2=false;
		}else{
			isPwdInput2=true;
		}
		//비밀번호 에러 여부 
		var isError=!rightPw || !isPwdEqual || !isPwdInput2;
		//비밀번호 상태 바꾸기 
		setState("#newPwd", isError);
		
	});
	
	
	function chkPw(){
		var newPwd = $("#newPwd").val();
		var num = newPwd.search(/[0-9]/g);
		var eng = newPwd.search(/[a-z]/ig);
		var spe = newPwd.search(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi);
		
		 if(newPwd .length < 8 || newPwd .length > 20 ){
				return false;
			 }else if(newPwd .search(/\s/) != -1){
				return false;
			 }else if(num < 0 || eng < 0 || spe < 0 ){
				 return false;
			 }else {
				 console.log("통과");
				return true;				 
			}
	};
	
	
	
		
		//아이디를 입력할때 실행할 함수 등록 
		$("#pwd").on("input", function(){
			isPwdDirty1=true;
			//1. 입력한 비밀번호를 읽어온다.
			var inputPw=$("#pwd").val();
			//2. 서버에 보내서 사용가능 여부를 응답 받는다.
			$.ajax({
				url:"${pageContext.request.contextPath }/users/checkpwd.do",
				method:"POST",
				data:{"inputPw":inputPw},
				success:function(responseData){
					if(responseData.isPwdright){//이미 존재하는 아이디라면 
						
						isPwdright= true;
					}else{
						
						isPwdright=false;
					}
					 //아이디 에러 여부 
					var isError= !isPwdright;
					//아이디 상태 바꾸기 
					setState("#pwd", isError ); 
				}
			});
			 //아이디를 입력했는지 검증
			if(inputPw.length == 0){//만일 입력하지 않았다면 
				isPwdInput1=false;
			}else{
				isPwdInput1=true;
				
				
			}
			 
		});
		
		//입력란의 상태를 바꾸는 함수 
		function setState(sel, isError){
			//일단 UI 를 초기 상태로 바꿔준다.
			$(sel)
			.parent()
			.removeClass("has-success has-error")
			.find(".help-block, .form-control-feedback")
			.hide();
			
			//입력란의 색상과 아이콘을 바꿔주는 작업 
			if(isError){
				//입력란이 error 인 상태
				$(sel)
				.parent()
				.addClass("has-error")
				.find(".glyphicon-remove")
				.show();
			}else{
				//입력란이 success 인 상태
				$(sel)
				.parent()
				.addClass("has-success")
				.find(".glyphicon-ok")
				.show();
			}
			//에러가 있다면 에러 메세지 띄우기
			if(!isPwdright && isPwdDirty1){
				$("#pwd_notmatch").show();
			}else{
				$("#pwd_notmatch").hide();
			}
			//에러가 있다면 에러 메세지 띄우기
			if(!isPwdEqual && isPwdDirty2){
				$("#newPwd_notequal").show();
				
			}else{
				$("#newPwd_notequal").hide();

			}
			if(!isPwdInput2 && isPwdDirty2){
				$("#newPwd_required").show();
			}else{
				$("#newPwd_required").hide();
				
			}
			
			if(!isPwdInput2 && isPwdDirty2){
				$("#newPwd_required").show();
			}else{
				$("#newPwd_required").hide();
				
			}
			
			

			if(    ($("#newPwd").val().length < 8 || $("#newPwd").val().length > 20)  && isPwdInput2){
				$("#pwdChk_required").show();
			}else{
				$("#pwdChk_required").hide();
			}
			
			
			if($("#newPwd").val().search(/\s/) != -1 && isPwdInput2){
				 $("#noSpace_required").show();

			}else{
				 $("#noSpace_required").hide();
			}
			
		

		//버튼의 상태 바꾸기 
		if(rightPw && isPwdEqual && isPwdright){
		
			$("button[type=submit]").removeAttr("disabled");
		}else{
			$("button[type=submit]").attr("disabled","disabled");
			
		}
		}
	
	</script>
</body>
</html>











