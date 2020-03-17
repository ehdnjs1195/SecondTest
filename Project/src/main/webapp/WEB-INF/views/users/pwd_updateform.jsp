<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_updateform.jsp</title>
<jsp:include page="../include/resource.jsp" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<body>

	<div id="backgroundImage"></div>

	<div class="main">
		<div class="container" id="login-form" style="width: 660px;">
			<div class="signin-content">

				<form class="form-signin" action="pwd_update.do" method="post">
					<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>
					<input type="hidden" name="url" value="${url }" /> <img
						src="${pageContext.request.contextPath }/resources/images/acorn.png"
						alt="" class="img-responsive" onclick="location.href='../home.do'"
						style="margin: 0px 0px 20px 0px; cursor: pointer" />

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











