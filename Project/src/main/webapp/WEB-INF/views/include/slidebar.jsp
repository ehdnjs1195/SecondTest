<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

<div class="left">
        <p style="font-family: fantasy;text-align: center;font-size: 50px; text-decoration: ;" ><span style="font-family: fantasy; color: #0F4C81">S</span>POILER</p>
        <div class="menu">
            <li class="item" id="profile"> 
                <a href="#profile" class="btn"><i class="far fa-user"></i>영화</a>
                <div class="smenu">
                    <a href="genredetaillist.do?genre=드라마">드라마</a>
                    <a href="genredetaillist.do?genre=액션">액션</a>
                    <a href="genredetaillist.do?genre=범죄">범죄</a>
                    <a href="genredetaillist.do?genre=멜로">멜로</a>
                    
                </div>
            </li>
            <li class="item" id="messages">
                <a href="#messages" class="btn"><i class="far fa-envelope"></i>두번째</a>
                <div class="smenu">
                    <a href="#">new</a>
                    <a href="#">new</a>
                    <a href="#">sent</a>
                </div>
            </li>
            <li class="item" id="settings">
                <a href="#settings" class="btn"><i class="fas fa-cog"></i>세번째</a>
                <div class="smenu">
                    <a href="#">Password</a>
                    <a href="#">new</a>
                    <a href="#">Language</a>
                </div>
            </li>
        </div>
    </div>