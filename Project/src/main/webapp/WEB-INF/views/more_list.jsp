<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>

<c:if test="${not empty param.genre }">
	<c:forEach var="tmp" items="${list }">
		<tr>
			<td class="col-xs-2" rowspan="4"><a href="detail.do?movieSeq=${tmp.movieSeq }&movieId=${tmp.movieId}"><img id="${param.genre }_${tmp.movieSeq}"
				src="${tmp.posters }" style="width: 200px; height: 300px;" /></a></td>
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
	</c:forEach>
</c:if>
<c:if test="${not empty param.title }">
	<c:forEach var="tmp" items="${list }">
		<tr>
			<td class="col-xs-2" rowspan="4"><a href="detail.do?movieSeq=${tmp.movieSeq }&movieId=${tmp.movieId}"><img id="${param.genre }_${tmp.movieSeq}"
				src="${tmp.posters }" style="width: 200px; height: 300px;" /></a></td>
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
	</c:forEach>
</c:if>
