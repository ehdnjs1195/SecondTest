<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서치리스트</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	div{
		color: white;
	}
	table tr td{
	padding: 20px;
	}
	#title_tx{
		font-size: 25px;
	}
	#content_tx{
		font-size: 35px;
	}
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<div class="container">
<jsp:include page="include/slidebar.jsp"/>
	<c:if test="${not empty param.title }">
		<h2>검색어 <strong><span style="color: yellow;">${param.title }</span></strong>에 관한 검색결과 입니다</h2>
	</c:if>

	<!-- table 안에 글자 키우는 방법은.....? span으로 묶어서 css????? 다른방법은 없는 것인가.... -->
	<table>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td rowspan="4"><a href="detail.do?movieSeq=${tmp.movieSeq }"><img id="${param.genre }_${tmp.movieSeq}"
					src="${tmp.posters }" style="width: 200px; height: 300px;" /></a></td>
				<td><span id="title_tx"><span>제목</span></span></td>
				<td><span id="content_tx">${tmp.title }</span></td>
			</tr>
			<tr>
				<td><span id="title_tx">장르</span></td>
				<td><span id="content_tx">${tmp.genre }</span></td>
			</tr>
			<tr>
				<td><span id="title_tx">출시일</span></td>
				<td><span id="content_tx">${tmp.repRlsDate }</span></td>
			</tr>
			<tr>
				<td><span id="title_tx">평점</span></td>
				<td><span id="content_tx">${tmp.starPoint }</span></td>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="include/paging.jsp">
		<jsp:param value="search" name="page"/>
	</jsp:include>
</div>
</body>
</html>