<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/insert.jsp</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<script>
		alert("${dto.id }"+"회원님 가입 되었습니다.");
		location.href="${pageContext.request.contextPath }/users/loginform.do";
</script>
</body>
</html>






