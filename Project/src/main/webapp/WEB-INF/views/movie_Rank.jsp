<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 랭킹</title>
<%-- <jsp:include page="include/resource.jsp"></jsp:include> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>순위</th>
					<th>영화명</th>
					<th>평점</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${requestScope.list }"> <%-- request에 담긴 list --%>
					<tr>
						<td>${tmp.rank }</td>
						<td>${tmp.title }</td>							
						<td>${tmp.starPoint }</td>
					</tr>				
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>