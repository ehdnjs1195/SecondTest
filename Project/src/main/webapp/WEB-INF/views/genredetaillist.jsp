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
.btn-primary:hover {
   	color: #00ffd0;
   }
   .btn{
	font-size: smaller !important;
}
/* footer */
body #kn-footer .container .kn-info-wrapper {
	position: relative;
	padding: 50px 0;
	margin: 0 auto;
	text-align: center;
}

body #kn-footer .container .kn-info-wrapper .kinolights-ci {
	position: absolute;
	left: 0;
	top: 40px;
	width: 91px;
	height: 53px;
	text-align: center;
}

body #kn-footer .container .kn-info-wrapper .kn-copyright {
	margin-top: 15px;
	font-size: 12px;
	font-weight: normal;
	color: #546cb2;
}

body #kn-footer .container .kn-info-wrapper .sns-items {
	position: absolute;
	right: 0;
	top: 55px;
	display: inline-block;
	vertical-align: middle;
}

ol, ul {
	list-style: none;
}

body #kn-footer .container .kn-info-wrapper .sns-items .sns-item {
	float: left;
	margin-right: 15px;
	margin-bottom: 12px;
	line-height: 24px;
}

body #kn-footer .container .kn-info-wrapper .sns-items .sns-item:last-of-type
	{
	margin-right: 0;
}

body #kn-footer .container .kn-info-wrapper .kn-info .footer-menu-items .footer-menu-item a
	{
	text-decoration: none;
	font-size: 14px;
	font-weight: normal;
	color: #b3bfdd;
}

.footer-menu-items {
	padding-left: 0px;
	font-family: auto;
}	
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<jsp:include page="include/slidebar.jsp"/>
<div class="container">
	<div>
		<a class="btn btn-primary" href="${pageContext.request.contextPath }/home.do">돌아가기</a>
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
		<a class="btn btn-primary" href="movie_Rank.do">영화 랭킹 보러가기</a>
	</div>
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
					<td class="col-xs-1" style="padding:10px"><span id="title_tx"><span>제목</span></span></td>
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
	<!-- footer -->
	<footer id="kn-footer" style="font-family: auto;">
		<div class="container">
			<div class="kn-info-wrapper">
				<div class="kinolights-ci"></div>
				<div class="kn-info">
					<ul class="footer-menu-items">
						<li class="footer-menu-item"><a href="#" target="_blank">이용약관</a>
						</li>
						<li class="footer-menu-item"><a href="#" target="_blank">개인정보취급방침</a>
						</li>
						<li class="footer-menu-item"><a href="#">사용 설명서</a></li>
						<li class="footer-menu-item"><a href="#"
							class="btn-kn-report-db">이용문의 및 DB제보</a></li>
					</ul>
				</div>
				<div class="kn-copyright">
					<p>
						<strong style="color: #b3bfdd;">업무 제휴 문의 : <a
							href="mailto:znql16@gmail.com" style="color: #b3bfdd;">znql16@gmail.com</a></strong>
					</p>
					<br> Copyright © 스포일러 Spoiler ALL RIGHTS RESERVED.
				</div>
				<ul class="sns-items">
					<li class="sns-item"><a
						href="https://post.naver.com/my.nhn?memberNo=43999716"
						target="_blank" rel="noopener" aria-label="네이버 포스트"
						title="네이버 포스트"> <i class="icon-post"></i>
					</a></li>
					<li class="sns-item"><a
						href="https://www.facebook.com/KINOLIGHTS/" target="_blank"
						rel="noopener" aria-label="페이스북" title="페이스북"> <i
							class="icon-facebook"></i>
					</a></li>
					<li class="sns-item"><a
						href="https://www.instagram.com/kinolights/" target="_blank"
						rel="noopener" aria-label="인스타그램" title="인스타그램"> <i
							class="icon-instagram"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</footer>
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