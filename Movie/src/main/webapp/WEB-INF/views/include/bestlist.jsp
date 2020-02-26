<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="myCarousel_top8" class="carousel slide" data-ride="carousel"
	data-interval="5000">
	<!-- Carousel 하단의 동그란 nav 요소  -->
	<ol class="carousel-indicators">
		<!-- data-target="Carousel 전체의 선택자" 
         data-slide-to="컨텐츠 인덱스" -->
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
	</ol>

	<div class="carousel-inner">
		<c:forEach var="i" begin="1" end="2" step="1">
			<div class="item <c:if test="${i eq 1}">active</c:if>">
				<c:forEach var="tmp" items="${list }">
					<div class="items">
						<img id="showImg1" src="images/${tmp.fileName }.jpg" />
					</div>
				</c:forEach>
			</div>
		</c:forEach>
	</div>

	<!-- 이전, 다음 control UI -->
	<a href="#myCarousel_top8" class="left carousel-control"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
		<span class="sr-only">이전</span>
	</a> <a href="#myCarousel_top8" class="right carousel-control"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span>
		<span class="sr-only">다음</span>
	</a>
</div>


