<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPOILER</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css" />
</head>
<body>
    <div class="container">
        <h1 style="color: honeydew;">MOVIE 차트</h1>
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
            <!-- Carousel 하단의 동그란 nav 요소  -->
            <ol class="carousel-indicators">
                <!-- data-target="Carousel 전체의 선택자" data-slide-to="컨텐츠 인덱스" -->
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
            </ol>

            <jsp:include page="include/movielist.jsp"/>

            <!-- 이전, 다음 control UI -->
            <a href="#myCarousel" class="left carousel-control" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">이전</span>
            </a>
            <a href="#myCarousel" class="right carousel-control" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">다음</span>
            </a>
        </div>
    </div>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>