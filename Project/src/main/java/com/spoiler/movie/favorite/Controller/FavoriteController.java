package com.spoiler.movie.favorite.Controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ModelAndView insert(HttpServletRequest request, 
				ModelAndView mView) {
		//로그인된 아이디 읽어오기
		String id=(String)request.getSession().getAttribute("id");
		//FavoriteService 객체를 이용해서 영화정보를 ModelAndView 객체에 담기도록 한다.
		service.showInfo(id, mView);
		//view page 정보를 담고 
		mView.setViewName("users/info");
		return mView; //ModelAndView 객체를 리턴해주기 
	}
	
	@RequestMapping("favorite/delete.do")
	public String delete(@RequestParam FavoriteDto dto ) {
		service.deleteFavorite(dto);
		return "redirect:favorite/list.do";
		
	}
	
}
