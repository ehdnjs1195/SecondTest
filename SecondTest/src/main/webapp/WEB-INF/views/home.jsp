<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %> 	<!-- .com/jsp/jstl/core 를 lib에 넣지 않았는데도 사용할 수 잇는 이유는 pom.xml에 이미 사용할 준비가 되어 있기 때문에(jstl을 찾으면 있음) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Project</title>
<jsp:include page="include/resource.jsp"/>
<style>
	strong{
		color: #ff4757;
	}
	h1{
		margin-bottom:100px;
	}
</style>
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<div class="container">
	<h1>Welcome!</h1>
	<table class="table table-bordered">
		<tr>
			<th colspan="2" style="text-align: center;"><h4>※ 공지사항 ※</h4></th>
			
		</tr>
		<tr>
			<th style="text-align: center;vertical-align:middle;">Spring</th>
			<td>
				<ol>
					<li>각자 맡은 <strong>기능을 구현</strong>합니다.</li>
					<li>기본적인 세팅은 모두 마친 상태이지만 <strong>필요한 세팅이 있다면 추가</strong>하시면 됩니다.</li>
					<li>구현할 때 주의 사항은 <strong>파일이 겹치지 않도록</strong> 만들어 주시면 됩니다.</li>
					<li>Configuration.xml 에 각자 필요한 <strong>Alias, Mapper를 등록</strong>해주시면 됩니다.</li>
				</ol>
			</td>
		</tr>
		<tr>
			<th style="text-align: center;vertical-align:middle;">Git</th>
			<td>
				<ol>
					<li>이름 <strong>이니셜로 브랜치</strong>를 만들어 주시기 바랍니다. ex) ADW</li>
					<li><strong>master 브랜치</strong>로 check-out을 <strong>가급적 피해</strong>주시기 바랍니다. (master 브랜치로 commit 및 push 방지)</li>
					<li><strong>commit 및 push를 하실 때는 [이니셜] commit내용.</strong> 의 방식으로 부탁드립니다.ex) [ADW] users 로그인 기능 구현 중. </li>
					<li>각 기능 구현이 끝나면 <strong>master 브랜치로 통합 하겠습니다.</strong> 그 후 각자 master의 마지막 커밋으로 merge 후 <strong>각자의 브랜치로 새로운 커밋</strong>을 만드시면 됩니다.</li>
				</ol>
			</td>
		</tr>
	</table>
	<p>다같이 화이팅~! 😊😊</p>
	<p>구리구리이이이이이 입니다아아아아아아아아아아</p>
</div>
<div class="container">
	<p>왜들 그리 재미없어~!</p>
	<p>뭐가 문제야 say something</p>
	<p>아무노래 챌 go?</p>
</div>
</body>
</html>