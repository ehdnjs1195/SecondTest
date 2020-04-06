<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<ul>
	<li><a href="member.do">회원목록</a></li>
	<li><a href="popup-list.do">공지사항 팝업</a></li>
	<li><a href="../updateMovie.do">영화 table 업데이트</a></li>
</ul>
</body>
</html>