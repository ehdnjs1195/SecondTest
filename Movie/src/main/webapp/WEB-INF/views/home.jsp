<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SPOILER</title>
<jsp:include page="include/resource.jsp"></jsp:include>
    <style>
        body {
            background-color: #2d3436;
        }

        .items {
            width: 25%;
            float: left;
            padding: 2px;
        }

        .items img {
            width: 100%;
            height: 100%;
        }

        .carousel-control {
            width: 5%;
        }
        .modal-dialog.modal-center {
            display: inline-block;
            text-align: left;
            vertical-align: middle; 
        }
    </style>
</head>

<body>
    <div class="container">
    	<!-- 추천 TOP8 -->
        <h1 style="color: honeydew;">추천 TOP8</h1>
        <jsp:include page="include/bestlist.jsp"/>
        
        <!-- 장르:드라마 -->
        <h1 style="color: honeydew;">드라마 영화</h1>
		<jsp:include page="include/genrelist.jsp"/>	
    </div>
	
	
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
        $("#showImg1").click(function () {
            $("#myModal").modal("show");
        });
        //모달이 완전히 보여 졌을때 실행할 함수 등록 
        $("#myModal").on("shown.bs.modal", function () { });
        //모달이 완전히 숨겨 졌을때 실행할 함수 등록 
        $("#myModal").on("hidden.bs.modal", function () { });
    </script>
</body>

</html>