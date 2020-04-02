<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 랭킹</title>
<style>
	.movie_summary .raking_grade {
	    padding-top: 1px;
	    line-height: 22px;
	}
	.raking_grade {
	    display: inline-block;
	    line-height: 22px;
	}
	.raking_grade .bg_star {
	    display: block;
	    float: left;
	    width: 108px;
	    height: 17px;
	    background: url(//i1.daumcdn.net/img-contents/movie/2016/pc/bg_star_170614_v2.png) no-repeat 0 0;
	}
	.raking_grade .bg_star .inner_star {
	    overflow: hidden;
	    font-size: 0;
	    line-height: 0;
	    background-position: 0 -20px;
	    text-indent: -9999px;
	}
	.raking_grade .bg_star {
	    display: block;
	    float: left;
	    width: 108px;
	    height: 17px;
	    background: url(//i1.daumcdn.net/img-contents/movie/2016/pc/bg_star_170614_v2.png) no-repeat 0 0;
	}
</style>
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
						<td>
							<a href="#" class="raking_grade">
								<span class="bg_star star_grade">
									<span class="bg_star inner_star" style="width:${tmp.starPoint *10 }%">평점</span>
								</span>
								<em class="emph_grade">${tmp.starPoint }</em>
								<span class="txt_grade">/10</span>
							</a>
						</td>
					</tr>				
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>