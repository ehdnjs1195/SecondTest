<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/styles.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="backgroundImage">


    </div>

</div>
<div class="main">
<div class="container">
	<div class="signin-content">
	<form class="form-signin" action="login.do" method="post">
		<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>
		<input type="hidden" name="url" value="${url }" />
		<img src="${pageContext.request.contextPath }/resources/images/acorn.png" alt="" class="img-responsive"
		onclick="home.do" />
			
		<div class="form-group">
			<div class="input-group">
			<div class="input-group-addon"><i class="fa fa-user"></i></div>
		<input type="text" id="id" name="id" class="form-control" placeholder="아이디" value="${savedId }"/>
		</div>
		</div>
		<div class="form-group">
		<div class="input-group">
		<div class="input-group-addon"><i class="fa fa-lock"></i></div>
			<input type="password" id="pwd" name="pwd" class="form-control" 
			placeholder="비밀번호" value="${savedPwd }">
		</div>
		</div>
		
		<div class="checkbox">
			<label>
				<input type="checkbox" name="isSave" value="yes"/>로그인 정보 저장
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		<hr>
	<button  type="button" onclick="location.href='signup_form.do' " class="btn btn-lg btn-warning" style="width=12px" type="submit">회원가입</button>
	</form>	
	
	</div>
</div>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
</body>
</html>







