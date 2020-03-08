<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search_list</title>
</head>
<body>
<c:forEach var="tmp" items="${list }">
	<table>
			<tr>
				<th>포스터</th>
				<td><img src="${tmp.image }" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${tmp.title }</td>
			</tr>
			<tr>
				<th>부제목</th>
				<td>${tmp.subtitle }</td>
			</tr>
			<tr>
				<th>감독</th>
				<td>${tmp.director }</td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td>${tmp.pubDate }</td>
			</tr>
			<tr>
				<th>배우</th>
				<td>${tmp.actor }</td>
			</tr>
			<tr>
				<th>관객 평점</th>
				<td>${tmp.userRating }</td>
			</tr>
			<tr>
				<th>링크</th>
				<td><a href="${tmp.link }">클릭</a></td>
			</tr>
	</table>
	<p>-------------------------------------</p>
</c:forEach>
</body>
</html>