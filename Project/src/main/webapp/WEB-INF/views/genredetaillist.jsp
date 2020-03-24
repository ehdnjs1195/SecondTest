<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장르 디테일 리스트</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	div{
		color: white;
	}
	
	table tr td{
	padding: 10px;
	}
	#title_tx{
		width:25px;
		font-size: 20px;
	}
	#content_tx{
		font-size: 20px;
	}
	table {
		width: 100%;
	}
</style>

</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<div class="container">
<jsp:include page="include/slidebar.jsp"/>
	<c:if test="${not empty param.genre }">
		<style> ul.depth02{display: list-item; margin-left: -40px;}</style>
	</c:if>
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
					<input type="hidden" name="genre" value="${param.genre }" />
					<input type="radio" name="orderby" id="orderby" value="releaseDate" <c:if test="${orderby eq 'releaseDate' }">checked="checked"</c:if>> 출시일순
					<input type="radio" name="orderby" id="orderby" value="title" <c:if test="${orderby eq 'title' }">checked="checked"</c:if>> 제목순
					<input type="radio" name="orderby" id="orderby" value="starPoint" <c:if test="${orderby eq 'starPoint' }">checked="checked"</c:if>> 별점순
				<button class="btn btn-primary" type="submit" style="color: yellow;">검색</button>
			</form>
		</div>

		<table>
		<c:forEach var="tmp" items="${list }">
			<c:if test="${fn:contains(tmp.genre,param.genre)}">
				<tr>
					<td class="col-xs-2" rowspan="4"><img id="${param.genre }_${tmp.movieSeq}"
						src="${tmp.posters }" style="width: 200px; height: 300px;" /></td>
					<td class="col-xs-1"><span id="title_tx"><span>제목</span></span></td>
					<td class="col-xs-9"><span id="content_tx">${tmp.title }</span></td>
				</tr>
				<tr>
					<td><span id="title_tx">장르</span></td>
					<td><span id="content_tx">${tmp.genre } 
							<c:if test="${tmp.runtime ne ''}"> | ${tmp.runtime}분</c:if> 
							<c:if test="${tmp.repRlsDate ne ''}"> |${tmp.repRlsDate } 개봉</c:if>
						</span></td>
				</tr>
				<tr>
					<td><span id="title_tx">감독</span></td>
					<td><span id="content_tx">${tmp.director }</span></td>
				</tr>
				<tr>
					<td><span id="title_tx">배우</span></td>
					<td><span id="content_tx">${tmp.actor }</span></td>
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
