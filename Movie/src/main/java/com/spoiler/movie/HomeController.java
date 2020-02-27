package com.spoiler.movie;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spoiler.movie.Service.MovieService;
@Controller
public class HomeController {
	@Autowired
	private MovieService service;
	
	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		service.movieList(request);

		return "home";
	}
	
}
