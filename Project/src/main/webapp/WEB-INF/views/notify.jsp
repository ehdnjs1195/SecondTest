<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTIFY</title>
<jsp:include page="include/resource.jsp"/>
<style>
	body{
		background-color: #fad390;
	}
	
	
</style>
</head>
<body>
	<div class="container" style="text-align: center; position: relative;font-size: small;">
		<h1 >${popupDto.title }</h1>
		<div>${popupDto.content }</div>
	</div>
	<div style="position:relative; left:10px; bottom: 10px; padding-right:0; padding-top:10px;">
		<form action="nopopup.do"  method="post">
			
				<label class="checkbox-inline">
					<input  type="checkbox" name="isPopup" value="${popupDto.num }" />	1시간 동안 팝업 띄우지 않기
				</label>
			
			<button class="btn btn-success" type="submit">닫기</button>
		</form>
	</div>
	
</body>
</html>






