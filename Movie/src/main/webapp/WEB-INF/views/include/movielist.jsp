<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:forEach var="tmp" items="${list }">
	<div class="item active">
		<div class="items">
		    <img id="showImg1" src="images/${tmp.fileName }.jpg" />
		</div>
	</div>
</c:forEach>
<c:forEach var="tmp" items="${list }">
	<div class="item">
		<div class="items">
		    <img id="showImg1" src="images/${tmp.fileName }.jpg" />
		</div>
	</div>
</c:forEach>
