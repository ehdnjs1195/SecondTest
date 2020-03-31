<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
	//쿠키 읽어오기
	Cookie[] cookies=request.getCookies();
	//팝업을 띄울수 있는지 여부 
	boolean canPopup=true;
	if(cookies != null){
		//반복문 돌면서 모든 쿠키를 참조해서 
		for(Cookie tmp:cookies){
			// "isPopup" 이라는 쿠키 이름으로 저장된 값이 있으면
			if(tmp.getName().equals("isPopup")){
				//팝업을 띄우지 않도록 표시한다.
				canPopup=false;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPOILER</title>
<style>
	.row{
    	margin-top: 100px;
	}
</style>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<!-- 공지사항 팝업 띄우기 -->
<%if(canPopup){ %>
	<script>
		window.open("notify.do","sale","width=700px,height=450px,top=100px,left=100px");
	</script>
<%} %>
<jsp:include page="include/navbar.jsp"></jsp:include>
<!-- 왼쪽 슬라이드 바?(sidebar 말고?) -->
<%-- <jsp:include page="include/slidebar.jsp"/> --%>
    <div class="container">
    	<!-- 서치바(임시) -->
    	<%-- <form action="searchlist.do" method="get">
			<label for="condition" style="display: none;">검색조건</label>
			<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요..." value="${keyword }" />
			<button type="submit" >검색</button>
		</form>
		--%>
		<div>
			<a class="btn btn-primary" href="updateMovie.do">영화 실시간 업데이트</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=드라마">드라마</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=범죄">범죄</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=코메디">코미디</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=어드벤처">어드벤처</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=판타지">판타지</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=공포">공포</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=스릴러">스릴러</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=SF">SF</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=뮤지컬">뮤지컬</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=멜로드라마">멜로드라마</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=멜로">멜로</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=로멘스">로멘스</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=전쟁">전쟁</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=전기">전기</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=사극">사극</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=시대극">시대극</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=갱스터">갱스터</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=모험">모험</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=애니메이션">애니메이션</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=가족">가족</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=느와르">느와르</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=역사">역사</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=스포츠">스포츠</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=서부">서부</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=지역">지역</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=문화">문화</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=사회">사회</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=인물">인물</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=자연ㆍ환경">자연ㆍ환경</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=인권">인권</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=계몽">계몽</a>
			<a class="btn btn-primary" href="genredetaillist.do?genre=에로">에로</a>
		</div>
    
    	<!-- 추천 TOP10 -->
        <h1 style="color: honeydew;">추천 TOP10</h1>
        <jsp:include page="include/bestlist.jsp"/>
    </div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>