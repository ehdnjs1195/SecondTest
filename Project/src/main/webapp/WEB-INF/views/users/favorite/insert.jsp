<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/favorite_update</title>
<jsp:include page="${pageContext.request.contextPath }/include/resource.jsp"/>
</head>
<body>
<div class="container">

	
			
		
     <script type="text/javascript">
     alert("${dto.movieId}를 관심목록에 추가하였습니다.")
      	location.href="${url}";
     </script>
	
</div>

			
		
	
</body>

</html>







