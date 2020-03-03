package com.spoiler.movie.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.Service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService service;
	
	@RequestMapping("/searchlist")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		//파일목록과 페이징 처리에 필요한 값들을 request에 담아주는 서비스 메소드 호출하기
		service.movieList(request);
	
		mView.setViewName("searchlist");
		return mView;
	}
	@RequestMapping("/genredetail")
	public ModelAndView list2(ModelAndView mView, HttpServletRequest request) {
		//파일목록과 페이징 처리에 필요한 값들을 request에 담아주는 서비스 메소드 호출하기
		service.movieList(request);
	
		mView.setViewName("genredetail");
		return mView;
	}
}
