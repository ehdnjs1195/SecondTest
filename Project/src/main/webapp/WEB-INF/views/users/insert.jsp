<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/insert.jsp</title>
<jsp:include page="../include/resource.jsp"/>
</head>
<body>

<script type="text/javascript">


     alert("${dto.id}님 회원가입이 완료되었습니다.")
      	window.location.href="${pageContext.request.contextPath }/home.do";
     </script>
</body>
</html>






