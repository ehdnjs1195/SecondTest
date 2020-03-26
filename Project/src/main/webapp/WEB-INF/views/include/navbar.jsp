<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>

.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #2d3436 !important;
    border: #FBFCFC ;
    
}
.btn-warning, .btn-warning:hover, .btn-warning:active, .btn-warning:visited {
    background-color: #2d3436 !important;
    border: #FBFCFC ;
}
#profileLink1 img{
		width: 50px;
		height: 50px;
		border-radius: 50%;
		}
#profileForm{
		display: none;
	}
#searchbar{
	display:inline;
	position:relative;
 	margin-top: 5px;
}
</style>

<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- 홈페이지 링크와 버튼을 넣어둘 div -->
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/home.do"><i class="fas fa-ticket-alt"></i> Spoiler</a>
			<button class="navbar-toggle" data-toggle="collapse" data-target="#one">
			
			</button>
		</div>
		<form id="searchbar" action="searchlist.do" method="get">
				<label for="condition" style="display:none;">검색조건</label>
				<input type="text" name="keyword" id="keyword" placeholder="영화 검색" />
				<button	type="submit">검색</button>
		</form>
		<c:choose>
				<c:when test="${empty sessionScope.id }">	<!-- sessionScope. 는 생략 가능 -->
					<div class="pull-right">
						<a class="btn btn-primary navbar-btn btn-xs" style="color:#A6A6A5" href="${pageContext.request.contextPath }/users/loginform.do">로그인</a>	<%-- 어디에 포함될지 모르니 절대경로를 넣어준다. --%>
						<a class="btn btn-warning navbar-btn btn-xs" style="color:#A6A6A5" href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a>
					</div>
				</c:when>
				<c:otherwise>
				
					<div class="pull-right" >
						<span id="profileLink1" >
					
						<c:choose>
						<c:when test="${ empty profile }">
						<a href="${pageContext.request.contextPath }/users/info.do">
							<img src="${pageContext.request.contextPath }/resources/images/default_user.png"
							/>
							</a>
						</c:when>
						<c:otherwise>
						<a href="${pageContext.request.contextPath }/users/info.do">
							<img src="${pageContext.request.contextPath }${profile}"
							/>
						</a>	
						</c:otherwise>
						</c:choose>
					
				</span>
				
						
						<a class="btn btn-warning navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a>
						
						
		
					</div>
				</c:otherwise>
		</c:choose>  
		
	</div>
</div>

<form action="profile_upload.do" method="post"
	enctype="multipart/form-data" id="profileForm">
	<label for="profileImage">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage"
		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
</form>
<%-- jquery form  플러그인 javascript 로딩 --%>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//프로파일 이미지를 클릭하면 
	$("#profileLink").click(function(){
		//강제로 <input type="file" /> 을 클릭해서 파일 선택창을 띄우고
		$("#profileImage").click();
	});
	//input type="file" 에 파일이 선택되면 
	$("#profileImage").on("change", function(){
		//폼을 강제 제출하고 
		$("#profileForm").submit();
	});
	
	// jquery form 플러그인의 동작을 이용해서 폼이 ajax 로 제출되도록 한다. 
	$("#profileForm").ajaxForm(function(responseData){
		//responseData 는 plain object 이다.
		//{savedPath:"/upload/저장된이미지파일명"}
		//savedPath 라는 방에 저장된 이미지의 경로가 들어 있다.
		console.log(responseData);
		var src="${pageContext.request.contextPath }"
							+responseData.savedPath;
		// img 의 src 속성에 반영함으로써 이미지가 업데이트 되도록 한다.
		$("#profileLink1 img").attr("src", src);
	});
	

	function deleteConfirm(){
		var isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.do";
		}
	}
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
</script>
<%-- jquery form  플러그인 javascript 로딩 --%>

