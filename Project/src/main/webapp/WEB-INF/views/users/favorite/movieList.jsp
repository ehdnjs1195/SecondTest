<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
.neon {
	font-family: fantasy, sans-serif;
}

.input-group .form-control-feedback {
	z-index: 3;
}

/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
.help-block, .form-control-feedback {
	display: none;
}

.scroll-wrapper:hover {
	background-color: #FEF9E7;
}

h1 {
	margin-top: 50px; 
	font-family : 'Droid Sans', sans-serif;
	font-size: 35px;
	color: white;
    font-weight: bolder;
    line-height: 128px;
    letter-spacing: 3px;
}

.h4 {
	background-color: lightgrey;
	width: 460px;
	padding: 0px;
	margin: 0px;
	
}

#backgroundImage {
	z-index: 1;
}

#backgroundImage:before {
	content: "";
	position: fixed;
	z-index: -1;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.8)),
		url(${pageContext.request.contextPath }/resources/images/bg.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: auto;
	filter: grayscale(80%);
	height: auto;
	width: auto;
	opacity: 0.3;
}

a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	color: #6ABCEA;
}

.card-movie-content {
	padding: 18px 18px 24px 18px;
	margin: 0;
}

.card-view:hover {
	-webkit-transform: scale(1.03);
	transform: scale(1.03);
	box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.08);
}

.card-view {
	max-resolution: res;
	-left: 00px;
	text-align: center;
	background: #F7F9F9;
	box-shadow: 0px 6px 18px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 200px;
	margin: 2em;
	border-radius: 10px;
	display: inline-block;
}

.card-header {
	padding: 0;
	margin: 0;
	height: 335px;
	width: 100%;
	display: block;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.header-icon {
	width: 100%;
	height: 367px;
	line-height: 367px;
	text-align: center;
	vertical-align: middle;
	margin: 0 auto;
	color: #ffffff;
	font-size: 54px;
	text-shadow: 0px 0px 20px #6abcea, 0px 5px 20px #6ABCEA;
	opacity: .85;
}

.header-icon:hover {
	background: rgba(0, 0, 0, 0.15);
	font-size: 74px;
	text-shadow: 0px 0px 20px #6abcea, 0px 5px 30px #6ABCEA;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	opacity: 1;
}

.card-view:hover {
	-webkit-transform: scale(1.03);
	transform: scale(1.03);
	box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.08);
}

.card-movie-content {
	padding: 18px 18px 24px 18px;
	margin: 0;
}

.card-movie-title {
	font-size: 22px;
	margin: 0;
	display: table-cell;
}

.ratings {
	background-size: contain;
	margin-top: 5px;
	margin-bottom: 5px;
	font-weight: 600;
}

.ratings span {
	color: #2196F3;
}

.posters {
	background-size: cover;
}

body {
	height: 100%;
	width: 100%;
	font-family: 'Poppins', sans-serif;
	font-weight: 400;
	font-size: 14px;
}

* {
	-webkit-transition: 300ms;
	transition: 300ms;
}



.row {
	margin-top: 11rem;
	text-align: left;
	 --borderWidth: 3px;
  background: #1D1F20;
  position: relative;
  border-radius: var(--borderWidth);
}


.row:after {
  position: absolute;
  top: calc(-1 * var(--borderWidth));
  left: calc(-1 * var(--borderWidth));
  height: calc(100% + var(--borderWidth) * 2);
  width: calc(100% + var(--borderWidth) * 2);
  background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82);
  border-radius: calc(2 * var(--borderWidth));
  z-index: -1;
  animation: animatedgradient 3s ease alternate infinite;
  background-size: 300% 300%;
}


@keyframes animatedgradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

#empty_list {
font-size:30px;
color: white;
text-align: center;
padding: 55px;
}





.title{
	text-align:center;
}
.movie_container {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	max-width: 60%;
	margin-left: auto;
	margin-top: -130px;
	margin-right: auto;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
}

// 버튼 css

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

#wrapper {
	width: 100%;
	margin: 0;
	padding: 0;
}

#delete_btn {
	margin: 0 auto;
	font-size: 16px;
	display: block;
	background-color: #009ac9;
	border: 1px solid transparent;
	color: #ffffff;
	font-weight: 300;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	margin-bottom: 4px;
	margin-top: 0px;
}

#delete_btn:hover {
	background-color: #ffffff;
	color: #009ac9;
	border-color: #009ac9;
}
#background{
	display: none;
}
</style>

<script src="../../resources/js/jquery-3.3.1.js"></script>
<script src="../../resources/js/bootstrap.js"></script>
</head>
<body>
	<div id="backgroundImage"></div>
		<div class="title">
			<h1>관심목록 영화 리스트</h1>
		</div>
	<div class="movie_container">
		<div class="row">
			
				<p id="empty_list" hidden="true">관심영화를 모두 삭제하였습니다.</p>
			<c:forEach var="tmp" items="${list }">
		
			
			
				<div class="card-view">
				
					<div class="card-header">
						<a
							href="../../detail.do?movieSeq=${tmp.movieSeq }&movieId=${tmp.movieId}">
							<img style="width: 200px; height: 300px;" class="posters"
							id="${tmp.genre }_${tmp.movieSeq}" src="${tmp.posters }" />
						</a>
						<h4 style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; font-size: 16px; color: #2980B9; font-weight: 400">${tmp.title }</h4>
					</div>
					<div class="ratings">
						<span>
							<c:choose>
								<c:when test="${tmp.starPoint != 0}">${tmp.starPoint}</c:when>
								<c:otherwise>${tmp.randomStarPoint}</c:otherwise>
							</c:choose>
						</span>/10
					</div>
					<div class="genre" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
						<span>장르 : ${tmp.genre }</span>
					</div>
					<br>
					<div class="repRlsDate">
						<span> <c:choose>
								<c:when test="${tmp.repRlsDate eq null}">
								개봉일 미정
							</c:when>
								<c:otherwise>
								개봉일 : ${tmp.repRlsDate }
							</c:otherwise>
							</c:choose>
						</span>
					</div>
				
					<br>
					<form id="delete-form" action="${pageContext.request.contextPath }/users/favorite/delete.do" method="post">
						<button id="delete_btn" type="submit">제거</button>
						<input type="hidden" name="movieSeq" value="${tmp.movieSeq }" />
					</form>
					
				</div>
					
			</c:forEach>
				</div>
	</div>
	
	<script>
	$(function(){
		
		if($('#delete-form').text() == ''){
			document.getElementById( 'empty_list' ).removeAttribute("hidden");
		}
		
		
	});
</script>
</body>
</html>






