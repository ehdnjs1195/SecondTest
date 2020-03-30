<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
	//쿠키 읽어오기
	Cookie[] cookies=request.getCookies();
	//팝업을 띄울수 있는지 여부 
	boolean canPopup=true;
	if(cookies != null){
		//반복문 돌면서 모든 쿠키를 참조해서 
		for(Cookie tmp:cookies){
			// "isPopup" 이라는 쿠키 이름으로 저장된 값이 있으면
			if(tmp.getName().equals("isPopup")){
				//팝업을 띄우지 않도록 표시한다.
				canPopup=false;
			}
		}
	}
%>
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
</style>
</head>
<body>
<!-- 공지사항 팝업 띄우기 -->
<%if(canPopup){ %>
	<script>
		window.open("notify.do","sale","width=700px,height=450px,top=100px,left=100px");
	</script>
<%} %>

	<div class="slide_right">
		<img src="${pageContext.request.contextPath }/resources/images/제목 없음.png" alt="" style="width: 130px; height: auto;">
		<img onclick="window.open('map.do','Movie Theater','width=700px,height=450px,top=200px,left=200px')" src="${pageContext.request.contextPath }/resources/images/mapimg.png" alt="" style="width: 130px; height: auto; display: block;" >
	</div>
<jsp:include page="include/navbar.jsp"></jsp:include>


    <div class="container">
    	<!-- 서치바(임시) -->
    	<form action="searchlist.do" method="get">
			<label for="condition" style="display: none;">검색조건</label>
			<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요..." value="${keyword }" />
			<button type="submit" >검색</button>
		</form>
		<a href="genredetaillist.do?genre=드라마">드라마</a>
		<a href="genredetaillist.do?genre=범죄">범죄</a>
		<a href="genredetaillist.do?genre=코메디">코미디</a>
		<a href="updateMovie.do">영화 table 업데이트</a>
    
    	<!-- 추천 TOP10 -->
        <h1 style="color: honeydew;">추천 TOP10</h1>
        <jsp:include page="include/bestlist.jsp"/>
    </div>
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