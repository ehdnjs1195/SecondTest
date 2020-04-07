package com.spoiler.movie.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.spoiler.movie.Service.RecommendService;

@Controller
public class MovieController {
	@Autowired
	private MovieService service;
	@Autowired
	private RecommendService recommendService;
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
	@RequestMapping("/map")
	public ModelAndView map(ModelAndView mView, HttpServletRequest request) {
		mView.setViewName("include/map");
		return mView;
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
	public ModelAndView popupList(ModelAndView mView, HttpServletRequest request) {
		adminService.getPopUp_list(request);
		mView.setViewName("master/popup-list");
		return mView;
	}

	@RequestMapping("/master/popup")
	public ModelAndView popup(ModelAndView mView, @RequestParam int num) {
		adminService.getPopUp(mView, num);
		mView.setViewName("/master/popup");
		return mView;
	}
	
	@RequestMapping("/master/popup-insertform")
	public String popupInsertForm() {
		return "master/popup-insertform";
	}
	
	@RequestMapping("/master/popup-insert")
	public ModelAndView popupInsert(ModelAndView mView, @ModelAttribute("dto") PopupDto dto) {
		adminService.addPopUp(dto);
		mView.setViewName("redirect:/master/popup-list.do");
		return mView;
	}
	@ResponseBody
	@RequestMapping("/master/update_state")
	public Map<String,Object> updateStatement(@ModelAttribute PopupDto dto, HttpServletRequest request, HttpServletResponse response) {
		adminService.updateState(dto, request, response);
		Map<String, Object> map = new HashMap<>();
		
		return map;
	}
	
	@RequestMapping("/master/delete")
	public String deletePopup(HttpServletRequest request) {
		adminService.deletePopup(request);
		return "redirect:/master/popup-list.do";
	}
	
	@RequestMapping("/master/popup-update")
	public String updatePopup(@ModelAttribute PopupDto dto) {
		adminService.updatePopup(dto);
		return "redirect:/master/popup.do?num="+dto.getNum();
	}

	@RequestMapping("/recommend")
	public ModelAndView authRecommend(@RequestParam int num, HttpServletRequest request) {
		int result=recommendService.recommendDataSelect(request);
		if(result==0) {
			recommendService.recommendDataDelete(request);
		}else {
			recommendService.recommendDataInsert(request);
		}
		return new ModelAndView("redirect:/home.do"); 
	}
}
