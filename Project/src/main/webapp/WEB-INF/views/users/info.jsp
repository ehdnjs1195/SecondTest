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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login.css" />
<style>


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
}
.tm-title {
	color: #66CCFF;
}


	h1 {font-size:40px;
}
	
	#profileForm{
		display: none;
	}
	

.tm-border {
	border: 5px solid #fff;
	box-shadow: 2px 2px #000;
}

p{
	font:15px;
}
.img-circle {
    border-radius: 50%;
    
}
#info{
    background: #fff;
    border-radius: 10px;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    -o-border-radius: 10px;
    -ms-border-radius: 10px;
    padding: 50px 85px;
    opacity:0.9;
}
width: 660px;
  position: relative;
  margin: 0 auto;
}
</style>
</head>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<body>
<div id="backgroundImage"></div>

<div class="container" id="info">
<a href="javascript:" id="profileLink" >
		<c:choose>
			<c:when test="${ empty dto.profile }">
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
		<h1>${dto.email }</h1>
		
		<a href="updateform.do">개인 정보 수정하기</a>
		<p>비밀번호
			<span><a href="pwd_updateform.do">수정하기</a></span>
			</p>
		<p>
			이메일
			<span>${dto.email }</span>
		</p>
		<p>
			가입일
			<span>${dto.regdate }</span>
			</p>
	
	<a href="javascript:deleteConfirm()">회원 탈퇴</a>
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





