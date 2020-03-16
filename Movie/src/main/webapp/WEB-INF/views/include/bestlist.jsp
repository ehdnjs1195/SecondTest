<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Carousel -->
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
						<img id="best_${tmp.num}" src="${tmp.imageLink }" />
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

<!-- Modal -->
<c:forEach var="tmp" items="${list }">
	<div class="modal fade" id="myModal${tmp.num }">
		<!-- modal-lg  | default | modal-sm -->
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="display: flex;">
					<img src="${tmp.imageLink }" id="${tmp.num }">
					<div class="imgBox">
						<h2>${tmp.title }</h2>
						<dl class="movie_info">
							<dt>개봉</dt>
							<dd>${tmp.releaseDate }</dd>
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
						<h4>${tmp.content }</h4>
						<div>
							<a href="detail.do?num=${tmp.num }" type="button" class="btn btn-info">자세히 보러가기</a>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<iframe src="${tmp.videoLink }"
						frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<div id="disqus_thread"></div>
					<script>
						/**
						 *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
						 *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
						/*
						 var disqus_config = function () {
						 this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
						 this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
						 };
						 */
						(function() { // DON'T EDIT BELOW THIS LINE
							var d = document, s = d.createElement('script');
							s.src = 'https://com-spoiler.disqus.com/embed.js';
							s.setAttribute('data-timestamp', +new Date());
							(d.head || d.body).appendChild(s);
						})();
					</script>
					<noscript>
						Please enable JavaScript to view the <a
							href="https://disqus.com/?ref_noscript">comments powered by
							Disqus.</a>
					</noscript>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script>
		$("#best_${tmp.num}").click(function() {
			$("#myModal${tmp.num}").modal("show");
		});
	</script>
</c:forEach>