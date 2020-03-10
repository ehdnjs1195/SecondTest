<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPOILER</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css" />
</head>
<body>

	<!-- 검색 창 -->
	<div class="container">
		<form action="searchlist.do" method="get">
			<label for="condition" style="display: none;">검색조건</label>
			<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요..." value="${keyword }" />
			<button type="submit" >검색</button>
		</form>
	</div>
	<!-- 장르별 리스트 -->
	<div class="container">
		<a href="genredetaillist.do?genre=드라마">드라마</a>
		<a href="genredetaillist.do?genre=범죄">범죄</a>
		<a href="genredetaillist.do?genre=코미디">코미디</a>
	</div>

    <div class="container">
    	<!-- 추천 TOP8 -->
        <h1 style="color: honeydew;">추천 TOP8</h1>s
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