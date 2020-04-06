package com.spoiler.movie.favorite.Controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.favorite.Dto.FavoriteDto;
import com.spoiler.movie.favorite.Service.FavoriteService;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteService service;

	@ResponseBody
	@RequestMapping(value = "/favorite_insert.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String authInsert(HttpServletRequest request, @ModelAttribute FavoriteDto dto)
			throws Exception {
		service.insert(request);
		return dto.getTitle();
	}

	@ResponseBody
	@RequestMapping(value = "/favorite_delete.do", method = RequestMethod.POST)
	public void authDelete(@ModelAttribute FavoriteDto dto, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		String movieSeq=(String) request.getAttribute("movieSeq");
		dto.setId(id);
		dto.setMovieSeq(movieSeq);
		service.delete(request);
		

	}

	@ResponseBody 
	@RequestMapping(value = "/favorite_list.do", method = RequestMethod.POST)
	public Map<String,Object> isExistMovie(@ModelAttribute FavoriteDto dto, HttpSession session, HttpServletRequest request) throws Exception {
		String id = (String) session.getAttribute("id");
		
		dto.setId(id);

		System.out.println(dto.getMovieSeq()+" | "+dto.getMovieId());
		Map<String,Object> map=service.isExistMovie(dto);
		map.put("title", dto.getTitle());
		System.out.println(map.get("result"));
		
		return map;

	}
	@ResponseBody 
	@RequestMapping(value = "/favorite_list2.do", method = RequestMethod.POST)
	public Map<String,Object> checkMovie(@ModelAttribute FavoriteDto dto, HttpSession session, HttpServletRequest request) throws Exception {
		String id = (String) session.getAttribute("id");
		
		dto.setId(id);

		System.out.println(dto.getMovieSeq()+" | "+dto.getMovieId());
		Map<String,Object> map=service.checkMovie(dto);
		map.put("title", dto.getTitle());
		System.out.println(map.get("result"));
		
		return map;

	}
}
