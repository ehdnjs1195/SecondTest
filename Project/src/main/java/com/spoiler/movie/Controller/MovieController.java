package com.spoiler.movie.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.Dto.MovieDto;
import com.spoiler.movie.Dto.PopupDto;
import com.spoiler.movie.Service.AdminService;
import com.spoiler.movie.Service.MovieAPIService;
import com.spoiler.movie.Service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService service;
	@Autowired
	private MovieAPIService apiService;
	@Autowired
	private AdminService adminService;
	
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
	
	@RequestMapping("/notify")
	public ModelAndView popup(ModelAndView mView, HttpServletRequest request) {
		adminService.popUp(request);
		mView.setViewName("notify");
		return mView;
	}
	@RequestMapping("/nopopup")
	public ModelAndView nopopup(ModelAndView mView, HttpServletRequest request, HttpServletResponse response) {
		adminService.noPopUp(request, response);
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
	
	@RequestMapping("/master/popup-list")
	public ModelAndView popupList(ModelAndView mView) {
		adminService.getPopUPList(mView);
		mView.setViewName("master/popup-list");
		return mView;
	}
	
	@RequestMapping("/master/popup-insertform")
	public String popupInsertForm() {
		return "master/popup-insertform";
	}
	
	@RequestMapping("/master/popup-insert")
	public ModelAndView popupInsert(ModelAndView mView, @ModelAttribute("dto") PopupDto dto) {
		System.out.println(dto.getWriter()+dto.getTitle()+dto.getState());
		adminService.addPopUp(dto);
		
		mView.setViewName("redirect:/master/popup-list.do");
		return mView;
	}
	@ResponseBody
	@RequestMapping("/master/update_state")
	public Map<String,Object> updateStatement(@ModelAttribute PopupDto dto, HttpServletRequest request) {
		adminService.updateState(dto, request);
		Map<String, Object> map = new HashMap<>();
		
		return map;
	}
}
