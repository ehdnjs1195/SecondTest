<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPOILER</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
body {
font-family: 'Nanum Gothic';
}
.slide_right {
	text-decoration: none;
	position: fixed;
	top: 100px;
	left: 90%;
	width: 130px;
	height: 100%;
	z-index: 10;
}

.slide_right img {
	margin: 5px;
}

.row {
	margin-top: 100px;
}

.btn {
	font-size: smaller !important;
}

.btn-primary:hover {
	color: #00ffd0 !important;
}

.clearfix, .clearfix:before, .clearfix:after, .container:before,
	.container:after, .container-fluid:before, .container-fluid:after, .row:before,
	.row:after {
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

.items img {
	height: 263.469px !important;
}
/* Media Queries by. 유석 */
@media screen and (min-width: 389px) and (max-width: 767px) {
	#genre {
		margin-top: 30px;
	}
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
	    
	    //팝업상태 확인하고 있으면 쿠키 생성하기
		$(document).load("checkPopup.do");
	    //팝업 있는지 확인한 후 띄우기
	    var cookies = document.cookie.split(';');
	    if(cookies[0]!=""){
		    for(var i = 0 ; i < cookies.length; i++){
			    var cookie = cookies[i].split('=');
			    var cookieName = cookie[0].trim();
			    var num = cookieName.substring(5);
				var position = 100 + i*30 ;
			    if(getCookie("isPopup"+num)==num){
					
				}else{	
					if(cookieName.indexOf('P') == 0){
						window.open("notify.do?Popup="+getCookie(cookieName),"news"+cookieName,"width=710px,height=800px, top="+position+"px,left="+position+"px");						
					}
				}			
		    }	    	
	    }
	</script>
	<c:if test="">
		<script>
		
		</script>
	</c:if>

	<div class="slide_right">
		<%-- <img src="${pageContext.request.contextPath }/resources/images/제목없음.png" alt="" style="width: 130px; height: auto;"> --%>
		<img onclick="window.open('map.do','Movie Theater','width=700px,height=450px,top=200px,left=200px')" src="${pageContext.request.contextPath }/resources/images/kmap.png" alt="" style="width: 130px; height: auto; display: block; cursor:pointer;" >
	</div>
	
<jsp:include page="include/navbar.jsp"></jsp:include>
    <div class="container">
    	<div id="genre">
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
    	
    	<!-- TOP10 -->
        <h1 style="color: honeydew;">TOP 10</h1>
        <jsp:include page="include/bestlist.jsp"/>
    </div>
   <jsp:include page="include/footer.jsp"></jsp:include>
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