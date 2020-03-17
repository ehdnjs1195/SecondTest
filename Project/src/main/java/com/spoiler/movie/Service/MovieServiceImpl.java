package com.spoiler.movie.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
				} else if (orderby.equals("repRlsDate")) {
					dto.setTitle(keyword);
					dto.setRepRlsDate("repRlsDate");
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
					dto.setRepRlsDate(orderby);
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
		dto.setMovieSeq(Integer.toString(num));
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
	
	public List<MovieDto> getList(String titleKey, String genreKey,int pageNum){
		List<MovieDto> list = new ArrayList<>();
		
		StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new"); /*URL*/ 

		try{
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=04YVG7XZ00W520AJ41N7"); /*Service Key*/ 
			if(titleKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("query","UTF-8") + "=" + URLEncoder.encode(titleKey, "UTF-8")); /*검색어*/ 
			}
			if(genreKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("genre","UTF-8") + "=" + URLDecoder.decode(genreKey, "UTF-8")); /*장르*/ 				
			}
			urlBuilder.append("&" + URLEncoder.encode("sort","UTF-8") + "=" + URLDecoder.decode("prodYear", "UTF-8")); /*개봉순으로 정렬*/ 	
			int startCount =1+(pageNum)*10;
			urlBuilder.append("&" + URLEncoder.encode("startCount","UTF-8") + "=" + URLDecoder.decode(Integer.toString(startCount), "UTF-8")); /*페이징처리*/ 				
			
			URL url = new URL(urlBuilder.toString()); 
			System.out.println(url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET"); 
			conn.setRequestProperty("Content-type", "application/json"); 
			System.out.println("Response code: " + conn.getResponseCode()); 
			BufferedReader rd; 
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) { 
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
			} else { 
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream())); 
			} 
			StringBuilder sb = new StringBuilder(); 
			String line; 
			while ((line = rd.readLine()) != null) { sb.append(line); } 
			rd.close(); 
			conn.disconnect(); 
	//		System.out.println(sb.toString()); 
			JSONParser p=new JSONParser();
			JSONObject obj=(JSONObject)p.parse(sb.toString());
			JSONArray dataArr=(JSONArray)obj.get("Data");
	//		System.out.println("dataArr :: " + dataArr);
			JSONObject obj2=(JSONObject)dataArr.get(0);
			JSONArray resultArr=(JSONArray)obj2.get("Result");
			System.out.println("resultArr :: "+resultArr);
			
			//obj3 => resultArr. 
			for(int i=0;i<resultArr.size();i++) {
				
				JSONObject obj3=(JSONObject)resultArr.get(i);
				//키값으로 하나씩 추출
				String movieSeq=(String)obj3.get("movieSeq");
				String title=(String)obj3.get("title");
				String titleEng=(String)obj3.get("titleEng");
				String genre=(String)obj3.get("genre");
				JSONArray dirArr=(JSONArray)obj3.get("director");
				JSONObject dir=(JSONObject)dirArr.get(0);
				String directorNm=(String)dir.get("directorNm");
				JSONArray actArr=(JSONArray)obj3.get("actor");
				String actorNm = "";
				for(int j = 0 ; j < actArr.size() ; j++) {
					JSONObject act=(JSONObject)actArr.get(j);
					if(j==actArr.size()-1) {
						actorNm += (String)act.get("actorNm");
						break;
					}
					actorNm += (String)act.get("actorNm")+", ";
				}
				String plot=(String)obj3.get("plot");
				String runtime=(String)obj3.get("runtime");
				String repRlsDate=(String)obj3.get("repRlsDate");
				String keywords=(String)obj3.get("keywords");
				String postersStr=(String)obj3.get("posters");
				String[] posts = postersStr.split("\\|");
				String posters = posts[0];
				String default_poster = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7HY8NY2QmoKgSW-f6BmH_q5Sh6UnZmGU1rXmSy7OqHD0lRMPq";
				if(posters.equals("")) {
					posters = default_poster;
				}
				//출력.
				System.out.println("movieSeq:: " + movieSeq);
				System.out.println("title:: " + title);
				System.out.println("titleEng:: " + titleEng);
				System.out.println("genre:: " + genre);
				System.out.println("director:: " + directorNm);
				System.out.println("actor:: " + actorNm);
				System.out.println("plot:: " + plot);
				System.out.println("runtime:: " + runtime);
				System.out.println("repRlsDate:: " + repRlsDate);
				System.out.println("keywords:: " + keywords);
				System.out.println("posters:: " + posters);
				System.out.println("=============================================================");
				//MovieDto 객체 생성
				//list에 담기
				MovieDto dto=new MovieDto(movieSeq, title, titleEng, genre, directorNm, actorNm, plot, runtime, repRlsDate, keywords,0, posters,null,0,0);
				list.add(dto);	
			}
		}catch(Exception e) {}
		return list;
	}
}
