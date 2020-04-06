<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/toggle.css" />
<style>
	body{
		color: #fff;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="container">
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성날짜</th>
			<th>게시상태(ON/OFF)</th>
		</tr>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td><a href="popup.do?num=${tmp.num }" style="color:white;">${tmp.title }</a></td>
				<td>${tmp.regdate }</td>
				<td>
					<label class="switch">
				        <input class="check_${tmp.num}" type="checkbox" <c:if test="${tmp.state }">checked</c:if> >	
				        <span class="slider round"></span>
				    </label>
				    <p class="onOff_${tmp.num }">OFF</p>
				    <p class="onOff_${tmp.num }" style="display:none;">ON</p> 
      			</td>
			</tr>	
			
			<script>
			    var check = $(".check_${tmp.num}");
			    var tog;
			    check.click(function(){
			        $(".onOff_${tmp.num }").toggle();
			        tog=$(".check_${tmp.num}").is(":checked");
			        console.log("tog: "+tog);
				    $.ajax({
				      	url:"update_state.do",
				      	method:"post",
				      	data:{"state":tog,"num":"${tmp.num}"}, //data : 파라미터로 전달할 문자열 
				      	success:function(responseData){
					        
					     	}     
				      	})
				   	});
			</script>
		</c:forEach>
		
	</table>
	<a href="popup-insertform.do">공지사항 추가하기</a>
</div>
</body>
</html>