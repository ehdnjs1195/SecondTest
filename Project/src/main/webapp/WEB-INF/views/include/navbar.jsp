<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<style>
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

<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- 홈페이지 링크와 버튼을 넣어둘 div -->
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/home.do">
				<span class="neon" data-text="SPOILER">SPOILER</span>
			</a>
			<button class="navbar-toggle" data-toggle="collapse" data-target="#one">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
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
						<strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.do">
						<img src="${pageContext.request.contextPath }${profile}" style="width:50px; height:50px; border-radius:50%;" />${id }</a></strong>
						<a class="btn btn-warning navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/logout.do">Logout</a>
					</div>
				</c:otherwise>
			</c:choose>  
		<!-- xs 영역에서는 숨겨졌다가 버튼을 누르면 나오게 할 컨텐츠 -->
		<div class="collapse navbar-collapse" id="one">
			<ul class="nav navbar-nav">
				<li <c:if test="${param.category eq 'cafe' }">class="active"</c:if> ><a href="${pageContext.request.contextPath }/cafe/list.do">Cafe</a></li>
				<li <c:if test="${param.category eq 'file' }">class="active"</c:if> ><a href="${pageContext.request.contextPath }/file/list.do">File</a></li>
				<li <c:if test="${param.category eq 'shop' }">class="active"</c:if> ><a href="${pageContext.request.contextPath }/shop/list.do">Shop</a></li>
				<li <c:if test="${param.category eq 'member' }">class="active"</c:if> ><a href="${pageContext.request.contextPath }/member/list.do">Member</a></li>
			</ul>
			
		</div>
	</div>
</div>

<!-- 
	[include하면서 파라미터로 정보를 전달] 
	
	파라미터에 index에 포함되었는지 list에 포함되었는지 등의 정보를 전달할 수 있다.
	=> 각각 페이지에 맞는 css를 적용하기 위해서

-->