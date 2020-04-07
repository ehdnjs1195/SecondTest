<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPOILER</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
.slide_right{
		text-decoration: none;
		position: fixed;
		top: 100px;
		left: 90%;
		width: 130px;
		height: 100%;
		z-index:10;
}
.slide_right img{
	margin: 5px;
}
	
.row{
  		margin-top: 100px;
}
.btn{
	font-size: smaller !important;
}
.btn-primary:hover {
   	color: #00ffd0 !important;
}
   
@media (min-width: 992px)
.container {
    width: 970px;
}
.clearfix, .clearfix:before, .clearfix:after, .container:before, .container:after, .container-fluid:before, .container-fluid:after, .row:before, .row:after {
    content: " ";
    display: table;
}
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
body #kn-footer .container .kn-info-wrapper .sns-items .sns-item:last-of-type {
    margin-right: 0;
}
body #kn-footer .container .kn-info-wrapper .kn-info .footer-menu-items .footer-menu-item a {
    text-decoration: none;
    font-size: 14px;
    font-weight: normal;
    color: #b3bfdd;
}
.footer-menu-items{
	padding-left: 0px;
	font-family: auto;
}
.items img {
    height: 263.469px !important;
}
</style>
</head>
<body>
<!-- 공지사항 팝업 띄우기 -->
	<script>
		var getCookie = function(name) {
	        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	        return value? value[2] : null;
	    };
		if(getCookie("Popup") != null){
			if(getCookie("isPopup")=="no"){
				
			}else{		
				window.open("notify.do?Popup="+getCookie("Popup"),"news","width=710px,height=530px,top=100px,left=100px");
			}			
		}
	</script>

	<div class="slide_right">
		<img src="${pageContext.request.contextPath }/resources/images/제목 없음.png" alt="" style="width: 130px; height: auto;">
		<img onclick="window.open('map.do','Movie Theater','width=700px,height=450px,top=200px,left=200px')" src="${pageContext.request.contextPath }/resources/images/mapimg.png" alt="" style="width: 130px; height: auto; display: block;" >
	</div>
<jsp:include page="include/navbar.jsp"></jsp:include>
    <div class="container">
    	<div>
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
    	
    	<!-- 추천 TOP10 -->
        <h1 style="color: honeydew;">추천 TOP10</h1>
        <jsp:include page="include/bestlist.jsp"/>
    </div>
    <!-- footer -->
    <footer id="kn-footer" style="font-family: auto;">
    <div class="container">
      <div class="kn-info-wrapper">
        <div class="kinolights-ci"></div>
        <div class="kn-info">
            <ul class="footer-menu-items">
            	<li class="footer-menu-item">
            		<a href="#" target="_blank">이용약관</a>
           		</li>
           		<li class="footer-menu-item">
           			<a href="#" target="_blank">개인정보취급방침</a>
         		</li>
         		<li class="footer-menu-item">
         			<a href="#">사용 설명서</a>
        		</li>
        		<li class="footer-menu-item">
        			<a href="#" class="btn-kn-report-db">이용문의 및 DB제보</a>
        		</li>
       		</ul>
        </div>
        <div class="kn-copyright">
          <p><strong style="color:#b3bfdd;">업무 제휴 문의 : <a href="mailto:znql16@gmail.com" style="color:#b3bfdd;">znql16@gmail.com</a></strong></p>
          <br>
          Copyright © 스포일러 Spoiler  ALL RIGHTS RESERVED.
        </div>
        <ul class="sns-items">
          <li class="sns-item">
            <a href="https://post.naver.com/my.nhn?memberNo=43999716" target="_blank" rel="noopener" aria-label="네이버 포스트" title="네이버 포스트">
              <i class="icon-post"></i>
            </a>
          </li>
          <li class="sns-item">
            <a href="https://www.facebook.com/KINOLIGHTS/" target="_blank" rel="noopener" aria-label="페이스북" title="페이스북">
              <i class="icon-facebook"></i>
            </a>
          </li>
          <li class="sns-item">
            <a href="https://www.instagram.com/kinolights/" target="_blank" rel="noopener" aria-label="인스타그램" title="인스타그램">
              <i class="icon-instagram"></i>
            </a>
          </li>
       	 </ul>
      </div>
    </div>
  </footer>
    <script>
    $( window ).resize(function() {
		 var windowWidth = $( window ).width();
		 if(windowWidth > 1600) {
			 $(".slide_right").show(300);
		 } else {
			 $(".slide_right").hide(300);
		 }
	});
    </script>
</body>
</html>