package com.spoiler.movie.favorite.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping(value = "/favorite/delete", method = RequestMethod.POST)
	public ModelAndView authDelete(
			@ModelAttribute FavoriteDto dto,
			HttpSession session) {
		String id = (String) session.getAttribute("id");

		dto.setId(id);
		service.delete(id);

		return new ModelAndView(
				"redirect:/${pageContext.request.contextPath}/detail.do?movieSeq=${dto.movieSeq}&movieId=${dto.movieId}");

	}

	@ResponseBody 
	@RequestMapping(value = "/favorite_list.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String favoriteList(HttpServletRequest request, @ModelAttribute FavoriteDto dto) throws Exception {
		
		service.favoriteList(request);
		
		return dto.getMovieSeq();

	}
}
