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
	
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<div class="container">
<jsp:include page="include/slidebar.jsp"/>
	<c:if test="${not empty param.title }">
		<h2>검색어 <strong><span style="color: yellow;">${param.title }</span></strong>에 관한 검색결과 입니다</h2>
	</c:if>

	<table>
		<c:forEach var="tmp" items="${list }">
			<c:if test="${fn:contains(tmp.genre,param.genre)}">
				<tbody>
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
				</tbody>				
			</c:if>
		</c:forEach>
	</table>
	<jsp:include page="include/paging.jsp">
		<jsp:param value="search" name="page"/>
	</jsp:include>
</div>
</body>
</html>