package com.spoiler.movie.Service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spoiler.movie.Dao.MovieCommentDao;
import com.spoiler.movie.Dao.MovieDao;
import com.spoiler.movie.Dao.MovieRankDao;
import com.spoiler.movie.Dto.MovieCommentDto;
import com.spoiler.movie.Dto.MovieDto;
import com.spoiler.movie.Dto.MovieRankDto;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao dao;
	@Autowired
	private MovieCommentDao commentDao;
	@Autowired
	private MovieAPIService apiService;
	@Autowired
	private MovieRankDao rankDao;
	
	//한 페이지에 나타낼 row 의 갯수 
	static final int PAGE_ROW_COUNT=20;
	//하단 디스플레이 페이지 갯수 
	static final int PAGE_DISPLAY_COUNT=30; // 페이지 하단에 
	
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
		String rank = request.getParameter("rank");
		request.setAttribute("rank", rank);
		// MovieDto 객체 생성 (select 할때 필요한 정보를 담기 위해)
		MovieDto dto = apiService.getMovieInfo(movieSeq, movieId);
		// request 에 글정보를 담고
		request.setAttribute("dto", dto);
		MovieRankDto rDto=rankDao.getInfo(dto.getTitle());
		request.setAttribute("rDto", rDto);
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
		commentDao.upCnt(num);	
	}

	@Override
	public void minusCnt(int num, HttpServletRequest request) {
		commentDao.downCnt(num);		
	}

	//영화 랭킹 리스트
	@Override
	public void getRankList(HttpServletRequest request) {
		MovieRankDto dto=new MovieRankDto();
		/* 페이징 처리 */
		//보여줄 페이지의 번호
		int pageNum=1; // pageNum=현재 페이지 번호
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT; // PAGE_ROW_COUNT가 공차
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=rankDao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}		
		// MovieRankDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//1. DB 에서 글 목록을 얻어온다. (글목록을 얻어오는 DAO를 만든다.)
		List<MovieRankDto> list=rankDao.movieRankList(dto);
		//2. view page 에 필요한 값을 request 에 담아둔다.(forward 이동)
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);		
		request.setAttribute("list", list);
		//전체 글의 갯수도 담기
		request.setAttribute("totalRow", totalRow);
	}

	@Override
	public void updateRank(HttpServletRequest request) {
		rankDao.deleteRank();
		MovieRankDto dto = new MovieRankDto();
		try{
			String URL="https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=pnt";
			String dateParam="&date=";
			
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");	
			Date time = new Date();
			String time1 = format1.format(time);

			Document doc=Jsoup.connect(URL+dateParam+time1).get();
			Elements elements=doc.select("tbody tr");
			Iterator<Element> titles = elements.select("td.title a").iterator();
			Iterator<Element> points = elements.select("td.point").iterator();
			Iterator<Element> links = elements.select(".tit5 a").iterator();
			int count=0;
				while (titles.hasNext()) {
					count = count+1;
					dto.setRank(count);
					dto.setTitle(titles.next().text());
					dto.setStarPoint(Float.parseFloat(points.next().text()));
					dto.setLink("https://movie.naver.com/"+links.next().attr("href"));
					rankDao.updateRank(dto);
				}
		}catch(Exception e){
			System.out.println("크롤링 실패 : "+e);
		}
		
		// 네이버 영화 평점
		try{
			String URL="https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=pnt";
			String dateParam="&date=";
			
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");	
			Date time = new Date();
			String time1 = format1.format(time);
			
			String pageParam="&page=";
			int PAGE=2;
			for(PAGE=2; PAGE<=40; PAGE++){
				Document doc=Jsoup.connect(URL+dateParam+time1+pageParam+PAGE).get();
				Elements elements=doc.select("tbody tr");
				Iterator<Element> rankings = elements.select("td.order").iterator();
				Iterator<Element> titles = elements.select("td.title a").iterator();
				Iterator<Element> points = elements.select("td.point").iterator();
				Iterator<Element> links = elements.select(".tit5 a").iterator();

				while (titles.hasNext()) {
					dto.setRank(Integer.parseInt(rankings.next().text()));
					dto.setTitle(titles.next().text());
					dto.setStarPoint(Float.parseFloat(points.next().text()));
					dto.setLink("https://movie.naver.com/"+links.next().attr("href"));
					rankDao.updateRank(dto);
				}
				
			}//for end
		}catch(Exception e){
			System.out.println("크롤링 실패 : "+e);
		}//try end
	}
	
}
