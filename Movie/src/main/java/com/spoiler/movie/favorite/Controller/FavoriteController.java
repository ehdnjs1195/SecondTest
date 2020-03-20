package com.spoiler.movie.favorite.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.print.attribute.HashAttributeSet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.users.Service.UsersService;

@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService service;
	
	//1. 좋아하는 영화 목록에 추가하기 
	@RequestMapping("/users/favorite/insert")
	public String insert(@ModelAttribute FavoriteMo fv, HttpSession session) {
		String userId=(String)session.getAttribute("userId");
		return "users/favorite/insert";
	}
	
	@RequestMapping("/users/favorite/delete.do")
	public String delete(@RequestParam int movieSeq) {
		FavoriteService.delete(movieSeq);
		return "redirect:/users/favorte/list.do";
		
	}
	
	@RequestMapping("/users/favorite/list.do")
	public ModelAndView list(HttpSession session, ModelAndView mv) {
	String userId=(String) session.getAttribute("userId");
		Map<String,Object> map=new HashMap<String, Object>();
		List<fv> list=service.list
	}
	
}
