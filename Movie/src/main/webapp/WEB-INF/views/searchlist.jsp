<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search_list</title>
</head>
<body>

<table>
	<tr>
		<th>포스터</th>
		<td><img src="${dto.image }" /></td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.title }</td>
	</tr>
	<tr>
		<th>부제목</th>
		<td>${dto.subtitle }</td>
	</tr>
	<tr>
		<th>감독</th>
		<td>${dto.director }</td>
	</tr>
	<tr>
		<th>개봉일</th>
		<td>${dto.pubDate }</td>
	</tr>
	<tr>
		<th>배우</th>
		<td>${dto.actor }</td>
	</tr>
	<tr>
		<th>관객 평점</th>
		<td>${dto.userRating }</td>
	</tr>
	<tr>
		<th>링크</th>
		<td><a href="${dto.link }">클릭</a></td>
	</tr>
</table>
</body>
</html>