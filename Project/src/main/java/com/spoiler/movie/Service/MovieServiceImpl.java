package com.spoiler.movie.Service;

import java.io.IOException;
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
import com.spoiler.movie.Dto.MovieCommentDto;
import com.spoiler.movie.Dto.MovieDto;

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
		
		//크롤링 비즈니스 로직
		String url = "https://movie.naver.com/movie/running/current.nhn?order=reserve"; //크롤링할 url 지정
        Document doc = null; //Document 에는 페이지의 전체 소스가 저장된다  
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        /*
         * select 를 이용하여 원하는 태그를 선택한다. select 는 원하는 값을 가져오기 위한 중요한 기능이다.
         * ==>원하는 값들이 들어있는 덩어리를 가져온다.
         */
        Elements element  = doc.select(".lst_detail_t1 li");
        
		//Iterator을 사용하여 하나씩 값 가져오기
        Iterator<Element> title = element.select(".lst_dsc .tit a").iterator(); //제목
		Iterator<Element> ie = element.select(".star_t1 .num").iterator();//네티즌 평점

		while (title.hasNext()) {
			request.setAttribute("title", title.next().text());
			request.setAttribute("nPoint", ie.next().text());
		}
			
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
}
