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
<!-- 왼쪽 슬라이드 바?(sidebar 말고?) -->
<jsp:include page="include/slidebar.jsp"/>
    <div class="container">
    	<!-- 서치바(임시) -->
    	<form action="searchlist.do" method="get">
			<label for="condition" style="display: none;">검색조건</label>
			<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요..." value="${keyword }" />
			<button type="submit" >검색</button>
		</form>
		<a href="genredetaillist.do?genre=드라마">드라마</a>
		<a href="genredetaillist.do?genre=범죄">범죄</a>
		<a href="genredetaillist.do?genre=코메디">코미디</a>
		<a href="updateMovie.do">영화 table 업데이트</a>
    
    	<!-- 추천 TOP10 -->
        <h1 style="color: honeydew;">추천 TOP10</h1>
        <jsp:include page="include/bestlist.jsp"/>
        
       
    </div>
</body>
</html>