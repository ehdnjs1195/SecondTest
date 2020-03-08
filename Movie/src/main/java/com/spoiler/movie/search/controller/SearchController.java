package com.spoiler.movie.search.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spoiler.movie.search.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;
	
	@RequestMapping("/searchlist")
	public String searchMovie(HttpServletRequest request, @RequestParam String keyword) {
		service.getSearch(request, keyword);
		
		return "searchlist";
	}
}
