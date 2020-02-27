<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<c:forEach var="tmp" items="${list }">
<div class="carousel-inner">
	<div class="item active">
	    <div class="item">
			<div class="items" style="width: 25%; float: left; padding: 2px;">
			    <img id="${tmp.num}" src="images/${tmp.fileName }.jpg" style="width: 100%; height: 100%;"/>
			</div>
		</div>
    </div>
    <div class="modal fade" id="myModal${tmp.num }">
        <!-- modal-lg  | default | modal-sm -->
        <div class="modal-dialog">
            <div class="modal-content" style="width: 1000px; position: relative; left: 50%; transform:translateX(-50%);">
                <div class="modal-body" style="display: flex;">
                    <img src="images/${tmp.fileName }.jpg" id="${tmp.num }" style="width: 50%; height: auto; margin-right: 10px;">
                    <div class="imgBox">
                     <h2>${tmp.title }</h2>
                     <dl class="movie_info">
                         <dt>개봉</dt>
                         <dd>${tmp.releasDate }</dd>	                                                       
                         <dt>장르</dt>
                         <dd class="movie_genre">                                 
                                <p>${tmp.genre }</p>                                                               
                         </dd>	                                                     
                         <dt>감독</dt>
                         <dd class="movie_director">
                                <p>${tmp.director }</p>
                         </dd>	                            
                         <dt>출연</dt>
                         <dd class="movie_actor">
                                <p>${tmp.actor }</p>
                         </dd>
                 	</dl>
                  <h3>줄거리</h3>
                  <h4>${tmp.content }</h4>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <div>
                        <Strong style="float: left;">댓글</Strong>
                        <textarea name="" id="" cols="30" rows="10" style="margin: 0px; height: 74px; width: 973px;" placeholder="Comment"></textarea>
                    </div>
                    <hr>
                    <iframe width="968" height="725" src="${tmp.youtube }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>      
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>
<script>
        $("#${tmp.num}").click(function () {
            $("#myModal${tmp.num}").modal("show");
        });
    </script>
</c:forEach>
