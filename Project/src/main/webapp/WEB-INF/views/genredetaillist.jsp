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
		
	<div class="container">
			<form action="genredetaillist.do" method="get">
				<input type="hidden" name="genre" value="${param.genre }" />
				<input type="radio" name="nation" id="nation" value="대한민국" <c:if test="${param.nation eq '대한민국' }">checked="checked"</c:if>> 한국
				<input type="radio" name="nation" id="nation" value="영국" <c:if test="${param.nation eq '영국' }">checked="checked"</c:if>> 영국
				<input type="radio" name="nation" id="nation" value="미국" <c:if test="${param.nation eq '미국' }">checked="checked"</c:if>> 미국
				<input type="radio" name="nation" id="nation" value="중국" <c:if test="${param.nation eq '중국' }">checked="checked"</c:if>>중국
				<input type="radio" name="nation" id="nation" value="일본" <c:if test="${param.nation eq '일본' }">checked="checked"</c:if>> 일본
				<input type="radio" name="nation" id="nation" value="덴마크" <c:if test="${param.nation eq '덴마크' }">checked="checked"</c:if>> 덴마크
				<input type="radio" name="nation" id="nation" value="인도" <c:if test="${param.nation eq '인도' }">checked="checked"</c:if>> 인도
				<input type="radio" name="nation" id="nation" value="싱가포르" <c:if test="${param.nation eq '싱가포르' }">checked="checked"</c:if>> 싱가포르
				<input type="radio" name="nation" id="nation" value="홍콩" <c:if test="${param.nation eq '홍콩' }">checked="checked"</c:if>> 홍콩
				<button class="btn btn-primary" type="submit" style="color: yellow;">검색</button>
			</form>
		</div>

	<table>
		<c:forEach var="tmp" items="${list }">
		<c:if test="${fn:contains(tmp.nation,param.nation)}">
			<tbody style="border-top: 2px solid white ;	border-bottom: 2px solid white ;" >
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
			</tbody>
			</c:if>				
		</c:forEach>
	</table>
	<button class="btn btn-primary" style="width:100%;background-color: yellow;" id="moreBtn">더보기 ▼</button>
</div>
<script>
//댓글 스크롤로 보이기
var idx = 0;
var startCount = 0;
$("#moreBtn").click(function() {
		idx++;
		startCount = idx * 10;
      	$.ajax({
      	url:"more_list.do",
      	method:"get",
      	data:{"startCount":startCount, "genre":"${param.genre}","nation":"${param.nation}","title":""}, //data : 파라미터로 전달할 문자열 
      	dataType:"html",
      	success:function(responseData){
	        $("table").append(responseData);
	        
	     	}     
      	})
      	console.log(idx);
});
</script>
</body>
</html>