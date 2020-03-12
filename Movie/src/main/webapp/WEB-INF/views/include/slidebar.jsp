<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<style>
	#s_bar{
		position:fixed; 
		top:50px; 
		margin-left:-200px;
		width:200px; 
		height:100%; 	
	}
	
	#bar{
		list-style-type: none;
		margin-left:-50px;
		font-size: large;
	}

	span{
		font-size: xx-large;
		color: white;
	}
	.active{
		background-color: gray;
	}
</style>
<div id="s_bar">
	<ul>
		<li id="bar" <c:if test="${param.genre eq '코미디' }">class="active"</c:if>><a class="btn btn-lg" style="width: 100%" href="genredetaillist.do?genre=코미디" ><span>코미디</span></a></li>
		<li id="bar" <c:if test="${param.genre eq '드라마' }">class="active"</c:if>><a class="btn btn-lg" style="width: 100%" href="genredetaillist.do?genre=드라마" ><span>드라마</span></a></li>
		<li id="bar" <c:if test="${param.genre eq '범죄' }">class="active"</c:if>><a class="btn btn-lg" style="width: 100%" href="genredetaillist.do?genre=범죄"><span>범죄</span></a></li>
	</ul>
</div>