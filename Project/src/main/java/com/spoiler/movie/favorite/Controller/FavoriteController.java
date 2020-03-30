package com.spoiler.movie.favorite.Controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Connection.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.favorite.Dto.FavoriteDto;
import com.spoiler.movie.favorite.Service.FavoriteService;

@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService service;
	
	
	
	@RequestMapping("favorite/insert.do")
	public String insert(@ModelAttribute FavoriteDto dto, HttpSession session) {
		String id=(String)session.getAttribute("id");
		
		dto.setId(id);
		service.favorite_insert(dto);
		return "${pageContext.request.contextPath}/detail.do?movieSeq=${dto.movieSeq}&movieId=${dto.movieId}";
	}
	
	@RequestMapping("favorite/delete.do")
	public String delete(@ModelAttribute FavoriteDto dto, HttpSession session) {
		String id=(String)session.getAttribute("id");
		
		dto.setId(id);
		service.delete(id);
		return "${pageContext.request.contextPath}/detail.do?movieSeq=${dto.movieSeq}&movieId=${dto.movieId}";
		
	}
	
	@RequestMapping("favorite/favoriteList.do")
    public ModelAndView favoriteList(HttpSession session, ModelAndView mav) {
        Map<String, Object> map=new HashMap<>();


        String id=(String)session.getAttribute("id");


        if(id!=null) { 
            //로그인한 상태이면 실행
            List<FavoriteDto> list=service.favoriteList(id);//장바구니 목록
           map.put("count", list.size()); //레코드 갯수

           //ModelAndView mav에 이동할 페이지의 이름과 데이터를 저장한다.

            mav.setViewName("favorite/favoriteList"); //이동할 페이지의 이름
            mav.addObject("map", map); //데이터 저장

            return mav; //화면 이동

        }else { //로그인하지 않은 상태

            return new ModelAndView("users/loginform.do", "", null);
            //로그인을 하지 않았으면 로그인 페이지로 이동시킨다.
        }
    }
	
}
