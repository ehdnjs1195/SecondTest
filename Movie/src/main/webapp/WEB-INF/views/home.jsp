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
        <h1 style="color: honeydew;">MOVIE 차트</h1>
        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
            <!-- Carousel 하단의 동그란 nav 요소  -->
            <ol class="carousel-indicators">
                <!-- data-target="Carousel 전체의 선택자" 
         data-slide-to="컨텐츠 인덱스" -->
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
            </ol>

            <div class="carousel-inner">
                <div class="item active">
                    <div class="item">
                        <jsp:include page="include/movielist.jsp"/>
                    </div>
                </div>
                <!-- <div class="item">
                    <div class="items">
                        <img src="images/test5.jpg" />

                    </div>
                    <div class="items">
                        <img src="images/test6.jpg" />

                    </div>
                    <div class="items">
                        <img src="images/test7.jpg" />

                    </div>
                    <div class="items">
                        <img src="images/test8.jpg" />

                    </div>
                </div> -->
            </div>
            <div class="modal fade" id="myModal">
                <!-- modal-lg  | default | modal-sm -->
                <div class="modal-dialog">
                    <div class="modal-content" style="width: 1000px; position: relative; left: 50%; transform:translateX(-50%);">
                        <div class="modal-body" style="display: flex;">
                            <img src="images/test1.jpg" style="width: 50%; height: auto; margin-right: 10px;">
                            <div class="imgBox">
                            <h2>지푸라기라도 잡고 싶은 짐승들</h2>
                            <dl class="movie_info">
                                 
                                <dt>개봉</dt>
                                <dd>2019.02.27</dd>
                            
                            
                                <dt>장르</dt>
                                <dd class="movie_genre">
                                    
                                        <a href="/movie/sdb/browsing/bmovie.nhn?genre=5" class="info_genre" onclick="clickcr(this,'rer.genre','','',event);">멜로/로맨스</a>
                                    
                                        <a href="/movie/sdb/browsing/bmovie.nhn?genre=11" class="info_genre" onclick="clickcr(this,'rer.genre','','',event);">코미디</a>
                                    
                                </dd>
                            
                            
                                <dt>감독</dt>
                                <dd class="movie_director">
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=76010" onclick="clickcr(this,'rer.director','','',event);">박호찬</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=409117" onclick="clickcr(this,'rer.director','','',event);">박수진</a>
                                    
                                </dd>
                            
                            
                                <dt>출연</dt>
                                <dd class="movie_actor">
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=77449" onclick="clickcr(this,'rer.actor','','',event);">김동욱,</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=217884" onclick="clickcr(this,'rer.actor','','',event);">고성희,</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=55302" onclick="clickcr(this,'rer.actor','','',event);">황보라,</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=1747" onclick="clickcr(this,'rer.actor','','',event);">김의성,</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=8035" onclick="clickcr(this,'rer.actor','','',event);">임예진,</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=7681" onclick="clickcr(this,'rer.actor','','',event);">염정아,</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=81252" onclick="clickcr(this,'rer.actor','','',event);">한수현,</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=389039" onclick="clickcr(this,'rer.actor','','',event);">최고,</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=66416" onclick="clickcr(this,'rer.actor','','',event);">이채은,</a>
                                    
                                        <a href="/movie/bi/pi/basic.nhn?code=155696" onclick="clickcr(this,'rer.actor','','',event);">조우진</a>
                                    
                                </dd>
                            
                        </dl>
                                <h3>줄거리</h3>
                                <h4>[모든 것은 돈 가방과 함께 시작되었다.]</h4>
                            </br>
                                사라진 애인 때문에 사채 빚에 시달리며 한 탕을 꿈꾸는 태영.
                            </br>
                                아르바이트로 가족의 생계를 이어가는 가장 중만.
                            </br>
                                과거를 지우고 새 인생을 살기 위해 남의 것을 탐하는 연희.
                            </br>    
                                벼랑 끝에 몰린 그들 앞에 거액의 돈 가방이 나타나고,
                            </br>
                                마지막 기회라 믿으며 돈 가방을 쫓는 그들에게 예기치 못한 사건들이 발생한다.
                            </br>    
                                <h4>[“큰돈 들어왔을 땐 아무도 믿음 안돼”]</h4>
                            </br>    
                                고리대금업자 박사장, 빚 때문에 가정이 무너진 미란, 불법체류자 진태,
                            </br>
                                가족의 생계가 먼저인 영선, 기억을 잃은 순자까지...
                            </br>    
                                절박한 상황 속 서로 속고 속이며 돈 가방을 쫓는 그들은
                            </br>
                                인생을 바꿀 수 있는 마지막 한탕을 계획한다.
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div>
                                <Strong style="float: left;">댓글</Strong>
                                <textarea name="" id="" cols="30" rows="10" style="margin: 0px; height: 74px; width: 973px;" placeholder="Comment"></textarea>
                            </div>
                            <hr>
                            <iframe width="968" height="725" src="https://www.youtube.com/embed/cTEpElvjdvg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!-- 이전, 다음 control UI -->
            <a href="#myCarousel" class="left carousel-control" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">이전</span>
            </a>
            <a href="#myCarousel" class="right carousel-control" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">다음</span>
            </a>
        </div>
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