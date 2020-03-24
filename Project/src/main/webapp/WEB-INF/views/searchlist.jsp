<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서치리스트</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css" />
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
<div class="container">
<jsp:include page="include/slidebar.jsp"/>
	<c:choose>
		<c:when test="${not empty param.keyword }">
			<h2>검색어 <strong><span style="color: yellow;">${param.keyword }</span></strong>에 관한 검색결과 입니다</h2>
		</c:when>
		<c:otherwise>
			<h2>모든 검색결과 입니다</h2>
		</c:otherwise>
	</c:choose>
	
	<!-- 라디오 정렬기능 : input 요소에서는 if문 작성이 안되네.... 간단한 방법은 없을까? -->
	<div class="container">
			<form action="searchlist.do" method="get">
				<input type="hidden" name="keyword" value="${keyword }" />
				<input type="radio" name="orderby" id="orderby" value="releaseDate" <c:if test="${orderby eq 'releaseDate' }">checked="checked"</c:if>> 출시일순
				<input type="radio" name="orderby" id="orderby" value="title" <c:if test="${orderby eq 'title' }">checked="checked"</c:if>> 제목순
				<input type="radio" name="orderby" id="orderby" value="starPoint" <c:if test="${orderby eq 'starPoint' }">checked="checked"</c:if>> 별점순
				<button class="btn btn-primary" type="submit" style="color: yellow;">검색</button>
			</form>
		</div>
	
	<!-- table 안에 글자 키우는 방법은.....? span으로 묶어서 css????? 다른방법은 없는 것인가.... -->
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
							<c:if test="${tmp.repRlsDate ne ''}"> |<fmt:parseDate value="${tmp.repRlsDate}" var="strDate" pattern="yyyyMMdd"/>
																	<fmt:formatDate value="${strDate}" pattern="yyyy년 MM월 dd일"/> 개봉</c:if>
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
		<jsp:param value="search" name="page"/>
	</jsp:include>
</div>
</body>
</html>