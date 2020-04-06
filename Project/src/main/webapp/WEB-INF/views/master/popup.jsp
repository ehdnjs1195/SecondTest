<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POPUP</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/toggle.css" />
<style>
	/* textarea의 크기가 SmartEditer의 크기가 된다. */
	#content{
		display: none;
		width: 100%;
		height: 400px;
	}
	body{
		color: #fff;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp"/>
<div class="container">
	<form action="popup-insert.do" method="post">
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" type="text" value="${id }" disabled />
			<input name="writer" type="hidden" value="${id }" />
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title" value="${PopDto.title }"/>
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10">${PopDto.content }</textarea>
		</div>
		<button class="btn btn-primary " type="submit" onclick="submitContents(this);">저장</button>
		<a class="btn btn-danger" href="#">취소</a>
		<a class="btn btn-warning" href="admin.do">돌아가기</a>
	</form>
	<label class="switch">
	    <input class="check" type="checkbox" <c:if test="${PopDto.state }">checked</c:if> >	
	    <span class="slider round"></span>
	</label>
	<p class="onOff">OFF</p>
	<p class="onOff" style="display:none;">ON</p> 
	
</div>
	<!-- ON/OFF -->
	<script>
	    var check = $(".check");
	    var tog;
	    check.click(function(){
	        $(".onOff").toggle();
	        tog=$(".check").is(":checked");
	        console.log("tog: "+tog);
		    $.ajax({
		      	url:"update_state.do",
		      	method:"post",
		      	data:{"state":tog,"writer":"${id}"}, //data : 파라미터로 전달할 문자열 
		      	success:function(responseData){
			        
			     	}     
		      	})
		   	});
	</script>

<!-- 스마트에디터 -->
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
</body>
</html>