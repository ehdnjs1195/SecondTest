<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Carousel -->
<div id="myCarousel_${param.genre }" class="carousel slide" data-ride="carousel"
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
					<c:if test="${fn:contains(tmp.genre,param.genre)}">
						<div class="items">
							<img id="${param.genre }_${tmp.movieSeq}" src="${tmp.posters }" />
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
	<!-- 이전, 다음 control UI -->
	<a href="#myCarousel_${param.genre }" class="left carousel-control"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
		<span class="sr-only">이전</span>
	</a> <a href="#myCarousel_${param.genre }" class="right carousel-control"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span>
		<span class="sr-only">다음</span>
	</a>
</div>

<!-- Modal -->
<c:forEach var="tmp" items="${list }">
	<c:if test="${fn:contains(tmp.genre, param.genre)}">
		<div class="modal fade" id="myModal${tmp.movieSeq }">
			<!-- modal-lg  | default | modal-sm -->
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<img src="${tmp.posters }" id="${tmp.movieSeq }">
						<div class="imgBox">
							<h2>${tmp.title }</h2>
							<dl class="movie_info">
								<dt>개봉</dt>
								<dd>${tmp.repRlsDate }</dd>
								<dt>장르</dt>
								<dd class="movie_genre">
									<p>${tmp.genre }</p>
								</dd>
								<dt>감독</dt>
								<dd class="movie_director">
									<p>${tmp.director }</p>
								</dd>
								<dt>출연</dt>
								<dd class="movie_actor">
									<p>${tmp.actor }</p>
								</dd>
							</dl>
							<h3>줄거리</h3>
							<h4>${tmp.plot }</h4>
						</div>
					</div>
					<%-- <div class="modal-footer">
						<iframe width="968" height="725" src="${tmp.videoLink }"
							frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div> --%>
				</div>
			</div>
		</div>
		<script>
			$("#${param.genre }_${tmp.movieSeq}").click(function() {
				$("#myModal${tmp.movieSeq}").modal("show");
			});
		</script>
	</c:if>
</c:forEach>
