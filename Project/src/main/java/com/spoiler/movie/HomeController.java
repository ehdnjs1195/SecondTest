package com.spoiler.movie;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.Dto.MovieCommentDto;
import com.spoiler.movie.Service.MovieService;
@Controller
public class HomeController {
	@Autowired
	private MovieService service;

	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		service.homeList(request);
		return "home";
	}
	//글 자세히 보기 요청 처리
	@RequestMapping("/detail")
	public ModelAndView detail(HttpServletRequest request, ModelAndView mView,@ModelAttribute MovieCommentDto dto){
		service.getDetail(request, dto);
		double ran=Math.random()*7+3;
		double point=Math.round(ran*10)/10.0;
		System.out.println(point);
		double point2 = point*10;
		Random random=new Random();
		mView.addObject("random", random.nextInt(1000)+2001);
		mView.addObject("random2", random.nextInt(710000));
		mView.addObject("point", point);
		mView.addObject("point2", point2);
		mView.setViewName("detail");
		return mView;
	}
	//댓글 저장 요청 처리
	@RequestMapping(value = "/comment_insert", method = RequestMethod.POST)
	public ModelAndView authCommentInsert(HttpServletRequest request, @RequestParam int ref_group, @RequestParam String movieId) {
		service.saveComment(request);
		return new ModelAndView("redirect:/detail.do?movieSeq="+ref_group+"&movieId="+movieId);
	}
	
	//댓글 삭제 요청 처리
	@ResponseBody
	@RequestMapping(value = "/comment_delete", method = RequestMethod.POST)
	public Map<String, Object> 
		authCommentDelete(HttpServletRequest request, @RequestParam int num){
		
		service.deleteComment(num);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map; // {"isSuccess":true} 형식의 JSON 문자열이 응답된다.
	}
	//댓글 수정 요청 처리(ajax)
	@ResponseBody
	@RequestMapping("/comment_update")
	public Map<String, Object> 
		authCommentUpdate(HttpServletRequest request, @ModelAttribute MovieCommentDto dto){
		
		service.updateComment(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}	
	
	//영화 랭킹 리스트
	@RequestMapping("/movie_Rank")
	public String rank_list(HttpServletRequest request) {
		service.getRankList(request);
		return "movie_Rank";
	}
	
	//영화 실시간 업데이트
	@RequestMapping("/master/updateRankMovie")
	public String rank_update(HttpServletRequest request) {
		service.updateRank(request);
		service.homeList(request);
		return "home";
	}
}
