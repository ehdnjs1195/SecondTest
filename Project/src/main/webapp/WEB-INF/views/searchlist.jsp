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
	.btn-primary:hover {
    	color: #00ffd0;
    }
    .btn{
		font-size: smaller !important;
	}
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<div class="container">
<%-- <jsp:include page="include/slidebar.jsp"/> --%>
	<div>
		<a class="btn" href="${pageContext.request.contextPath }/home.do">홈으로 돌아가기</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=액션">액션</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=SF">SF</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=판타지">판타지</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=어드벤처">어드벤처</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=드라마">드라마</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=코메디">코미디</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=스릴러">스릴러</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=호러">호러</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=뮤지컬">뮤지컬</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=범죄">범죄</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=공포">공포</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=미스터리">미스터리</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=멜로드라마">멜로드라마</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=멜로">멜로</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=로맨스">로맨스</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=전쟁">전쟁</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=전기">전기</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=사극">사극</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=시대극">시대극</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=갱스터">갱스터</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=모험">모험</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=애니메이션">애니메이션</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=가족">가족</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=느와르">느와르</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=역사">역사</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=스포츠">스포츠</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=서부">서부</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=지역">지역</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=문화">문화</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=사회">사회</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=인물">인물</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=자연ㆍ환경">자연ㆍ환경</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=인권">인권</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=계몽">계몽</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=교육">교육</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=예술">예술</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=실험">실험</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=재난">재난</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=종교">종교</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=옴니버스">옴니버스</a>
		<a class="btn btn-primary" href="genredetaillist.do?genre=에로">에로</a>
	</div>
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