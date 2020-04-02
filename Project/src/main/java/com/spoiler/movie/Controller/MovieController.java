package com.spoiler.movie.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.Dto.MovieDto;
import com.spoiler.movie.Dto.RecommendDto;
import com.spoiler.movie.Service.MovieAPIService;
import com.spoiler.movie.Service.MovieService;
import com.spoiler.movie.Service.RecommendService;

@Controller
public class MovieController {
	@Autowired
	private MovieService service;
	@Autowired
	private RecommendService recommendService;
	@Autowired
	private MovieAPIService apiService;
	
	@RequestMapping("/searchlist")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		//파일목록과 페이징 처리에 필요한 값들을 request에 담아주는 서비스 메소드 호출하기
		String title = request.getParameter("title");
		
		List<MovieDto> list = apiService.getList(title, null,null, 0);
		mView.addObject("list", list);
		mView.setViewName("searchlist");
		return mView;
	}
	@RequestMapping("/genredetaillist")
	public ModelAndView list2(ModelAndView mView, HttpServletRequest request, @ModelAttribute MovieDto dto) {
		List<MovieDto> list = apiService.getList(dto.getTitle(), dto.getGenre(), dto.getNation(), dto.getStartRowNum());
		mView.addObject("list", list);
		mView.setViewName("genredetaillist");
		return mView;
	}
	
	@RequestMapping("/updateMovie")
	public String updateMovieList() {
		apiService.updateMovie();
		return "redirect:/home.do";
	}
	@RequestMapping("/map")
	public ModelAndView map(ModelAndView mView, HttpServletRequest request) {
		mView.setViewName("include/map");
		return mView;
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
	public ModelAndView moreMovieList(@RequestParam int startCount, @RequestParam String genre, @RequestParam String title, @RequestParam String nation, ModelAndView mView) {
		List<MovieDto> list = apiService.moreMovieList(Integer.toString(startCount), genre, title,nation);
		mView.addObject("list",list);
		mView.setViewName("more_list");
		return mView;
	}
	@RequestMapping("/recommend")
	public ModelAndView authRecommend(@RequestParam int num, HttpServletRequest request) {
		service.plusCnt(num,request);
		recommendService.recommendDataInsert(request);
		return new ModelAndView("redirect:/home.do"); 
	}
	
}
