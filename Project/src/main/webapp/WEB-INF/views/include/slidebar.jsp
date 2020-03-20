<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<style>
   .slide_left{
            text-decoration: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 150px;
            height: 100%;
        }
        .smenu{
            width: 250px;
            height: 100%;
            background: #3498db;
            text-align: center;
            overflow: auto;
            margin-left: -40px;
        }
        
        .slide_btn a{
            text-decoration: none;
        }
        li{
        	list-style: none;
       		
        }
        ul.depth02{
        	display: none;
        	margin-left: -40px;	
        }
        .smenu a{
            display: block;
            padding: 16px 26px;
            color: white;
            font-size: 14px;
            margin: 4px 0;
            position: relative;
        }
        
        .slide_btn{
            display: block;
            padding: 16px 20px;
            background: #333;
            color : white;
            position: relative;
            font-size: 25px;
            font-weight: bold; 
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
	<div class="smenu">
		<h1 class="logo"style="font-family: fantasy; text-align: center; color: white;"><a href="home.do"><span style="font-family: fantasy;color: #3498db">S</span>POILER</a></h1>
		<ul class="depth01">
			<li><a href="#" class="slide_btn"  >영화별 장르</a></li>
			<li><a href="genredetaillist.do?genre=드라마" value="slide" name="1">드라마</a></li>
			<li><a href="genredetaillist.do?genre=범죄" value="slide" name="2">범죄</a></li>
			<li><a href="genredetaillist.do?genre=코메디" value="slide" name="3">코메디</a></li>
			<li><a href="genredetaillist.do?genre=어드벤처">어드벤처</a></li>
			<li><a href="genredetaillist.do?genre=판타지">판타지</a></li>
			<li><a href="genredetaillist.do?genre=공포">공포</a></li>
			<li><a href="genredetaillist.do?genre=스릴러">스릴러</a></li>
			<li><a href="genredetaillist.do?genre=SF">SF</a></li>
			<li><a href="genredetaillist.do?genre=미스터리">미스터리</a></li>
			<li><a href="genredetaillist.do?genre=뮤직">뮤직</a></li>
			<li><a href="genredetaillist.do?genre=뮤지컬">뮤지컬</a></li>
			<li><a href="#" class="slide_btn" >더보기</a>
			<ul class="depth02">
				<li><a href="genredetaillist.do?genre=멜로드라마">멜로드라마</a></li>
				<li><a href="genredetaillist.do?genre=전쟁">전쟁</a></li>
				<li><a href="genredetaillist.do?genre=멜로">멜로</a></li>
				<li><a href="genredetaillist.do?genre=로멘스">로멘스</a></li>
				<li><a href="genredetaillist.do?genre=전기">전기</a></li>
				<li><a href="genredetaillist.do?genre=사극">사극</a></li>
				<li><a href="genredetaillist.do?genre=시대극">시대극</a></li>
				<li><a href="genredetaillist.do?genre=갱스터">갱스터</a></li>
				<li><a href="genredetaillist.do?genre=모험">모험</a></li>
				<li><a href="genredetaillist.do?genre=애니메이션">애니메이션</a></li>
				<li><a href="genredetaillist.do?genre=가족">가족</a></li>
				<li><a href="genredetaillist.do?genre=느와르">느와르</a></li>
				<li><a href="genredetaillist.do?genre=역사">역사</a></li>
				<li><a href="genredetaillist.do?genre=스포츠">스포츠</a></li>
				<li><a href="genredetaillist.do?genre=서부">서부</a></li>
				<li><a href="genredetaillist.do?genre=지역">지역</a></li>
				<li><a href="genredetaillist.do?genre=문화">문화</a></li>
				<li><a href="genredetaillist.do?genre=사회">사회</a></li>
				<li><a href="genredetaillist.do?genre=인물">인물</a></li>
				<li><a href="genredetaillist.do?genre=자연ㆍ환경">자연ㆍ환경</a></li>
				<li><a href="genredetaillist.do?genre=인권">인권</a></li>
				<li><a href="genredetaillist.do?genre=계몽">계몽</a></li>
				<li><a href="genredetaillist.do?genre=에로">에로</a></li>
			</ul>
			</li>
		</ul>
	</div>
</div>
<script>
	$('ul.depth01>li').mouseup(function(){
	    $('ul.depth02').slideUp();
	        $(this).children('ul.depth02').toggle();
	    })
</script>






