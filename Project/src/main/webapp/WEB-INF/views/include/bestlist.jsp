<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
// 한글 나눔고딕 폰트 적용 CSS
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
body {
font-family: 'Nanum Gothic' auto;
}
.detail_btn{
	 border: 1px solid #333333;
  	outline: none;
  	color: #333333;
  	height: 27px;
  	width:100%;
}
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
	// Modal css
	
	.detail-btn {
  text-align: right;
  cursor: pointer;
}
.modal-header {
  padding: 20px 30px;
}

.modal-content{
   width: 50%; position: relative; left: 50%; transform:translateX(-50%);
  padding: 60px 40px;
  background: #fff;
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.15);
  display: inline-block;
  padding: 1em;
}

.modal-body{
   display: inline;
  
}

.modal-body img{
   top: 50%;
  left: 50%;
  padding: 20px 40px;
  background: transparent;
  border: 1px solid #ffffff;
  text-decoration: none;
}

.modal-footer Strong{
   float: left;
}

.modal-header > label {
      background: #FFD300;
      border: 1px solid #f0c600;
      border-radius: .2em;
      color: #000000;
      cursor: pointer;
      display: inline-block;
      font-weight: bold;
      padding: 0.75em 1.5em;
      text-shadow: 1px 1px 1px #fff;
      transition: all 0.55s;
    }
    .modal-header > label:hover {
      transform: scale(0.97);
    }




.modal-header label {
  background: #FFD300;	
  border-radius: 50%;
  color: #000000;
  cursor: pointer;
  display: inline-block;
  height: 1.5em;
  line-height: 1.3;
  position: absolute;
  right: .5em;
  top: .5em;
  width: 1.5em;
}
</style>

<div>
	<c:forEach var="tmp" items="${list }">
		<c:if test="${tmp.rank le 10 }">
			<div class="items" id="best_${tmp.movieSeq}" >
				<img id="best_${tmp.movieSeq}" src="${tmp.posters }" style="height: 300px !important;"/>
	               <div class="box-content" style="text-align:center">
	                <h3 class="title" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${tmp.title}</h3>
	                <p class="post" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">개봉일 : 
	                <fmt:parseDate var="dateFmt" pattern="yyyyMMdd" value="${tmp.repRlsDate }" />
	                <fmt:formatDate var="dateParse" pattern="yyyy년 MM월 dd일" value="${dateFmt }" />
	                <c:out value="${dateParse }"/>
	                </p>
	                <p class="post">${tmp.genre }</p>
	                <hr width="60%">
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
				<div class="modal-body" style="display: flex; font-family: auto;">
					<div class="imgBox" >
					<div class="modal-header">
						<h2 style="font-weight:bold; text-align:center;">${tmp.title }</h2>
						</div>
						<br>
						<dl class="movie_info">
							<dt>개봉</dt>
							<dd>
								<fmt:parseDate var="dateFmt" pattern="yyyyMMdd" value="${tmp.repRlsDate }" />
				                <fmt:formatDate var="dateParse" pattern="yyyy년 MM월 dd일" value="${dateFmt }" />
				                <c:out value="${dateParse }"/>
							</dd>
							<dt>장르</dt>
							<dd class="movie_genre">
								<p>${tmp.genre }</p>
							</dd>
							<dt>감독</dt>
							<dd class="movie_director">
								<p>${tmp.director }</p>
							</dd>
							<dt>출연</dt>
							<dd class="movie_actor" style="overflow: hidden; text-overflow: ellipsis;">
								<p>${tmp.actor }</p>
							</dd>
						</dl>
						<h4 style="font-weight:bold">줄거리</h4>
						<h5 style="overflow: hidden; text-overflow: ellipsis;">${tmp.plot }</h5>
						<br>
						<hr>
						<br>
						<div>
							<button onclick="location.href='detail.do?movieSeq=${tmp.movieSeq }&movieId=${tmp.movieId}&rank=${tmp.rank}'" type="button" class="detail_btn">자세히 보기</button>
						</div>
					</div>
				</div>
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