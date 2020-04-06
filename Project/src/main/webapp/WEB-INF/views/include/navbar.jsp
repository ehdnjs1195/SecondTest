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
	    top: 20px;
	    /* top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%); */
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
	/* 배경화면*/
	#background {
		z-index: 1;
	}
	
	#background:before {
		content: "";
		position: fixed;
		z-index: -1;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.8)),
			url("https://assets.nflxext.com/ffe/siteui/vlv3/3b48f428-24ed-4692-bb04-bc7771854131/fb5674c7-afc0-4c05-9f06-ef601019b114/KR-ko-20200302-popsignuptwoweeks-perspective_alpha_website_small.jpg");
		background-repeat: no-repeat;
		background-size: auto;
		filter: grayscale(80%);
		height: 100%;
		width: 100%;
		opacity: 0.5;
		background-attachment: fixed;
	}
	
	.search-box{
		color: black;
		margin-top: -1.5px;
		background: #2f3640;
		height: 38.5px;
		border-radius: 40px;
		padding: 0;
	}
	.search-box:hover > .search-txt{
		width: 200px;
		padding: 0 6px;
	}
	.search-box:hover > .search-btn{
		background: white;
	}
	
	.search-btn{
		color: black;
	    margin-top: -1.5px;
		float: right;
		width: 40px;
		height: 38.5px;
		border-radius: 50%;
		background: #db0752;
		display: flex;
		justify-content: center;
		align-items: center;
		transition: 0.4s;
	}
	
	.search-txt{
		border: none;
		background: none;
		outline: none;
		float: left;
		padding: 0;
		color: white;
		font-size: 16px;
		transition: 0.4s;
		line-height: 40px;
		width: 0px;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" integrity="sha256-KzZiKy0DWYsnwMF+X1DvQngQ2/FxF7MF3Ff72XcpuPs=" crossorigin="anonymous"></script>
<!-- 배경화면 -->
<div id="background"></div>
<div class="navbar navbar-inverse navbar-fixed-top">
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
						<strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/info.do">
						<img src="${pageContext.request.contextPath }${profile}" style="width:50px; height:50px; border-radius:50%;" />${id }</a></strong>
						<a class="btn btn-warning navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/logout.do">Logout</a>
					</div>
				</c:otherwise>
		</c:choose>  
		<div class="pull-right" style="margin-top:15px; margin-right:40px;">
			<form action="searchlist.do" method="get" id="isSeach">
				<label for="condition" style="display: none;">검색조건</label>
				<div class="search-box">
					<input class="search-txt" type="text" name="title" placeholder="영화 제목 검색" />
					<a href="#" onclick="document.getElementById('isSeach').submit()" class="search-btn" type="submit">
						<i class="fas fa-search"></i>
					</a>
				</div>
			</form>
		</div>
	</div>
</div>

