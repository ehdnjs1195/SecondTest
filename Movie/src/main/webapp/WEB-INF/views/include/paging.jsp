<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-display">
	<ul class="pagination pagination-sm">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li><a
					href="${param.page}list.do?pageNum=${startPageNum-1 }&keyword=${encodedKeyword}&genre=${param.genre}">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a href="javascript:">&laquo;</a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }"
			step="1">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active"><a
						href="${param.page}list.do?pageNum=${i }&keyword=${encodedKeyword}&genre=${param.genre}">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${param.page}list.do?pageNum=${i }&keyword=${encodedKeyword}&genre=${param.genre}">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li><a
					href="${param.page}list.do?pageNum=${endPageNum+1 }&keyword=${encodedKeyword}&genre=${param.genre}">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a href="javascript:">&raquo;</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>