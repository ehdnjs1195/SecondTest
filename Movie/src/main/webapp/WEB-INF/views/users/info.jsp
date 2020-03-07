<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	/* 프로필 이미지가 가로 세로 50px 인 원형으로 표시 될 수 있도록  */
	#profileLink img{
		width: 50px;
		height: 50px;
		border-radius: 50%;
	}
	#profileForm{
		display: none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>개인 정보 페이지</h1>
	<table class="table table-bordered table-condensed">
		<tr>
			<th>아이디</th>
			<td>${dto.id }</td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td>
				<a href="javascript:" id="profileLink">
					<c:choose>
						<c:when test="${empty dto.profile }"><!-- 프로필 이미지가 비어있으면 default_user 이미지로 등록 -->
							<img src="${pageContext.request.contextPath }/resources/images/default_user.jpeg"/>
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath }${dto.profile }"/> <!-- dto.profile => 경로를 출력, 업로드 폴더에 저장한다. /upload/imageName.jpg -->
						</c:otherwise>
					</c:choose>
				</a>
			</td>
		</tr>
		<tr>
			<th>프로필경로보기</th>
			<td><strong>${pageContext.request.contextPath }${dto.profile }</strong></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a class="btn btn-warning btn-xs" href="pwd_updateform.do">수정하기</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.regdate }</td>
		</tr>
	</table>
	<a class="btn btn-primary" href="updateform.do">개인 정보 수정하기</a>
	<a class="btn btn-danger" href="javascript:deleteConfirm()">회원 탈퇴</a>
</div>

<form action="profile_upload.do" method="post" enctype="multipart/form-data" id="profileForm"> <!-- file이 전송이 되야함. -->
	<label for="profileImage">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/> <!-- 확장자를 명시해 놓은 것만 선택할 수 있다. (안적으면 모두) -->
</form>

<%-- jquery form 플러그인 javascript 로딩 (jquery-3.3.1.js 를 로딩해야 이것도 추가적으로 로딩 된다.)--%>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//프로파일 이미지를 클릭하면 (input type="file" 은 무조건 클릭을 해야만 파일탐색기가 뜬다.)
	$("#profileLink").click(function(){
		//강제로 <input type="file" /> 을 클릭해서 파일 선택창을 띄우고
		$("#profileImage").click();
	});
	//input type="file" 에 파일이 선택되면 "change" 라는 이벤트가 일어나서
	$("#profileImage").on("change", function(){
		//폼을 강제 제출하고(submit 버튼이 없어도 제출이 되고, 페이지 전환이 없다.) -> 파일 업로드
		$("#profileForm").submit(); //submit 이벤트를 발생시킨다.
	})
	//jquery form 플러그인의 동작을 이용해서 폼이 ajax 로 제출되도록 한다. (원래 안되지만(없지만) 위의 jquery 플러그인해서 사용할 수 있는 함수)
	//profile_upload.jsp 로 강제 제출되는데 ajax 로 인해 페이지 전환 없이(비동기 전환) ajax 로 제출하겠다. (UsersController 로)
	$("#profileForm").ajaxForm(function(responseData){ <%-- responseData = {savedPath:"<%=savedPath %>"} --%>
		//responseData 는 plain object 이다.(json 형태)
		//{savedPath:"/upload/저장된이미지파일명"}
		//savedPath 라는 방에 저장된 이미지의 경로가 들어 있다.
		console.log(responseData); //ajax 요청에 대한 응답이 들어온다.
		var src="${pageContext.request.contextPath }"+responseData.savedPath;
		// img 의 src 속성에 반영하므로써 이미지가 업데이트 되도록 한다. attr()은 요소(element)의 속성(attribute)의 값을 가져오거나 속성을 추가합니다.
		$("#profileLink img").attr("src", src); //.attr( attributeName, value ) src 속성을 바꾼다. [ 바꿔주면 이미지가 다시 로딩된다 ]
	});//이미지는 서버에 다시 요청해서 실시간으로 바뀌는 모습을 볼 수 있다.
	
	function deleteConfirm(){
		var isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.do";
		}
	}
</script>
</body>
</html>