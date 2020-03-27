package com.spoiler.movie.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.Dto.MovieDto;
import com.spoiler.movie.Service.MovieAPIService;

@Controller
public class MovieController {
	@Autowired
	private MovieAPIService apiService;
	
	@RequestMapping("/searchlist")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		//파일목록과 페이징 처리에 필요한 값들을 request에 담아주는 서비스 메소드 호출하기
		String title = request.getParameter("title");
		List<MovieDto> list = apiService.getList(title, null, 0);
		mView.addObject("list", list);
		mView.setViewName("searchlist");
		return mView;
	}
	@RequestMapping("/genredetaillist")
	public ModelAndView list2(ModelAndView mView, HttpServletRequest request, @ModelAttribute MovieDto dto) {
		List<MovieDto> list = apiService.getList(dto.getTitle(), dto.getGenre(), dto.getStartRowNum());
		mView.addObject("list", list);
		mView.setViewName("genredetaillist");
		return mView;
	}
	
	@RequestMapping("/updateMovie")
	public String updateMovieList() {
		apiService.updateMovie();
		return "redirect:/home.do";
	}
	
	@RequestMapping("/notify")
	public ModelAndView popup(ModelAndView mView, HttpServletRequest request) {
		mView.setViewName("notify");
		return mView;
	}
	@RequestMapping("/nopopup")
	public ModelAndView nopopup(ModelAndView mView, HttpServletRequest request) {
		mView.setViewName("nopopup");
		return mView;
	}
	@RequestMapping("/more_list")
	public ModelAndView moreMovieList(@RequestParam int startCount, @RequestParam String genre, @RequestParam String title, ModelAndView mView) {
		List<MovieDto> list = apiService.moreMovieList(Integer.toString(startCount), genre, title);
		mView.addObject("list",list);
		mView.setViewName("more_list");
		return mView;
	}
}
