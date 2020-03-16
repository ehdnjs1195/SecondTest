<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<style>
	.slide_left{
            list-style: none;
            text-decoration: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 150px;
            height: 100%;
        }
        .smenu{
            width: 200px;
            height: 100%;
            background: #3498db;
            text-align: center;
        }
        .slide_btn{
            display: block;
            padding: 16px 20px;
            background: #3498db;
            color: white;
            position: relative;
            font-size: 25px;
            font-weight: bold; 
        }
        .slide_btn a{
            text-decoration: none;
        }
        .smenu a{
            display: block;
            padding: 16px 26px;
            color: white;
            font-size: 14px;
            margin: 4px 0;
            position: relative;
        }
        .smenu a:before{
            content: "";
            position: relative;;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            transition: 0.3s;
            opacity: 0;
        }
         .smenu a:hover{
         background: #333;
         }
</style>
<div class="slide_left">
       <h1 style="font-family: fantasy; text-align: center; color: white;"><a href="home.do"><span style="font-family: fantasy;color: #3498db">S</span>POILER</a></h1>
       <div class="smenu">
			<a href="#" class="slide_btn"  >영화별 장르</a>
			<a href="genredetaillist.do?genre=드라마">드라마</a>
			<a href="genredetaillist.do?genre=액션">액션</a>
			<a href="genredetaillist.do?genre=범죄">범죄</a>
			<a href="genredetaillist.do?genre=멜로">멜로</a>
	</div>
</div>