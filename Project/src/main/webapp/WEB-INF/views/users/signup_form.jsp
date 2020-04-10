<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>

<jsp:include page="../include/resource.jsp"></jsp:include>
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
div.scroll-wrapper{
    overflow: auto;
    border:solid 1px gray;
    height: 200px;
    width: 460px;
	overflow-x: auto;
	overflow-y: auto;
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

input[type="checkbox"] + label:last-child { 
	margin-bottom: 0; margin-top: 3px;
}

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
#background{
	display: none;
}
.signup-content{
	margin-top: 10px;
}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div id="backgroundImage"></div>
<div class="main">
	<div class="container" id="signup-form">
		<div class="signup-content">
			<h1 class="form-title">회원가입</h1>
			<hr>
			<div class="agreement">
				<div>
					<ul style="list-style:none; padding-left:0px">
						<li>
							<h4 class="agreement-title" style="text-align:center; font-weight:bold; font-size:13px">회원가입 약관(필수)</h4>	
							<div class="scroll-wrapper agreement_box scrollbar-macosx" style="position:relative;">
								<div class="agreement_box scrollbar-macosx scroll-content scroll-scrolly_visible" style="height: auto; margin-bottom: 0px; margin-right:0px; max-height:200px;">
									<div class="inner" style="font-size:13px">
									<div>&nbsp;</div>
									<div>제3조(회원 가입)</div>
									<div><span style="line-height:1.5;">이용약관 (Spoiler)</span></div>
									<div>--------------------------------------------------------------------------------</div>
									<div class="agreement-content">
										제 1 장 총 칙 (노예계약)
										<div>제 1 조 (목적)
											이 약관은 SPOILER(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.
										</div>
										<div>
											제 2 조 (약관의 효력 및 변경)
											① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
											② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.
										</div>
										<div>
											제 3 조 (용어의 정의)
											이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
											① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
											② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
											③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
											④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
											⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.
										</div>
										<div>
											제 2 장 서비스 이용계약
										</div>
										<div>
											제 4 조 (이용계약의 성립)
											① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
											② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.
										</div>
										<div>
											제 5 조 (이용신청)
											① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
											② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.
										</div>
										<div>
											제 6 조 (이용신청의 승낙)
											① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
											② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
											가. 서비스 관련 설비에 여유가 없는 경우
											나. 기술상 지장이 있는 경우
											다. 기타 사이트가 필요하다고 인정되는 경우
											③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
											가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
											나. 이용자 정보를 허위로 기재하여 신청한 경우
											다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
											라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우
										</div>
										<div>
											제 7 조 (이용자정보의 변경)
											회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.
										</div>
										<div>
										제 3 장 계약 당사자의 의무
										</div>
										<div>
											제 8 조 (사이트의 의무)
											① 사이트는 회원에게 각 호의 서비스를 제공합니다.
											가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
											나. 추가 도메인 등록시 개인정보 자동 입력
											다. 도메인 등록, 관리를 위한 각종 부가서비스
											② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
											가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
											나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
											다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
											③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.
										</div>
										<div>
											제 9 조 (회원의 의무)
											① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
											가. 다른 회원의 ID를 부정하게 사용하는 행위
											나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
											다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
											라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
											마. 범죄와 결부된다고 객관적으로 판단되는 행위
											바. 기타 관계법령에 위배되는 행위
											② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
											③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.
										</div>								 
										<div>
											제 4 장 서비스 제공 및 이용
										</div>							 
										<div>
											제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)
											① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
											② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.
										</div>								 
										<div>
											제 11 조 (서비스 제한 및 정지)
											① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
											② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.
										</div>							
										<div>
											제5장 계약사항의 변경, 해지
										</div>								 
										<div>
											제 12 조 (정보의 변경)
											회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.
										</div>							 
										<div>
											제 13 조 (계약사항의 해지)
											회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
											① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
											② 정보통신윤리위원회가 이용해지를 요구한 경우
											③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
											④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
											사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.
										</div>					 
										<div>
											제6장 손해배상
										</div>			 
										<div>
											제 14 조 (면책조항)
											① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
											② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
											③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
											④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.
										</div>	 
										<div>
											제 15 조 (관할법원)
										</div>							 
										<div>
											서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.
										</div>						 
										<div>
											[부칙]
										</div>				 
										<div>
											(시행일) 이 약관은 2015년 01월부터 시행합니다.
										</div>								
									</div>
									<div class="scroll-element scroll-x scroll-scrolly_visible">
										<div class="scroll-element_outer">
											<div class="scroll-element_size"></div>
											<div class="scroll-element_track"></div>
											<div class="scroll-bar" style="width:89px;"></div>
										</div>
									</div>
									<div class="scroll-element scroll-y scroll-scrolly_visible">
										<div class="scroll-element_outer">
											<div class="scroll-element_size"></div>
											<div class="scroll-element_track"></div>
											<div class="scroll-bar" style="height:12px; top:0px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>			
						<input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required/>
						<label for="agree-term" class="label-agree-term" style="color:black; font-weight:bold">
                     		위의 내용을 모두 읽었으며 동의합니다.
                   		</label>                   		
	           		</li>
				</ul>
			</div>
		</div>						
		<form action="signup.do" method="post" id="signupForm">	
			<div class="form-group has-feedback">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user" style="width:11px; margin-left:-2px;"></i>
					</div>
					<input class="form-control" type="text" id="id" name="id" placeholder="아이디"/>
					<span>
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					</span>
				</div>
				<p class="help-block" id="id_notusable">이미 사용중인 아이디 입니다.</p>
				<p class="help-block" id="id_required">필수 정보입니다.</p>
				<p class="help-block" id="id_mix">5자리이상 20이하 영문, 숫자 조합으로 입력 하세요.</p>
				<p class="help-block" id="noSpace_id">공백은 입력 할 수 없습니다.</p>
			</div>		
			<div class="form-group has-feedback">
				<div class="input-group">
					<div class="input-group-addon"><i class="fa fa-lock"></i></div>
					<input class="form-control" type="password" id="pwd" name="pwd" placeholder="비밀번호"/>
					<span>
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					</span>
				</div>
				<p class="help-block" id="pwd_required">필수 정보입니다.</p>
				<p class="help-block" id="noSpace_required">공백은 입력할수없습니다.</p>
				<p class="help-block" id="pwdChk_required">영문, 숫자, 특수문자 조합 8자리~20자리 이내로 입력하세요.</p>
				<p class="help-block" id="pwd_notequal">비밀번호가 일치하지 않습니다.</p>
			</div>		
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-lock"></i>
					</div>
					<input class="form-control" type="password" id="pwd2" name="pwd2" placeholder="비밀번호 확인"/>
				</div>
			</div>	
			<div class="form-group has-feedback">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-envelope" style="width:11px; margin-left:-2px;"></i>
					</div>
					<input class="form-control" type="email" id="email" name="email" placeholder="이메일(선택)"/>
					<span>
						<span class="glyphicon glyphicon-remove form-control-feedback"></span>
						<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					</span>	
				</div>
				<p class="help-block" id="email_notmatch">이메일 형식에 맞게 입력하세요</p>			
			</div>	
			<button disabled="disabled" class="btn btn-primary" type="submit" style="width:460px; font-size:20px;">
				가입
			</button>		
		</form>
		<p class="loginhere" style="margin-top:60px; font-weight:bold;">
			이미 계정이 있으신가요?
			<a href="loginform.do" class="loginhere-link">로그인</a>
		</p>
		<p style="text-align:center; margin-top:6px"><a href="${pageContext.request.contextPath }/home.do">메인 페이지</a></p>
		</div>
	</div>	
</div>
<script>
//체크박스 체크되있는지 여부
var isChecked=false;
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
// 비밀번호 정규식 
var rightPw = false;
// 아이디 정규식
var rightId = false;
// 이메일 정규식
var rightEmail= false;
//아이디 입력란에 한번이라도 입력한 적이 있는지 여부
var isIdDirty=false;
//비밀 번호 입력란에 한번이라도 입력한 적이 있는지 여부
var isPwdDirty=false;
var isEmailDirty=false;

   $("#agree-term").change(function(){
       if($("#agree-term").is(":checked")){
       	isChecked=true;
       }else{
       	isChecked=false;
       	
       }
	if((rightId && rightPw && isChecked && isIdUsable && isIdInput && isPwdEqual && isPwdInput) && (!isEmailInput || isEmailMatch)){
	
		$("button[type=submit]").removeAttr("disabled");
	}else{
		$("button[type=submit]").attr("disabled","disabled");
	}
   });

//이메일을 입력할때 실행할 함수 등록
$("#email").on("input", function(){	
	var email=$("#email").val();
	
	rightEmail=chkEmail();
	
	if(!rightEmail && email.match("@")){

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
	var isError= rightEmail && isEmailInput && !isEmailMatch;
	//이메일 상태 바꾸기 
	setState("#email", isError);
});

//비밀번호를 입력할때 실행할 함수 등록
$("#pwd, #pwd2").on("input", function(){
	//상태값을 바꿔준다. 
	isPwdDirty=true;	
	//입력한 비밀번호를 읽어온다.
	var pwd = $("#pwd").val();
	var pwd2= $("#pwd2").val();	
	rightPw = chkPw();	

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
	var isError=!rightPw || !isPwdEqual || !isPwdInput;
	//비밀번호 상태 바꾸기 
	setState("#pwd", isError);
});

function chkEmail(){
	var email=$("#email").val();
	var spe = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;		
	if(spe.test(email)==true){		
		return false;
	}else{			
		return true;
	}
}
function chkId(){
	var id = $("#id").val();
	var num = id.search(/[0-9]/g);
	var eng = id.search(/[a-z]/ig);
	var spe = id.search(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi);
	
	 if(id.length < 5 || id.length > 19 ){
		 	return false;
		 }else if(id.search(/\s/) != -1){
			return false;
		 }else if(num < 0 || eng < 0 || spe > 0 ){
			 return false;
		 }else {
			
			 console.log("아이디통과");

			return true;				 
		}
};	

function chkPw(){
	var pwd = $("#pwd").val();
	var num = pwd.search(/[0-9]/g);
	var eng = pwd.search(/[a-z]/ig);
	var spe = pwd.search(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi);
	
	 if(pwd.length < 8 || pwd.length > 20 ){
			return false;
		 }else if(pwd.search(/\s/) != -1){
			return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
			 return false;
		 }else {
			 console.log("통과");
			return true;				 
		}
};

//아이디를 입력할때 실행할 함수 등록 
$("#id").on("input", function(){
	isIdDirty=true;
	rightId=chkId();
	
	//1. 입력한 아이디를 읽어온다.
	var inputId=$("#id").val();
	//2. 서버에 보내서 사용가능 여부를 응답 받는다.
	$.ajax({
		url:"${pageContext.request.contextPath }/users/checkid.do",
		method:"GET",
		data:{"inputId":inputId},
		success:function(responseData){
			if(responseData.isExist){//이미 존재하는 아이디라면 
				isIdUsable=false;
			}else{
				isIdUsable=true;
			}
			//아이디 에러 여부 
			var isError= !rightId || !isIdUsable || !isIdInput ;
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
	var isError= !rightId || !isIdUsable || !isIdInput;
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
	if(!isIdUsable && isIdDirty){
		$("#id_notusable").show();
	}else{
		$("#id_notusable").hide();
		
	}
	
	//에러가 있다면 에러 메세지 띄우기
	if(!isPwdEqual && isPwdDirty){
		$("#pwd_notequal").show();
	}else{
		$("#pwd_notequal").hide();

	}
	if(!isPwdInput && isPwdDirty){
		$("#pwd_notmatch").show();
	}else{
		$("#pwd_notmatch").hide();
		
	}
	
	if(!isIdInput && isIdDirty){
		$("#id_required").show();
	}else{
		$("#id_required").hide();
	}
	
	if(($("#pwd").val().search(/\s/) != -1) && isPwdDirty){
		 $("#noSpace_required").show();

	}else{
		 $("#noSpace_required").hide();
	}
	
	if(isEmailInput && !isEmailMatch){
		$("#email_notmatch").show();
	}else{
		$("#email_notmatch").hide();
		
	}

	if(  
		isIdDirty	&&
			(
			$("#id").val().length < 5 || $("#id").val().length > 19
			|| 
			$("#id").val().search(/[0-9]/g)<0 || $("#id").val().search(/[a-z]/ig) <0 
			|| 
			$("#id").val().search(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi) >0 ) 
			)
	{
		 $("#id_mix").show();
	}else{
		 $("#id_mix").hide();
		
	}	 

	if(  isPwdDirty
			&&
			(
					($("#pwd").val().length < 8 || $("#pwd").val().length > 20 ) 
			
	&&	(	$("#pwd").val().search(/[0-9]/g) 
	|| 	$("#pwd").val().search(/[a-z]/ig) 
	|| $("#pwd").val().search(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi )
	)))
	{

		$("#pwdChk_required").show();
	}else{
		$("#pwdChk_required").hide();
	}
	
	if($("#id").val().search(/\s/) != -1 && isPwdDirty){
		 $("#noSpace_id").show();

	}else{
		 $("#noSpace_id").hide();
	}
	
	//버튼의 상태 바꾸기 
	if(rightId && rightPw && isChecked && isIdUsable && isIdInput && isPwdEqual && isPwdInput &&  (!isEmailInput || isEmailMatch)){
	
		$("button[type=submit]").removeAttr("disabled");
	}else{
		$("button[type=submit]").attr("disabled","disabled");
	}
}
</script>
</body>
</html>






