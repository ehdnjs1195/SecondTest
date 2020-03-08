<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/styles.css" />
<style>
	/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
	.help-block, .form-control-feedback{
		display: none;
	}
	.btn btn-primary {
	width: 100%;
	background-color: #2abb9b;
	border-color: #2abb9b;
	margin-bottom: 0.5em;
	border-radius: 0;
}
 
.input-group .form-control {
    margin: 0px !important;
}

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
</head>
<body>
<div id="backgroundImage">

    </div>
    <div class="main">
<div class="container">
	<div class="signup-content">
	<form action="signup.do" method="post" id="signupForm">
	
			<h1 class="form-title">회원가입</h1>
			
		<div class="form-group has-feedback">
		
			<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-user"></i></div>
			
			<input class="form-control" type="text" id="id" name="id" placeholder="아이디"/>
			
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
			</div>
			<p class="help-block" id="id_notusable">이미 사용중인 아이디 입니다.</p>
			<p class="help-block" id="id_required">필수 정보입니다.</p>
		</div>
		
		<div class="form-group has-feedback">
		<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-lock"></i></div>
			<input class="form-control" type="password" id="pwd" name="pwd" placeholder="비밀번호"/>
			
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
			</div>
			<p class="help-block" id="pwd_required">필수 정보입니다.</p>
			<p class="help-block" id="pwd_notequal">비밀번호가 일치하지 않습니다.</p>
			
		</div>
		
		<div class="form-group">
			<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-lock"></i></div>
			<input class="form-control" type="password" id="pwd2" name="pwd2" placeholder="비밀번호 확인"/>
			</div>
		</div>
		
		<div class="form-group has-feedback">
			<div class="input-group">
			 <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
			<input class="form-control" type="email" id="email" name="email" placeholder="이메일(선택)"/>
			<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span class="glyphicon glyphicon-ok form-control-feedback"></span>
			</div>
			<p class="help-block" id="email_notmatch">이메일 형식에 맞게 입력하세요</p>
			
		</div>
		<div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>  <a href="#" class="term-service">서비스 약관</a>에 동의합니다.</label>
                        </div>
		<div class="form-group">
		<button disabled="disabled" class="form-submit" id="submit" type="submit">가입</button>
		</div>
		<p class="loginhere">
                        이미 계정이 있으신가요? <a href="loginform.do" class="loginhere-link">로그인</a>
                    </p>
	</form>
	
</div>
</div>
</div>
<script>
	//아이디를 사용할수 있는지 여부 
	var isIdUsable=false;
	//아이디를 입력 했는지 여부 
	var isIdInput=false;
	
	//비밀번호를 확인란과 같게 입력 했는지 여부 
	var isPwdEqual=false;
	//비밀번호를 입력했는지 여부 
	var isPwdInput=false;
	
	//이메일을 형식에 맞게 입력했는지 여부 
	var isEmailMatch=false;
	//이메일을 입력했는지 여부
	var isEmailInput=false;
	
	//아이디 입력란에 한번이라도 입력한 적이 있는지 여부
	var isIdDirty=false;
	//비밀 번호 입력란에 한번이라도 입력한 적이 있는지 여부
	var isPwdDirty=false;
	
	//이메일을 입력할때 실행할 함수 등록
	$("#email").on("input", function(){
		var email=$("#email").val();
		
		if(email.match("@")){//이메일 형식에 맞게 입력 했다면
			isEmailMatch=true;
		}else{//형식에 맞지 않게 입력했다면 
			isEmailMatch=false;
		}
		
		if(email.length == 0){ //이메일을 입력하지 않았다면
			isEmailInput=false;
		}else{//이메일을 입력 했다면 
			isEmailInput=true;
		}
		//이메일 에러 여부 
		var isError=isEmailInput && !isEmailMatch;
		//이메일 상태 바꾸기 
		setState("#email", isError);
	});
	
	//비밀번호를 입력할때 실행할 함수 등록
	$("#pwd, #pwd2").on("input", function(){
		//상태값을 바꿔준다. 
		isPwdDirty=true;
		
		//입력한 비밀번호를 읽어온다.
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		
		if(pwd != pwd2){//두 비밀번호를 동일하게 입력하지 않았다면
			isPwdEqual=false;
		}else{
			isPwdEqual=true;
		}
		//isPwdEqual = pwd != pwd2 ? false : true;
		if(pwd.length == 0){
			isPwdInput=false;
		}else{
			isPwdInput=true;
		}
		//비밀번호 에러 여부 
		var isError=!isPwdEqual || !isPwdInput;
		//비밀번호 상태 바꾸기 
		setState("#pwd", isError);
	});

	//아이디를 입력할때 실행할 함수 등록 
	$("#id").on("input", function(){
		isIdDirty=true;
		
		//1. 입력한 아이디를 읽어온다.
		var inputId=$("#id").val();
		//2. 서버에 보내서 사용가능 여부를 응답 받는다.
		$.ajax({
			url:"${pageContext.request.contextPath }/users/checkid.do",
			method:"GET",
			data:{inputId:inputId},
			success:function(responseData){
				if(responseData.isExist){//이미 존재하는 아이디라면 
					isIdUsable=false;
				}else{
					isIdUsable=true;
				}
				//아이디 에러 여부 
				var isError= !isIdUsable || !isIdInput ;
				//아이디 상태 바꾸기 
				setState("#id", isError );
			}
		});
		//아이디를 입력했는지 검증
		if(inputId.length == 0){//만일 입력하지 않았다면 
			isIdInput=false;
		}else{
			isIdInput=true;
		}
		//아이디 에러 여부 
		var isError= !isIdUsable || !isIdInput ;
		//아이디 상태 바꾸기 
		setState("#id", isError );
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
		if(isEmailInput && !isEmailMatch){
			$("#email_notmatch").show();
		}
		//에러가 있다면 에러 메세지 띄우기
		if(!isPwdEqual && isPwdDirty){
			$("#pwd_notequal").show();
		}
		if(!isPwdInput && isPwdDirty){
			$("#pwd_required").show();
		}
		//에러가 있다면 에러 메세지 띄우기
		if(!isIdUsable && isIdDirty){
			$("#id_notusable").show();
		}
		
		if(!isIdInput && isIdDirty){
			$("#id_required").show();
		}
		if(isIdUsable){
			$("#id_notusable").hide();
			
		}
		if(isIdInput){
			$("#id_required").hide();
		}
		if(isPwdEqual){
			$("#pwd_required").hide()
			$("#pwd_notequal").hide();
		}
		if(isEmailMatch){
			$("#email_notmatch").hide();
		}
		//버튼의 상태 바꾸기 
		if(isIdUsable && isIdInput && isPwdEqual && 
				isPwdInput && (!isEmailInput || isEmailMatch) ){
			$("button[type=submit]").removeAttr("disabled");
		}else{
			$("button[type=submit]").attr("disabled","disabled");
		}
	}
</script>
</body>
</html>






