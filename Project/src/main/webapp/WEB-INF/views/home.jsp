<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<!-- 공지사항 팝업 띄우기 -->
	<script>
		var getCookie = function(name) {
	        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	        return value? value[2] : null;
	    };
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
						window.open("notify.do?Popup="+getCookie(cookieName),"news"+cookieName,"width=710px,height=530px, top="+position+"px,left="+position+"px");						
					}
				}			
		    }	    	
	    }
		

	</script>

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