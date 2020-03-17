package com.spoiler.movie;

import java.util.HashMap;
import java.util.Map;

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
//		service.movieList(request);
		
		return "home";
	}
	//글 자세히 보기 요청 처리
	@RequestMapping("/detail")
	public String detail(HttpServletRequest request){
		service.getDetail(request);
		//view page 로 forward 이동해서 글 자세히 보기 
		return "detail";
	}
	//댓글 저장 요청 처리
	@RequestMapping(value = "/comment_insert", method = RequestMethod.POST)
	public ModelAndView authCommentInsert(HttpServletRequest request, @RequestParam int ref_group) {
		service.saveComment(request);
		return new ModelAndView("redirect:/detail.do?num="+ref_group);
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
}
