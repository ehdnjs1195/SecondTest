<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
.neon{
	font-family: fantasy, sans-serif;
}
/* 페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기 */
	.help-block, .form-control-feedback{
		display: none;
	}
	.btn btn-primary {
	width: 100%;
	background-color: #2d3436;
	border-color: #2d3436;
	margin-bottom: 0.5em;
	border-radius: 0;
}
 
.input-group .form-control {
    margin: 0px !important;
}
	div.scroll-wrapper{

    overflow: auto;

    border:solid 1px gray;

    height: 200px;

    width: 460px;
    
	overflow-x: auto;
	overflow-y: auto;
}

.agreement-title{
}

.scroll-wrapper:hover{

		background-color:#FEF9E7;
}

.h4 {
  background-color: lightgrey;
  width: 500px;
  padding: 0px;
  margin: 0px;
}
/* 배경화면*/
#backgroundImage{
	z-index: 1;
	
}

#backgroundImage:before {
   content: "";
   position: absolute;
   z-index: -1;
   top: 0;
   bottom: 0;
   left: 0;
   right: 0;
   background-image: linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.8) ),url(${pageContext.request.contextPath }/resources/images/bg.jpg);
    background-repeat: no-repeat;
    background-size: 100%;
    filter: grayscale(80%);
    height:100%;
    width:100%;
    opacity:0.3;
 }
/* 제목*/	
h1 {
    line-height: 1.66;
    letter-spacing: 5px;
    margin: 0;
    padding: 0;
    font-weight: 900;
    color: #222;
    font-family: 'Montserrat';
    font-size: 24px;
    text-transform: uppercase;
    text-align: center;
    margin-bottom: 20px;
}
/*  컨테이너 css*/
.login-content{
	background:#fff;
	-webkit-border-radius: 10px;
	padding: 50px 85px;
}
#info-form {
   
    !important: ;
    position: relative;
    margin: 0 auto;
}

.img-responsive{
	text-aling:center;
}
body {
    padding-top: 60px;
    background-color: #2d3436;
}

.bold {
	font-weight: bold;
}

.tm-border {
	border: 5px solid #fff;
	box-shadow: 2px 2px #000;
}

.shadow {
	text-shadow: 1px 1px #000;
}
header img {
  display: inline-block !important;
  text-align: center;
  
}
.tm-title {
	color: #1F618D;
	margin-top: 20px;
	
}


	h1 {font-size:40px;
}
	
	#profileForm{
		display: none;
	}
	
#info-form{
    background: #fff;
    border-radius: 10px;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    -o-border-radius: 10px;
    -ms-border-radius: 10px;
    padding: 50px 85px;
    opacity:0.9;
     width: 500px;
}

p{
	font:15px;
}

.img-responsive{
	display: block;
    max-width: 200px;
    height: 200px;
    margin: 0px auto;
}

#background{
	display: none;
}
</style>
</head>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<body>
<div id="backgroundImage"></div>

<div class="container" id="info-form">
<a href="javascript:" id="profileLink">
		<c:choose>
			<c:when test="${ empty dto.profile }" >
				<img src="${pageContext.request.contextPath }/resources/images/default_user.png" 
				class="img-responsive img-circle tm-border"/>
			</c:when>
			<c:otherwise>
				<img class="img-responsive img-circle tm-border" 
				src="${pageContext.request.contextPath }${dto.profile}" />
			</c:otherwise>
		</c:choose>
			</a>
		<h1 class="tm-title bold shadow">${dto.id }</h1>
		<h4><span style="font-weight:bold;">관심목록 |</span>
		<span>
		<c:choose>
			<c:when test="${count eq 0 }" >
				아직 추가한 영화가 없습니다.
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath }/users/favorite/list.do">${count }개가 있습니다.</a>
			</c:otherwise>
		</c:choose>
		</span> </h4>
		<p>
		
		
		</p>
		<p><span style="font-weight:bold;">개인정보 | </span>
		<a href="updateform.do"> 수정하기</a></p>
		<p><span style="font-weight:bold;">비밀번호 | </span> 
			<span><a href="pwd_updateform.do">수정하기</a></span>
			</p>
		<p>
			<span style="font-weight:bold;">이메일 |</span>
			<span>${dto.email }</span> </p>
		
		<p>
			<span style="font-weight:bold;">가입일 |</span> 
			<span>${dto.regdate }</span>
			</p>
	
	<p><a href="javascript:deleteConfirm()">회원 탈퇴</a></p>
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
		$("#profileLink img").attr("src", src);
	});
	

	function deleteConfirm(){
		var isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.do";
		}
	}
</script>
</body>
</html>





