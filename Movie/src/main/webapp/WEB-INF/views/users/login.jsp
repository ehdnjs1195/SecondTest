<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${not empty sessionScope.id }">
			
		
     <script type="text/javascript">
     alert("${id}님 환영합니다")
      	location.href="${url}";
     </script>
						
		</c:when>
		<c:otherwise>
		<script>
		window.alert("아이디와 비밀번호가 일치하지 않습니다. 다시 확인해주세요.")
			location.href="loginform.do?url=${encodedUrl }"
				</script>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>






