<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPOILER</title>
<jsp:include page="include/resource.jsp"></jsp:include>

</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
    <div class="container">
    	<!-- 추천 TOP8 -->
        <h1 style="color: honeydew;">추천 TOP8</h1>
        <jsp:include page="include/bestlist.jsp"/>
        
        <!-- 장르: 드라마 -->
        <h1 style="color: honeydew;">드라마 영화</h1>
		<jsp:include page="include/genrelist.jsp">
			<jsp:param value="드라마" name="genre"/>
		</jsp:include>	
		
		<!-- 장르: 범죄 -->
		<h1 style="color: honeydew;">범죄 영화</h1>
		<jsp:include page="include/genrelist.jsp">
			<jsp:param value="범죄" name="genre"/>
		</jsp:include>
		
		<!-- 장르: 코미디 -->
		<h1 style="color: honeydew;">코미디 영화</h1>
		<jsp:include page="include/genrelist.jsp">
			<jsp:param value="코미디" name="genre"/>
		</jsp:include>
    </div>
</body>
</html>