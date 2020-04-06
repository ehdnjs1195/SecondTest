<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<style>
	#navbar{
		z-index: 1;
	}
	.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
	    background-color: #2d3436 !important;
	    border: #FBFCFC ;
	    
	}
	.btn-warning, .btn-warning:hover, .btn-warning:active, .btn-warning:visited {
	    background-color: #2d3436 !important;
	    border: #FBFCFC ;
	}
	body{
	    margin-top: 90px;
	    padding: 0;
	    /* background: url(unnamed.jpg);
	    background-size: cover; */
	    font-family: fantasy, sans-serif;
	}
	.neon{
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    margin: 0;
	    padding: 0 20px;
	    font-size: 3em;
	    color: #fff;
	    text-shadow: 0 0 20px #ff005b;
	}
	.neon:after{
	    content: attr(data-text);
	    position: absolute;
	    top: 0;
	    left: 0;
	    padding: 0 20px;
	    z-index: -1;
	    color: #ff005b;
	    filter: blur(15px);
	}
	.neon::before{
	    content: '';
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: #fe3a80;
	    z-index: -2;
	    opacity: .5;
	    filter: blur(40px);
	}
</style>

<div class="navbar navbar-inverse navbar-fixed-top" id="navbar">
	<div class="container">
		<!-- 홈페이지 링크와 버튼을 넣어둘 div -->
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/home.do">
				<span class="neon" data-text="SPOILER">SPOILER</span>
			</a>
			<button class="navbar-toggle" data-toggle="collapse" data-target="#one">
			
			</button>
		</div>
		
		<c:choose>
				<c:when test="${empty sessionScope.id }">	<!-- sessionScope. 는 생략 가능 -->
					<div class="pull-right">
						<a class="btn btn-primary navbar-btn btn-xs" style="color:#A6A6A5;" href="${pageContext.request.contextPath }/users/loginform.do">Login</a>	<%-- 어디에 포함될지 모르니 절대경로를 넣어준다. --%>
						<a class="btn btn-warning navbar-btn btn-xs" style="color:#A6A6A5;" href="${pageContext.request.contextPath }/users/signup_form.do">Sign Up</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="pull-right">
						<strong>
						<a class="navbar-link" href="${pageContext.request.contextPath }/users/info.do">
						<c:choose>
							<c:when test="${empty profile }">
								<img src="${pageContext.request.contextPath }/resources/images/default_user.png" style="width:50px; height:50px; border-radius:50%;" /> ${id }
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath }${profile}" style="width:50px; height:50px; border-radius:50%;" /> ${id }							
							</c:otherwise>
						</c:choose>
						</a></strong>
						<a class="btn btn-warning navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/logout.do">Logout</a>
						
						<c:if test="${master eq 1 }"><a class="btn btn-danger" href="${pageContext.request.contextPath }/master/admin.do">관리자</a></c:if>
					</div>
				</c:otherwise>
		</c:choose>  
		<div class="pull-right" style="margin-top:15px; margin-right:40px;">
		<form action="searchlist.do" method="get" id="isSeach">
			<label for="condition" style="display: none;">검색조건</label>
			<input type="text" name="title" id="title" placeholder="영화 제목 검색" style="color:black;" />
			<button type="submit" style="color:black;">검색</button>
		</form>
		</div>
	</div>
</div>




