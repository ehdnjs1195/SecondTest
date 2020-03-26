<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.txt_origin{
	display: -webkit-box;
    overflow: hidden;
    height: 25px;
    font-size: 14px;
    line-height: 25px;
    color: #989898;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    font-family: auto;
}
.tit_movie{
    display: block;
    overflow: hidden;
    width: 100%;
    padding-bottom: 0;
    font-size: 18px;
    line-height: 25px;
    font-family: auto;
}
.detail_summarize{
    position: relative;
    float: left;
    margin-right: 30px;
    font-family: auto;
}
.movie_summary{
    overflow: hidden;
    font-family: auto;
}
.txt_main{
	font-size: 14px;
	font-family: auto;
}
.txt_grade{
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
    background: url(//i1.daumcdn.net/img-contents/movie/2016/pc/bg_star_170614_v2.png) no-repeat 0 0;
    overflow: hidden;
    font-size: 0;
    line-height: 0;
    background-position: 0 -20px;
    text-indent: -9999px;
    font-family: auto;
}
.plot{
	font-weight: lighter;
	font-style: normal;
	font-family: auto;
	color: #ff83c2;
}
.list_placing{
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
.emph_g{
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
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/detail_custom.css" />
<jsp:include page="include/resource.jsp"/>
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<div class="container" style="color:white;">
	<div class="detail_summarize">
		<span class="thumb_summary #info #poster">
			<img src="${dto.posters }" style="width: 187px; height: 272px;" class="img_summary" alt="${dto.title } 포스터"/>
		</span>
	</div>
	<div class="movie_summary">
		<div class="subject_movie">
			<strong class="tit_movie">${dto.title } (${dto.repRlsDate })</strong>
			<!-- 영어 원본 제목 -->
			<span class="txt_origin">${dto.titleEng }</span>
		</div>
		<span class="bg_star star_grade">
			<span class="bg_star inner_star" style="width:73.30000162124634%">평점</span>
		</span>
		<em class="emph_grade">${dto.starPoint }</em>
		<span class="txt_grade">/10</span>
		<dl class="list_movie list_main" style="clear: left;">
			<dd class="txt_main">${dto.genre }</dd>
			<dd class="txt_main">
				(개봉) ${dto.repRlsDate }
			</dd>
			<dd class="type_ellipsis">
				(감독) <a href="#" style="color: #70ff35;">${dto.director }</a>
			</dd>
			<dd class="type_ellipsis">
				(배우) <a href="#" style="color: #70ff35;">${dto.actor }</a>
			</dd>
		</dl>
		<dl class="list_placing">
		<dt class="screen_out">예매순위</dt>
		<dd>
			예매 
			<em class="emph_g"><strong>2</strong></em>&nbsp;위
			<span class="txt_bar"></span>
		</dd>
		<dt>누적관객</dt>
		<dd id="totalAudience">682,309명</dd>
		</dl>
		<a href="#" class="btn btn-danger">관심목록 추가하러가기</a>
	</div>
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
				<img id="user-img" class="user-img" src="${pageContext.request.contextPath}/resources/images/default_user.jpeg"/>
			</c:when>
			<c:otherwise>
				<img id="user-img" class="user-img" src="${pageContext.request.contextPath}${profile}"/>
			</c:otherwise>
		</c:choose>
		<div class="comment_form">
			<form action="comment_insert.do" method="post">
				<!-- 댓글의 그룹번호는 원글의 글번호가 된다.  -->
				<input type="hidden" name="ref_group" 
					value="${dto.movieSeq }"/>
				<input type="hidden" name="movieId" 
					value="${dto.movieId}"/>
				<!-- 댓글의 대상자는 원글의 작성자가 된다. -->
				<input type="hidden" name="target_id" 
					value="${dto.movieSeq }"/> <!-- 정보를 받아와서 뿌려주므로 원글의 작성자를 dto.movieSeq 으로 넣어줬다. -->
				<textarea class="form-control" name="content" style="color:black;"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
				<button type="submit" style="color:black;">등록</button>
			</form>
		</div>
		<ul>
		<c:forEach items="${commentList }" var="tmp">
			<c:choose>
				<c:when test="${tmp.deleted ne 'yes' }">
					<li class="comment" id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >
						<c:if test="${tmp.num ne tmp.comment_group }">
							<img class="reply_icon" src="${pageContext.request.contextPath}/resources/images/re.gif"/>
						</c:if>
						<dl>
							<dt>
								<c:choose>
									<c:when test="${empty tmp.profile }">
										<img class="user-img" src="${pageContext.request.contextPath}/resources/images/default_user.jpeg"/>
									</c:when>
									<c:otherwise>
										<img class="user-img" src="${pageContext.request.contextPath}${tmp.profile}"/>
									</c:otherwise>
								</c:choose>
								
								<span style="font-weight: normal; font-family: auto;">${tmp.writer }</span>
								<c:if test="${tmp.num ne tmp.comment_group }">
									<strong>to</strong>
									<strong>${tmp.target_id }</strong>
								</c:if>
								<span style="font-weight: normal; font-family: auto;">${tmp.regdate }</span>
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
							<!-- 덧글 대상 -->
							<input type="hidden" name="target_id" value="${tmp.writer }" />
							<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
							<textarea name="content" style="color:black;"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
							<button type="submit" style="color:black;">등록</button>
						</form>	
						<!-- 로그인한 아이디와 댓글의 작성자와 같으면 수정폼 출력 -->				
						<c:if test="${id eq tmp.writer }">
							<form class="comment-update-form" action="comment_update.do" method="post">
								<input type="hidden" name="num" value="${tmp.num }" />
								<textarea name="content" id="comment" style="color:black;">${tmp.content }</textarea>
								<button type="submit">수정</button>
							</form>
						</c:if>
					</li>				
				</c:when>
				<c:otherwise>
					<li <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >삭제된 댓글 입니다.</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</ul>	
	</div>
</div>
<script>
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
				if(responseData.isSuccess){
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