<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 랭킹</title>
<style>
.movie_summary .raking_grade {
    padding-top: 1px;
    line-height: 22px;
}
.raking_grade {
    display: inline-block;
    line-height: 22px;
}
.raking_grade .bg_star {
    display: block;
    float: left;
    width: 108px;
    height: 17px;
    background: url(//i1.daumcdn.net/img-contents/movie/2016/pc/bg_star_170614_v2.png) no-repeat 0 0;
}
.raking_grade .bg_star .inner_star {
    overflow: hidden;
    font-size: 0;
    line-height: 0;
    background-position: 0 -20px;
    text-indent: -9999px;
}
.raking_grade .bg_star {
    display: block;
    float: left;
    width: 108px;
    height: 17px;
    background: url(//i1.daumcdn.net/img-contents/movie/2016/pc/bg_star_170614_v2.png) no-repeat 0 0;
}
#h1{
	color: white;
    margin-bottom: 50px;
}
table{
	color: white;
	font-family: fantasy;
}
.container{
	height: 61.781px !important;
}
strong{
    font-size: 15px;
    color: white;
}
#naver{
	color: white;
}
#naver:hover{
    color: darkorange;
}
#search:hover{
    color: chartreuse;
}
/*
 #background{
 	display: none;
 }
*/
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
<jsp:include page="include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body style="background-color: #212529;">
	<jsp:include page="include/navbar.jsp"></jsp:include>
	<div class="container">
		<h1 id="h1">네이버 모든 영화 랭킹 (평점순)</h1>
		<table class="table table-bordered bordertable">
			<colgroup>
		    		<col class="col-xs-1"/>
		    		<col class="col-xs-7"/>
		    		<col class="col-xs-2"/>
		    		<col class="col-xs-2"/>
	    	</colgroup>
			<thead>
				<tr style="background-color: tomato;">
					<th style="text-align: center;"><strong>순위</strong></th>
					<th><strong>영화명</strong></th>
					<th style="text-align: center;"><strong>네이버 링크</strong></th>
					<th style="text-align: center;"><strong>평점</strong></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }"> <%-- request에 담긴 list --%>
					<tr>
						<td style="font-size: 15px; text-align: center;">${tmp.rank }</td>
						<td>
							<a href="searchlist.do?title=${tmp.title }">
								<strong id="search">
									${tmp.title }
								</strong>
							</a>
						</td>
						<td style="text-align: center;">
							<a href="${tmp.link }">
								<strong id="naver" style="font-family: auto;">Click</strong>
							</a>
						</td>							
						<td>
							<span class="raking_grade">
								<span class="bg_star star_grade">
									<span class="bg_star inner_star" style="width:${tmp.starPoint *10 }%">평점</span>
								</span>
								<em class="emph_grade" style="color: white; font-size: 13px;">${tmp.starPoint }</em>
								<span class="txt_grade" style="color: white; font-size: 13px;">/10</span>
							</span>
						</td>
					</tr>				
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 처리 -->
		<div class="page-display" style="text-align: center;">
			<ul class="pagination pagination-sm">
				<c:choose>
					<c:when test="${startPageNum ne 1 }"> <%-- startPageNum != 1 --%>
						<li>
							<a href="movie_Rank.do?pageNum=${requestScope.startPageNum-1 }">&laquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a href="javascript:">&laquo;</a> <%-- : 아무것도 적지 않으면  동작하지 않는 링크가 된다. --%>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }"> 	
					<c:choose>
						<c:when test="${i eq requestScope.pageNum }">
							<li class="active">
								<a href="movie_Rank.do?pageNum=${i }">${i }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="movie_Rank.do?pageNum=${i }">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li>
							<a href="movie_Rank.do?pageNum=${endPageNum+1 }">&raquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a href="javascript:">&raquo;</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
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
</body>
</html>