<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<style>
        *{
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            list-style: none;
            text-decoration: none;
        }
        .left{
            position: fixed;
            top: 0;
            width: 200px;
            height: 100%;
            margin-left:-300px;
           
			
        }
        .menu{
            width: 300px;
            height: 100%;
            background: #3498db;
            overflow: hidden;
        }
        .item{
            border-top: 1px solid #2980b9;
            overflow: hidden;
            list-style-type: none;
        }
        .btn{
            display: block;
            padding: 16px 20px;
            background: #3498db;
            color: white;
            position: relative;
        }
        .btn:before{
            content: "";
            position: absolute;
            width: 14px;
            height: 14px;
            background: #3498db;
            left: 20px;
            bottom: -7px;
            transform: rotate(45deg);
        }

        .btn i{
            margin-right: 10px;
        }
        .smenu{
            background: #333;
            overflow: hidden;
            transition: max-height 0.3s;
            max-height: 0;
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
            position:absolute;
            width: 6px;
            height: 100%;
            background: #3498db;
            left: 0;
            top: 0;
            transition: 0.3s;
            opacity: 0;
        }
        .smenu a:hover:before{
            opacity: 1;
        }
        .item:target .smenu{
            max-height: 10em;
        }
        sp
    </style>

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