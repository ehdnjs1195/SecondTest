<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/favorite_update</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>


			<script>
				alert("관심목록에 추가합니다.");
				window.location.href="${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/detail.do?movieSeq=${dto.movieSeq}%&movieId=${dto.movieId}";
			</script>
		
	
</body>
</html>







