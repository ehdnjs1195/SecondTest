<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTIFY</title>
<style>
	body{
		background-color: yellow;
	}
</style>
</head>
<body>
	<div class="container" style="text-align: center; position: relative;font-size: small;">
		<h1 >N O T I F Y</h1>
		<p>안녕하세요. SPOILER 입니다.</p>
		<p>웹 페이지 시스템 점검이 예정되어 있습니다.</p>
		<p>해당 작업 시간동안  페이지 사용이 불가 하오니 서비스 이용에 유의하시기 바랍니다.</p>
		<p>━━━━━━━━━ [작업 내용 및 시간] ━━━━━━━━━</p>
		<p>- 작업내용 : 페이지 시스템 점검</p>
		<p>- 작업일시 : 2020/04/06(월) AM 03:00 ~ AM 06:00 (3시간)</p>
		<p>- 작업영향 : 페이지 사용불가</p>
		<p>━━━━━━━━━━━━━━━━━━━━━━━━━</p>
		<p>예매서비스와 관련된 이용 문의는</p>
		<p>spioler@acorn.com로 알려주시면 친절히 안내해드리겠습니다.</p>
		<p>불편을 드려 죄송합니다. 감사합니다.</p>
	</div>
	<div style="position:absolute;clear:left; bottom: 5px;">
		<form action="nopopup.do"  method="post">
			<label>
				<input type="checkbox" name="isPopup" value="no" />	1시간 동안 팝업 띄우지 않기</label>
			<button type="submit">닫기</button>
		</form>
	</div>
	
</body>
</html>






