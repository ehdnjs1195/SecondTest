package com.spoiler.movie.Service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spoiler.movie.Dao.MovieCommentDao;
import com.spoiler.movie.Dao.MovieDao;
import com.spoiler.movie.Dto.MovieCommentDto;
import com.spoiler.movie.Dto.MovieDto;

@Service
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieDao dao;
	@Autowired
	private MovieCommentDao commentDao;
	
	@Override
	public void movieList(HttpServletRequest request) {
		// 검색과 관련된 파라미터를 읽어와 본다.
		String keyword = request.getParameter("keyword");
		String orderby = request.getParameter("orderby");
		String genre = request.getParameter("genre");

		// 검색 키워드가 존재한다면 키워드를 담을 CafeDto 객체 생성
		MovieDto dto = new MovieDto();
		if (keyword != null) {// 검색 리스트에서 > 검색 키워드가 전달된 경우
			if (orderby != null) {
				if (orderby.equals("title")) {
					dto.setTitle(keyword);
				} else if (orderby.equals("releaseDate")) {
					dto.setTitle(keyword);
					dto.setReleaseDate("releaseDate");
				} else if (orderby.equals("starPoint")) {
					dto.setTitle(keyword);
					dto.setStarPoint(1);
				} else {
					dto.setTitle(keyword);
				}
				String encodedKeyword = null;
				try {
					encodedKeyword = URLEncoder.encode(keyword, "utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				// 키워드와 검색조건을 request 에 담는다.
				request.setAttribute("encodedKeyword", encodedKeyword);
			} else {
				dto.setTitle(keyword);
			}
			request.setAttribute("keyword", keyword);
			request.setAttribute("orderby", orderby);
			if (orderby == "") {
				orderby = null;
			}
			if (genre == "") {
				genre = null;
			}
		}

		if (genre != null) {// 장르 리스트에서 > 정렬 키워드가 전달된 경우
			if (orderby != null) {
				if (orderby.equals("title")) {
					dto.setTitle(orderby);
					dto.setGenre(genre);
				} else if (orderby.equals("releaseDate")) {
					dto.setReleaseDate(orderby);
					dto.setGenre(genre);
				} else if (orderby.equals("starPoint")) {
					dto.setStarPoint(1);
					dto.setGenre(genre);
				} else {
					dto.setGenre(genre);
				}
				String encodedKeyword2 = null;
				try {
					encodedKeyword2 = URLEncoder.encode(orderby, "utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				// 키워드와 검색조건을 request 에 담는다.
				request.setAttribute("encodedKeyword2", encodedKeyword2);
			} else {
				dto.setGenre(genre);
			}
			request.setAttribute("orderby", orderby);
			request.setAttribute("genre", genre);
		}
		// 한 페이지에 나타낼 row 의 갯수
		final int PAGE_ROW_COUNT = 3;
		// 하단 디스플레이 페이지 갯수
		final int PAGE_DISPLAY_COUNT = 3;

		// 보여줄 페이지의 번호
		int pageNum = 1;
		// 보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		if (strPageNum != null) {// 페이지 번호가 파라미터로 넘어온다면
			// 페이지 번호를 설정한다.
			pageNum = Integer.parseInt(strPageNum);
		}
		// 보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		// 보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum = pageNum * PAGE_ROW_COUNT;

		// 전체 row 의 갯수를 읽어온다.
		int totalRow = dao.getCount(dto);
		// 전체 페이지의 갯수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
		// 시작 페이지 번호
		int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		// 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		// 끝 페이지 번호가 잘못된 값이라면
		if (totalPageCount < endPageNum) {
			endPageNum = totalPageCount; // 보정해준다.
		}
		// FileDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		// 1. DB 에서 파일 목록을 얻어온다.
		List<MovieDto> list = dao.getList(dto);
		// 2. view page에 할요한 값을 request에 담아준다
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);
	}
	@Override
	public void getDetail(HttpServletRequest request) {
		//파라미터로 전달되는 글번호
		int num=Integer.parseInt(request.getParameter("num"));
		//MovieDto 객체 생성 (select 할때 필요한 정보를 담기 위해)
		MovieDto dto=new MovieDto();				
		//MovieDto 에 글번호도 담기
		dto.setNum(num);
		//글 정보를 얻어와서
		MovieDto dto2=dao.getData(num);
		//request 에 글정보를 담고 
		request.setAttribute("dto", dto2);
		//댓글 목록을 얻어와서 request 에 담아준다.
		List<MovieCommentDto> commentList=commentDao.getList(num);
		request.setAttribute("commentList", commentList);
	}
	//댓글 저장하는 메소드 
	@Override
	public void saveComment(HttpServletRequest request) {
		//댓글 작성자
		String writer=(String)request.getSession().getAttribute("id");
		//댓글의 그룹번호
		int ref_group=
			Integer.parseInt(request.getParameter("ref_group"));
		//댓글의 대상자 아이디
		String target_id=request.getParameter("target_id");
		//댓글의 내용
		String content=request.getParameter("content");
		//댓글 내에서의 그룹번호 (null 이면 원글의 댓글이다)
		String comment_group=request.getParameter("comment_group");
		//저장할 댓글의 primary key 값이 필요하다
		int seq = commentDao.getSequence();
		//댓글 정보를 Dto 에 담기
		MovieCommentDto dto=new MovieCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		if(comment_group==null) {//원글의 댓글인 경우
			//댓글의 글번호가 댓글의 그룹 번호가 된다.
			dto.setComment_group(seq);
		}else {//댓글의 댓글인 경우
			//comment_group 번호가 댓글의 그룹번호가 된다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		//댓글 정보를 DB 에 저장한다.
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
}
