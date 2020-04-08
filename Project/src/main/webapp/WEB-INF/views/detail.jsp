
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPOILER/detail</title>
<jsp:include page="include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/detail_custom.css" />
<style>
.txt_origin {
	display: -webkit-box;
	overflow: hidden;
	height: 25px;
	font-size: 14px;
	line-height: 25px;
	color: #a2a0a0;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
	font-family: auto;
}

.tit_movie {
	display: block;
	overflow: hidden;
	width: 100%;
	padding-bottom: 0;
	font-size: 18px;
	line-height: 25px;
	font-family: auto;
}

.detail_summarize {
	position: relative;
	float: left;
	margin-right: 30px;
	font-family: auto;
}

.movie_summary {
	overflow: hidden;
	font-family: auto;
}

.txt_main {
	font-size: 14px;
	font-family: auto;
}

.txt_grade {
	float: left;
	font-size: 18px;
	line-height: 15px;
	color: #989898;
	font-family: auto;
}

.emph_grade {
	float: left;
	padding-left: 10px;
	font-size: 18px;
	line-height: 15px;
	font-weight: bold;
	color: #ff0080;
	font-family: auto;
}

.bg_star {
	display: block;
	float: left;
	width: 106px;
	height: 17px;
	background:
		url(//i1.daumcdn.net/img-contents/movie/2016/pc/bg_star_170614_v2.png)
		no-repeat 0 0;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	background-position: 0 -20px;
	text-indent: -9999px;
	font-family: auto;
}

.plot {
	font-weight: lighter;
	font-style: normal;
	font-family: auto;
	color: #ff83c2;
}

.list_placing {
	overflow: hidden;
	padding-top: 11px;
	border-top: 2px solid #f5f5f5;
}

.list_placing .txt_bar {
	width: 1px;
	height: 12px;
	margin: 4px 7px 0 11px;
	background-color: #eaeaea;
	display: inline-block;
	vertical-align: top;
}

.screen_out {
	overflow: hidden;
	position: absolute;
	width: 0;
	height: 0;
	line-height: 0;
	text-indent: -9999px;
}

.emph_g {
	color: #f32276;
}

.list_placing dt {
	float: left;
	padding-right: 5px;
}

.list_placing dd {
	float: left;
	margin-right: 5px;
}

#moreComment, #allComment {
	background-color: #b0b0b000 !important;
	font-family: initial;
	font-style: italic;
}

#moreComment:hover, #allComment:hover {
	background-color: #8686867a !important;
}

.movie_summary .raking_grade {
	padding-top: 1px;
	line-height: 22px;
}

.raking_grade {
	display: inline-block;
	line-height: 22px;
}

.raking_grade .bg_star {
	display: block;
	float: left;
	width: 108px;
	height: 17px;
	background:
		url(//i1.daumcdn.net/img-contents/movie/2016/pc/bg_star_170614_v2.png)
		no-repeat 0 0;
}

.raking_grade .bg_star .inner_star {
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	background-position: 0 -20px;
	text-indent: -9999px;
}

.raking_grade .bg_star {
	display: block;
	float: left;
	width: 108px;
	height: 17px;
	background:
		url(//i1.daumcdn.net/img-contents/movie/2016/pc/bg_star_170614_v2.png)
		no-repeat 0 0;
}
#add_btn{
	background-color: mediumslateblue;
}
</style>
</head>
<body>
	<jsp:include page="include/navbar.jsp" />
	<div class="container" style="color: white;">
		<div class="detail_summarize">
			<span class="thumb_summary #info #poster"> <img
				src="${dto.posters }" style="width: 187px; height: 272px;"
				class="img_summary" alt="${dto.title } 포스터" />
			</span>
		</div>
		<div class="movie_summary">
			<div class="subject_movie">
				<strong class="tit_movie">${dto.title }</strong>
				<!-- 영어 원본 제목 -->
				<span class="txt_origin">${dto.titleEng }</span>
			</div>
			<span class="raking_grade">
				<span class="bg_star star_grade">
					<span class="bg_star inner_star"
						<c:choose>
							<c:when test="${empty rDto.starPoint}">style="width:${point2}%"</c:when>
							<c:otherwise>style="width:${rDto.starPoint *10}%"</c:otherwise>
						</c:choose>>
						평점
					</span>
				</span> 
				<em class="emph_grade">
					<c:choose>
						<c:when test="${empty rDto.starPoint}">${point}</c:when>
						<c:otherwise>${rDto.starPoint}</c:otherwise>
					</c:choose>
				</em>
				<span class="txt_grade">/10</span>
			</span>
			<dl class="list_movie list_main" style="clear: left;">
				<dd class="txt_main">${dto.genre }</dd>
				<dd class="txt_main">(개봉) ${dto.repRlsDate }</dd>
				<dd class="type_ellipsis">
					(감독) <span style="color: #70ff35;">${dto.director }</span>
				</dd>
				<dd class="type_ellipsis">
					(배우) <span style="color: #70ff35;">${dto.actor }</span>
				</dd>
			</dl>
			<dl class="list_placing">
				<dt class="screen_out">예매순위</dt>
				<dd>
					<c:choose>
						<c:when test="${not empty rank}">
							예매율
							<em class="emph_g"><strong>${rank}</strong></em>&nbsp;위
						</c:when>
						<c:when test="${not empty rDto.rank}">
							역대 평점
							<em class="emph_g"><strong>${rDto.rank}</strong></em>&nbsp;위
						</c:when>
						<c:otherwise>
							예상 순위
							<em class="emph_g"><strong>${random}</strong></em>&nbsp;위
						</c:otherwise>
					</c:choose>
				</dd>
				<dt>누적관객</dt>
				<dd id="totalAudience">
					<fmt:formatNumber value="${random2 }" />명
				</dd>
			</dl>
			<!-- 관심목록 -->
			<form id="favorite_form" class="favorite_form" action="" method="post">
				<input type="hidden" name="movieId" value="${dto.movieId }" /> 
				<input type="hidden" name="movieSeq" value="${dto.movieSeq }" />
				<input type="hidden" name="repRlsDate" value="${dto.repRlsDate }" /> 
				<input type="hidden" name="title" value="${dto.title }" /> 
				<input type="hidden" name="genre" value="${dto.genre }" /> 
				<input type="hidden" name="posters" value="${dto.posters }" />
				<c:choose>
					<c:when test="${rDto.starPoint eq null}">
						<input type="hidden" name="randomStarPoint" value="${point }"/>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="starPoint" value="${rDto.starPoint}"/>
					</c:otherwise>
				</c:choose>
				<button id="add_btn" class="btn" type="submit" style="display:none;">관심목록 추가</button>
			</form>
		</div>
		<!-- 줄거리 -->
		<div class="desc_movie" style="clear: left; font-weight: bold; padding-top: 28px;">
			<h3 style="font-style: oblique; margin-top: 0; color: #ff83c2;">줄거리</h3>
			<p class="plot">${dto.plot }</p>
		</div>
		<!-- Comments -->
		<h3 style="font-style: oblique;">네티즌 댓글</h3>
		<div class="comments">
			<!-- 원글에 댓글을 작성할수 있는 폼 -->
			<c:choose>
				<c:when test="${empty profile }">
					<img id="user-img" class="user-img" src="${pageContext.request.contextPath}/resources/images/default_user.jpeg" />
				</c:when>
				<c:otherwise>
					<img id="user-img" class="user-img" src="${pageContext.request.contextPath}${profile}" />
				</c:otherwise>
			</c:choose>
			<div class="comment_form">
				<form action="comment_insert.do" method="post">
					<!-- 댓글의 그룹번호는 원글의 글번호가 된다.  -->
					<input type="hidden" name="ref_group" value="${dto.movieSeq }" />
					<input type="hidden" name="movieId" value="${dto.movieId}" />
					<!-- 댓글의 대상자는 원글의 작성자가 된다. -->
					<input type="hidden" name="target_id" value="${dto.movieSeq }" />
					<!-- 정보를 받아와서 뿌려주므로 원글의 작성자를 dto.movieSeq 으로 넣어줬다. -->
					<textarea class="form-control" name="content" style="color: black;"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
					<button type="submit" style="color: black;">등록</button>
				</form>
			</div>
			<ul>
				<c:forEach items="${commentList }" var="tmp">
					<c:choose>
						<c:when test="${tmp.deleted ne 'yes' }">
							<li class="comment" id="comment${tmp.num }"
								<c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if>>
								<c:if test="${tmp.num ne tmp.comment_group }">
									<img class="reply_icon" src="${pageContext.request.contextPath}/resources/images/re.gif" />
								</c:if>
								<dl>
									<dt>
										<c:choose>
											<c:when test="${empty tmp.profile }">
												<img class="user-img" src="${pageContext.request.contextPath}/resources/images/default_user.jpeg" />
											</c:when>
											<c:otherwise>
												<img class="user-img" src="${pageContext.request.contextPath}${tmp.profile}" />
											</c:otherwise>
										</c:choose>
										<span style="font-weight: normal; font-family: auto;">${tmp.writer }</span>
										<c:if test="${tmp.num ne tmp.comment_group }">
											<strong>to</strong>
											<strong>${tmp.target_id }</strong>
										</c:if>
										<span style="font-weight: normal; font-family: auto;">${tmp.regdate }</span>
										<!-- 추천기능 script -->
										<script>
											$(function(){
												$("#recommend${tmp.num }").click(function(){
													var isLogin=${not empty id};
													if(isLogin==false){
														var isMove=confirm("추천하려면 로그인이 필요합니다.\n로그인 페이지로 이동 하시겠습니까?");
														if(isMove){
															location.href="${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/detail.do?movieSeq=${dto.movieSeq}%26movieId=${dto.movieId}";
															return false;
														}
													}else{
													var num=$(this).attr("value");
													var cnt=parseInt($("#recommendCnt${tmp.num}").text());
													console.log(num);
													$.ajax({
														url:"recommend.do",
														method:"post",
														data:{"id":"${id}","num":num},
														success:function(responseData){
															// responseData : {isSuccess:true}
															if(responseData.isSuccess){	//down
																$("#heartShow${tmp.num }").hide();
																$("#heartHide${tmp.num }").show();
																var a = cnt;
																a -= 1;
																$("#recommendCnt${tmp.num}").text(a);
																console.log("success");
															
															}else{	//up
																$("#heartShow${tmp.num }").show();
																$("#heartHide${tmp.num }").hide();
																var a = cnt;
																a += 1;
																$("#recommendCnt${tmp.num}").text(a);
																console.log("false");
															
															}
														}
													});
													}
												})
											})
											
											$(document).ready(function(){
													var num="${tmp.num}";
												$.ajax({
													url: "recommend2.do",
													method: "POST",
													data:{"id":"${id}","num":num},
													
													success: function(responseData){
														if(responseData.isExist){	//down
															$("#heartShow${tmp.num }").hide();
															$("#heartHide${tmp.num }").show();
															console.log("is Exist : true");
														}else{	//up
															$("#heartShow${tmp.num }").show();
															$("#heartHide${tmp.num }").hide();
															console.log("is Exist : false");
														}
													}
												})
											});
									</script>
										<button id="recommend${tmp.num }"
											style="background:none; border:none; cursor: pointer;" value="${tmp.num}">
											<span id="heartShow${tmp.num }" class="glyphicon glyphicon-heart" style="color: red;" aria-hidden="true" ></span>
											<span id="heartHide${tmp.num }" class="glyphicon glyphicon-heart" style="color: #a5b1c2;" aria-hidden="true"></span>
											<span id="recommendCnt${tmp.num }">${tmp.recommendCnt }</span>
										</button>

										<a href="javascript:" class="reply_link" style="color: #70ff35;">답글</a> |
										<c:choose>
											<%-- 로그인된 아이디와 댓글의 작성자가 같으면 --%>
											<c:when test="${id eq tmp.writer }">
												<a href="javascript:" class="comment-update-link" style="color: #00c851;">수정</a>&nbsp;&nbsp;
												<a href="javascript:deleteComment(${tmp.num })" style="color: #00c851;">삭제</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:" style="color: #ff0000;">신고</a>
											</c:otherwise>
										</c:choose>
									</dt>
									<dd>
										<pre>${tmp.content }</pre>
									</dd>
								</dl> 
								<!-- 대댓글 form css 에 display: none; -->
								<form class="comment-insert-form" action="comment_insert.do" method="post">
									<!-- 덧글 그룹 -->
									<input type="hidden" name="ref_group" value="${dto.movieSeq }" />
									<input type="hidden" name="movieId" value="${dto.movieId}" />
									<!-- 덧글 대상 -->
									<input type="hidden" name="target_id" value="${tmp.writer }" />
									<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
									<textarea name="content" style="color: black;"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
									<button type="submit" style="color: black;">등록</button>
								</form>
								<!-- 로그인한 아이디와 댓글의 작성자와 같으면 수정폼 출력 -->
								<c:if
									test="${id eq tmp.writer }">
									<form class="comment-update-form" action="comment_update.do" method="post">
										<input type="hidden" name="num" value="${tmp.num }" />
										<textarea name="content" id="comment" style="color: black;">${tmp.content }</textarea>
										<button type="submit">수정</button>
									</form>
								</c:if>
							</li>
						</c:when>
						<c:otherwise>
							<li
								<c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if>>
								삭제된 댓글 입니다.
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>

<script>
// 관심록록 추가
$(document).ready(function(){
	var isLogin=${not empty id};
	if(isLogin){
	$.ajax({									
		url: "favorite_list2.do",
		method: "POST",
		data:{'movieSeq':'${dto.movieSeq}'},
		success: function(data){
			if(data.result){
				$("#add_btn").removeAttr("style"); 
				$("#add_btn").css('background-color', 'red');
				$("#add_btn").text('관심목록 삭제')
			}else{				
				$("#add_btn").removeAttr("style"); 
				$("#add_btn").css('background-color', 'mediumslateblue');
				$("#add_btn").text('관심목록 추가');
			}//else
		}//success: function(data){
	})//$.ajax({
	}//if(isLogin){
});//$(document).ready(function(){

//댓글 수정 링크를 눌렀을때 호출되는 함수 등록
$(".comment-update-link").click(function(){
	$(this)
	.parent().parent().parent()
	.find(".comment-update-form")
	.slideToggle(200);
});

//댓글 수정 폼에 submit 이벤트가 일어났을때 호출되는 함수 등록
$(".comment-update-form").on("submit", function(){
	// "comment_update.do"
	var url=$(this).attr("action");
	//폼에 작성된 내용을 query 문자열로 읽어온다.
	// num=댓글번호&content=댓글내용
	var data=$(this).serialize();
	//이벤트가 일어난 폼을 선택해서 변수에 담아 놓는다.
	var $this=$(this);
	$.ajax({
		url:url,
		method:"post",
		data:data,
		success:function(responseData){
			// responseData : {isSuccess:true}
			if(responseData){
				//폼을 안보이게 한다 
				$this.slideUp(200);
				//폼에 입력한 내용 읽어오기
				var content=$this.find("textarea").val();
				//pre 요소에 수정 반영하기 
				$this.parent().find("pre").text(content);
			}
		}
	});
	//폼 제출 막기 
	return false;
});

//댓글 삭제를 눌렀을때 호출되는 함수
function deleteComment(num){
	var isDelete=confirm("확인을 누르면 댓글이 삭제 됩니다.");
	if(isDelete){
		//페이지 전환 없이 ajax 요청을 통해서 삭제 하기 
		$.ajax({
			url:"comment_delete.do", // "/comment_delete.do" 요청
			method:"post",
			data:{"num":num}, // num 이라는 파라미터명으로 삭제할 댓글의 번호 전송
			success:function(responseData){
				if(responseData.isSuccess){
					var sel="#comment"+num;
					$(sel).text("삭제된 댓글 입니다.");
				}
			}
		});
	}
}

//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
$(".comments form").on("submit", function(){
	//로그인 여부
	var isLogin=${not empty id};
	if(isLogin==false){
		alert("로그인 페이지로 이동 합니다.");
		location.href="${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/detail.do?movieSeq=${dto.movieSeq}%26movieId=${dto.movieId}";
		return false;//폼 전송 막기 
	}
});

//폼에 click 이벤트가 일어 났을때 실행할 함수 등록 
$(".comments form textarea").on("click", function(){
	//로그인 여부 
	var isLogin=${not empty id};
	if(isLogin==false){
		var isMove=confirm("로그인 페이지로 이동 하시겠습니까?");
		if(isMove){
			location.href="${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/detail.do?movieSeq=${dto.movieSeq}%26movieId=${dto.movieId}";			
		}
	}
});

//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록 
$(".favorite_form").on("submit",function(event){
	 event.preventDefault();
	var isLogin=${not empty id};
	if(isLogin==false){
		var isMove=confirm("관심목록을 추가하려면 로그인이 필요합니다.\n로그인 페이지로 이동 하시겠습니까?");
		if(isMove){
			location.href="${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/detail.do?movieSeq=${dto.movieSeq}%26movieId=${dto.movieId}";		
				return false;
		}
	}else{		
		var data = $(this).serialize();
		$.ajax({						
			url: "favorite_list.do",
			method: "POST",
			data:data,
			success: function(data){
				if(data.result){
					alert(data.title+"을(를) 관심목록에서 삭제하였습니다.");
					$("#add_btn").css('background-color', 'mediumslateblue');
					$("#add_btn").text('관심목록 추가')
				}else{		
					alert(data.title+"을(를) 관심목록에 추가하였습니다.");
					$("#add_btn").css('background-color', 'red');
					$("#add_btn").text('관심목록 삭제')
				}				
			}
		})
	}
});

//답글 달기 링크를 클릭했을때 실행할 함수 등록
$(".comment .reply_link").click(function(){
	$(this)
	.parent().parent().parent()
	.find(".comment-insert-form")
	.slideToggle(200);
	
	// 답글 <=> 취소가 서로 토글 되도록 한다. 
	if($(this).text()=="답글"){
		$(this).text("취소");
	}else{
		$(this).text("답글");
	}
});
function deleteConfirm(){
	var isDelete=confirm("글을 삭제 하시 겠습니까?");
	if(isDelete){
		location.href="delete.do?movieSeq=${dto.movieSeq}";
	}
}
</script>
</body>

<!-- comment 더보기 처리 script -->
<script>window.jQuery||document.write('<script src="https://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.min.js"><\/script>');</script>
<script>
var thresholdCount = 5; //댓글 표시 갯수
$("li[id^='comment']").parent().first().addClass("nubiz");
var commentCount = $(".nubiz>li[id^='comment']").length;
$(".nubiz").append('<button id="moreComment" onclick="moreComment()" style="display:none"> 보기 </button><button id="allComment" onclick="showAllComment()" style="display:none">전체</br>보기</button><style>#moreComment {width: 85%;height: 50px;font-size: .8em;font-weight: bold;background-color: #eee;float:left;}#allComment{width: 15%;height: 50px;font-size: .8em;font-weight: bold;background-color: #eee;}#moreComment:hover,#allComment:hover {color:#fff;background-color: #999;}</style>')
function refeshComment() {
    $("#moreComment").html("더 보기 [ " + $("li[id^=comment]:visible").length + "/" + $("li[id^='comment']").length + " ]");
}
function moreComment() {
    $(".nubiz>li[id^='comment']:hidden:lt("+thresholdCount+")").show(500)
    if($("li[id^='comment']:hidden")[0]==undefined){
        $("#moreComment, #allComment").hide(500)
    };
    refeshComment();
}
function showAllComment() {
    $(".nubiz>li[id^=comment]").show(500);
    $("#moreComment, #allComment").hide(500);
}
if (commentCount > thresholdCount) {
    $("#moreComment, #allComment").show();
    $(".nubiz>li[id^='comment']:gt(" + (thresholdCount-1) + ")").hide();
    refeshComment();
};
$("li[id^='ttMorePreviousComments']").click(function(){showAllComment()});
</script>
</html>