<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장르 디테일 리스트</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css" />
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
		font-size: 13px;
	}
</style>
</head>
<body>
<div class="container">

	<c:choose>
		<c:when test="${not empty param.genre }">
			<h2><strong><span style="color: yellow;">${param.genre }</span></strong>에 관한 목록 입니다</h2>
		</c:when>
		<c:otherwise>
			<h2>모든 검색결과 입니다</h2>
		</c:otherwise>
	</c:choose>
		
	<!-- 라디오 정렬기능 : input 요소에서는 if문 작성이 안되네.... 간단한 방법은 없을까? -->
	<div class="container">
			<form action="genredetaillist.do" method="get">
					<input type="hidden" name="genre" value="${genre }" />
					<c:choose>
						<c:when test="${option eq 'releaseDate' }">
							<input type="radio" name="option" id="option" value="releaseDate" checked="checked"> 출시일순
							<input type="radio" name="option" id="option" value="title" > 제목순
						</c:when>
						<c:when test="${option eq 'title' }">
							<input type="radio" name="option" id="option" value="releaseDate"> 출시일순
							<input type="radio" name="option" id="option" value="title" checked="checked"> 제목순
						</c:when>
						<c:otherwise>
							<input type="radio" name="option" id="option" value="releaseDate"> 출시일순
							<input type="radio" name="option" id="option" value="title" > 제목순
							<!-- <input type="radio" name="option" id="option" value="starPoint" > 별점순 --> 
						</c:otherwise>
					</c:choose>
					
				<button class="btn btn-primary" type="submit" style="color: yellow;">검색</button>
			</form>
		</div>

		<table>
		<c:forEach var="tmp" items="${list }">
			<c:if test="${fn:contains(tmp.genre,param.genre)}">
				<tr>
					<td rowspan="4"><img id="${param.genre }_${tmp.num}"
						src="${tmp.imageLink }" style="width: 200px; height: 300px;" /></td>
					<td><span id="title_tx"><span>제목</span></span></td>
					<td><span id="content_tx">${tmp.title }</span></td>
				</tr>
				<tr>
					<td><span id="title_tx">장르</span></td>
					<td><span id="content_tx">${tmp.genre }</span></td>
				</tr>
				<tr>
					<td><span id="title_tx">출시일</span></td>
					<td><span id="content_tx">${tmp.releaseDate }</span></td>
				</tr>
				<tr>
					<td><span id="title_tx">평점</span></td>
					<td><span id="content_tx">${tmp.starPoint }</span></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<jsp:include page="include/paging.jsp">
		<jsp:param value="genredetail" name="page"/>
	</jsp:include>
</div>
</body>
</html>
