<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
   	data:{"startCount":startCount,"genre":"", "title":"${param.title}"}, //data : 파라미터로 전달할 문자열 
   	dataType:"html",
   	success:function(responseData){
       $("table").append(responseData);
       
    	}     
   	})
});
</script>
</body>
</html>