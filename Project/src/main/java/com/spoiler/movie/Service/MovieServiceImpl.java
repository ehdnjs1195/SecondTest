package com.spoiler.movie.Service;

import java.io.BufferedReader;

import java.io.IOException;

import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;

import java.net.URLDecoder;
import java.net.URLEncoder;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spoiler.movie.Dao.MovieCommentDao;
import com.spoiler.movie.Dao.MovieDao;
import com.spoiler.movie.Dto.MovieCommentDto;
import com.spoiler.movie.Dto.MovieDto;
import com.spoiler.movie.Dto.RecommendDto;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao dao;
	@Autowired
	private MovieCommentDao commentDao;
	@Autowired
	private MovieAPIService apiService;

	@Override
	public void homeList(HttpServletRequest request) {
		List<MovieDto> list = dao.movieList();
		request.setAttribute("list", list);
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		// 파라미터로 전달되는 글번호
		String movieSeq = request.getParameter("movieSeq");
		String movieId = request.getParameter("movieId");
		// MovieDto 객체 생성 (select 할때 필요한 정보를 담기 위해)
		MovieDto dto = apiService.getMovieInfo(movieSeq, movieId);
		// request 에 글정보를 담고
		request.setAttribute("dto", dto);
		// 댓글 목록을 얻어와서 request 에 담아준다.
		List<MovieCommentDto> commentList = commentDao.getList(Integer.parseInt(movieSeq));
		request.setAttribute("commentList", commentList);
	}

	// 댓글 저장하는 메소드
	@Override
	public void saveComment(HttpServletRequest request) {
		// 댓글 작성자
		String writer = (String) request.getSession().getAttribute("id");
		// 댓글의 그룹번호
		int ref_group = Integer.parseInt(request.getParameter("ref_group"));
		// 댓글의 대상자 아이디
		String target_id = request.getParameter("target_id");
		// 댓글의 내용
		String content = request.getParameter("content");
		// 댓글 내에서의 그룹번호 (null 이면 원글의 댓글이다)
		String comment_group = request.getParameter("comment_group");
		// 저장할 댓글의 primary key 값이 필요하다
		int seq = commentDao.getSequence();
		// 댓글 정보를 Dto 에 담기
		MovieCommentDto dto = new MovieCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		if (comment_group == null) {// 원글의 댓글인 경우
			// 댓글의 글번호가 댓글의 그룹 번호가 된다.
			dto.setComment_group(seq);
		} else {// 댓글의 댓글인 경우
				// comment_group 번호가 댓글의 그룹번호가 된다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		// 댓글 정보를 DB 에 저장한다.
		commentDao.insert(dto);
	}

	@Override
	public void deleteComment(int num) {
		commentDao.delete(num);
	}

	@Override
	public void updateComment(MovieCommentDto dto) {
		commentDao.update(dto);

	}

	@Override
	public void plusCnt(int num,HttpServletRequest request) {
	
		commentDao.updateCnt(num);		
		
	}
}
