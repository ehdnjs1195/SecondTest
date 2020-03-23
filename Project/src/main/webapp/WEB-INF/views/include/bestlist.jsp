<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.items{
cursor: pointer;
    position:relative;
   transition:all .2s ease-out 0s
   }
.items .box-content, 
.items:after{position:absolute;left:20px;right:20px}
.items:after{content:"";display:block;background:#2d3436;
top:20px;bottom:20px;opacity:0;transform:rotate3d(-1,1,0,100deg);transition:all .4s ease-in-out 0s}
.items:hover:after{opacity:.9;transform:rotate3d(0,0,0,0deg)}
.items .box-content{top:45%;opacity:0;z-index:1;-webkit-transform:translate(10%,-30%);transform:translate(10%,-30%);transition:all .2s ease-out 0s}
.items:hover .box-content{opacity:1;transform:translate(0,-50%);transition-delay:.2s}
.items .title{display:block;font-size:22px;font-weight:700;color:#FFC300;margin:0 0 10px}
.items .post{display:block;font-size:15px;color:#f7f7b9;margin-bottom:20px}
@media only screen and (max-width:990px){.box13{margin-bottom:30px}
</style>

<div>
	<c:forEach var="tmp" items="${list }">
		<c:if test="${tmp.rank le 10 }">
			<div class="items" id="best_${tmp.movieSeq}" >
				<img id="best_${tmp.movieSeq}" src="${tmp.posters }" />
	               <div class="box-content" style="text-align:center">
	                <h3 class="title">${tmp.title}</h3>
	                <p class="post">개봉일 : ${tmp.repRlsDate }</p>
	                <p class="post">${tmp.genre }</p>
	                <hr width="170px">
	                  	<a style="color:white">자세히보기</a>
	             	</div>
	       	</div>
		</c:if>
	</c:forEach>
</div>

<!-- Modal -->
<c:forEach var="tmp" items="${list }">
	<div class="modal fade" id="myModal${tmp.movieSeq }">
		<!-- modal-lg  | default | modal-sm -->
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="display: flex;">
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
						<div>
							<a href="detail.do?movieSeq=${tmp.movieSeq }" type="button" class="btn btn-info">자세히 보러가기</a>
						</div>
					</div>
				</div>
				<%-- <div class="modal-footer">
					<iframe src="${tmp.videoLink }"
						frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div> --%>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script>
		$("#best_${tmp.movieSeq}").click(function() {
			$("#myModal${tmp.movieSeq}").modal("show");
		});
	</script>
</c:forEach>