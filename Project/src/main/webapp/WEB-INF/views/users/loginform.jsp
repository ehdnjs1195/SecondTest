<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<style>
.boxes {
  margin: auto;
  padding: 50px;
  background: #484848;
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
</style>
<body>
<div id="backgroundImage">


    </div>

<div class="main">
<div class="container" id="login-form" style="width: 660px;">
	<div class="signin-content">
	<form class="form-signin" action="login.do" method="post">
		<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>
		<input type="hidden" name="url" value="${url }" />
		<img src="${pageContext.request.contextPath }/resources/images/acorn.png" alt="" class="img-responsive"
		onclick="location.href='../home.do'" style="margin:0px 0px 20px 0px; cursor:pointer" />
			
		<div class="form-group">
			<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-user" style="width:9px;"></i></div>
		<input type="text" id="id" required name="id" class="form-control" placeholder="아이디" value="${savedId }"/>
		</div>
		</div>
		<div class="form-group">
		<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-lock"></i></div>
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
		<button class="btn btn-lg btn-warning" onclick="location.href='signup_form.do'" type="button">회원가입</button>
	
	</div>
	</form>	
	
	</div>
</div>
</div>


</body>
</html>







