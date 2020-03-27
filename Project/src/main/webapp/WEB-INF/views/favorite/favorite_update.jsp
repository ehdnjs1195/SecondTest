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
<c:choose>
		<c:when test="${updateFavorite }=false">
			<script>
				alert("관심목록에 추가합니다.");
				location.href="${url}";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("관심목록에서 삭제합니다.");
				location.href="${url}";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>







