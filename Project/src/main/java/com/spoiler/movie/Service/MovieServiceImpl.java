package com.spoiler.movie.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao dao;
	@Autowired
	private MovieCommentDao commentDao;

	@Override
	public void homeList(HttpServletRequest request) {
		List<MovieDto> list = dao.movieList();
		request.setAttribute("list", list);
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		// 파라미터로 전달되는 글번호
		int num = Integer.parseInt(request.getParameter("num"));
		// MovieDto 객체 생성 (select 할때 필요한 정보를 담기 위해)
		MovieDto dto = new MovieDto();
		// MovieDto 에 글번호도 담기
		dto.setMovieSeq(Integer.toString(num));
		// 글 정보를 얻어와서
		MovieDto dto2 = dao.getData(num);
		// request 에 글정보를 담고
		request.setAttribute("dto", dto2);
		// 댓글 목록을 얻어와서 request 에 담아준다.
		List<MovieCommentDto> commentList = commentDao.getList(num);
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

	public List<MovieDto> getList(String titleKey, String genreKey, int pageNum) {
		List<MovieDto> list = new ArrayList<>();

		StringBuilder urlBuilder = new StringBuilder(
				"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new"); /*
																													 * URL
																													 */

		try {
			urlBuilder
					.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=04YVG7XZ00W520AJ41N7"); /* Service Key */
			if (titleKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("title", "UTF-8") + "="
						+ URLEncoder.encode(titleKey, "UTF-8")); /* 검색어 */
			}
			if (genreKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("genre", "UTF-8") + "="
						+ URLEncoder.encode(genreKey, "UTF-8")); /* 장르 */
			}
			urlBuilder.append("&" + URLEncoder.encode("sort", "UTF-8") + "="
					+ URLEncoder.encode("prodYear", "UTF-8")); /* 개봉순으로 정렬 */
			int startCount = 1 + (pageNum) * 10;
//			urlBuilder.append("&" + URLEncoder.encode("startCount","UTF-8") + "=" + URLEncoder.encode(Integer.toString(startCount), "UTF-8")); /*페이징처리*/ 				

			URL url = new URL(urlBuilder.toString());
			System.out.println(url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			// System.out.println(sb.toString());
			JSONParser p = new JSONParser();
			JSONObject obj = (JSONObject) p.parse(sb.toString());
			JSONArray dataArr = (JSONArray) obj.get("Data");
			// System.out.println("dataArr :: " + dataArr);
			JSONObject obj2 = (JSONObject) dataArr.get(0);
			JSONArray resultArr = (JSONArray) obj2.get("Result");
			System.out.println("resultArr :: " + resultArr);

			// obj3 => resultArr.
			for (int i = 0; i < resultArr.size(); i++) {

				JSONObject obj3 = (JSONObject) resultArr.get(i);
				// 키값으로 하나씩 추출
				String movieSeq = (String) obj3.get("movieSeq");
				String title = (String) obj3.get("title");
				title = title.replaceAll("!HS ", "");
				title = title.replaceAll("!HE ", "");
				String titleEng = (String) obj3.get("titleEng");
				String genre = (String) obj3.get("genre");
				JSONArray dirArr = (JSONArray) obj3.get("director");
				JSONObject dir = (JSONObject) dirArr.get(0);
				String directorNm = (String) dir.get("directorNm");
				JSONArray actArr = (JSONArray) obj3.get("actor");
				String actorNm = "";
				for (int j = 0; j < actArr.size(); j++) {
					JSONObject act = (JSONObject) actArr.get(j);
					if (j == actArr.size() - 1) {
						actorNm += (String) act.get("actorNm");
						break;
					}
					actorNm += (String) act.get("actorNm") + ", ";
				}
				String plot = (String) obj3.get("plot");
				String runtime = (String) obj3.get("runtime");
				String repRlsDate = (String) obj3.get("repRlsDate");
				String keywords = (String) obj3.get("keywords");
				String postersStr = (String) obj3.get("posters");
				String[] posts = postersStr.split("\\|");
				String posters = posts[0];
				String default_poster = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7HY8NY2QmoKgSW-f6BmH_q5Sh6UnZmGU1rXmSy7OqHD0lRMPq";
				if (posters.equals("")) {
					posters = default_poster;
				}

				// MovieDto 객체 생성
				// list에 담기
				MovieDto dto = new MovieDto(0, movieSeq, title, titleEng, genre, directorNm, actorNm, plot, runtime,
						repRlsDate, keywords, 0, posters, null, 0, 0);
				list.add(dto);
			}
		} catch (Exception e) {
		}
		return list;
	}

	public MovieDto getMovieInfo(String movieSeqKey) {
		MovieDto dto = null;
		StringBuilder urlBuilder = new StringBuilder(
				"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new"); /*
																													 * URL
																													 */

		try {
			urlBuilder
					.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=04YVG7XZ00W520AJ41N7"); /* Service Key */

			urlBuilder.append("&" + URLEncoder.encode("movieSeq", "UTF-8") + "="
					+ URLEncoder.encode(movieSeqKey, "UTF-8")); /* movieSeq */
			URL url = new URL(urlBuilder.toString());
			System.out.println(url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			// System.out.println(sb.toString());
			JSONParser p = new JSONParser();
			JSONObject obj = (JSONObject) p.parse(sb.toString());
			JSONArray dataArr = (JSONArray) obj.get("Data");
			// System.out.println("dataArr :: " + dataArr);
			JSONObject obj2 = (JSONObject) dataArr.get(0);
			JSONArray resultArr = (JSONArray) obj2.get("Result");
			System.out.println("resultArr :: " + resultArr);

			// obj3 => resultArr.
			for (int i = 0; i < resultArr.size(); i++) {

				JSONObject obj3 = (JSONObject) resultArr.get(i);
				// 키값으로 하나씩 추출
				String movieSeq = (String) obj3.get("movieSeq");
				String title = (String) obj3.get("title");
				title = title.replaceAll("!HS ", "");
				title = title.replaceAll("!HE ", "");
				String titleEng = (String) obj3.get("titleEng");
				String genre = (String) obj3.get("genre");
				JSONArray dirArr = (JSONArray) obj3.get("director");
				JSONObject dir = (JSONObject) dirArr.get(0);
				String directorNm = (String) dir.get("directorNm");
				JSONArray actArr = (JSONArray) obj3.get("actor");
				String actorNm = "";
				for (int j = 0; j < actArr.size(); j++) {
					JSONObject act = (JSONObject) actArr.get(j);
					if (j == actArr.size() - 1) {
						actorNm += (String) act.get("actorNm");
						break;
					}
					actorNm += (String) act.get("actorNm") + ", ";
				}
				String plot = (String) obj3.get("plot");
				String runtime = (String) obj3.get("runtime");
				String repRlsDate = (String) obj3.get("repRlsDate");
				String keywords = (String) obj3.get("keywords");
				String postersStr = (String) obj3.get("posters");
				String[] posts = postersStr.split("\\|");
				String posters = posts[0];
				String default_poster = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ7HY8NY2QmoKgSW-f6BmH_q5Sh6UnZmGU1rXmSy7OqHD0lRMPq";
				if (posters.equals("")) {
					posters = default_poster;
				}

				// MovieDto 객체 생성
				dto = new MovieDto(0, movieSeq, title, titleEng, genre, directorNm, actorNm, plot, runtime, repRlsDate,
						keywords, 0, posters, null, 0, 0);
			}
		} catch (Exception e) {
		}
		return dto;
	}

	public void updateMovie() {
//        SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
		dao.initMovie();
		int idx = 0;
		for (int i = 1; i <= 2; i++) {
			String URL = "https://movie.daum.net/premovie/released?opt=reserve&page=" + i;
			Document doc = null;
			try {
				doc = Jsoup.connect(URL).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
			//2. 목록을 가져온다.
			 Elements tits	 = doc.select(".info_tit > a");	// ul의 clear 클래스 안에 있는 li를 모두 가져온다.
			 Elements dates = doc.select(".info_state");	// ul의 clear 클래스 안에 있는 li를 모두 가져온다.
			 //제목별로 검색하여 데이터를 Dto에 저장하고 insert한다.
			 
			 for(int j = 0; j < tits.size(); j ++) {
				 Element tit=tits.get(j);
				 String titleKey=tit.text();
				 
				 Element day=dates.get(j);
				 String date=day.text();
				 String[] a=date.split("\\s");
				 String[] d = a[0].split("\\.");
				 String dateKey = "20"+d[0]+d[1]+d[2];

				// 제목별로 검색하여 데이터를 Dto에 저장하고 insert한다.

				StringBuilder urlBuilder = new StringBuilder(
						"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new"); /*
																															 * URL
																															 */
				try {
					urlBuilder.append(
							"&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=04YVG7XZ00W520AJ41N7"); /* Service Key */
					
					urlBuilder.append("&" + URLEncoder.encode("title", "UTF-8") + "=" + URLEncoder.encode(titleKey, "UTF-8")); /* 검색어 */
					urlBuilder.append("&" + URLEncoder.encode("releaseDts", "UTF-8") + "=" + URLEncoder.encode(dateKey, "UTF-8")); /* 검색어 */
				
					URL url = new URL(urlBuilder.toString());
					System.out.println(url);
					HttpURLConnection conn = (HttpURLConnection) url.openConnection();
					conn.setRequestMethod("GET");
					conn.setRequestProperty("Content-type", "application/json");
					System.out.println("Response code: " + conn.getResponseCode());
					BufferedReader rd;
					if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
						rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					} else {
						rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
					}
					StringBuilder sb = new StringBuilder();
					String line;
					while ((line = rd.readLine()) != null) {
						sb.append(line);
					}
					rd.close();
					conn.disconnect();
					// System.out.println(sb.toString());
					JSONParser p = new JSONParser();
					JSONObject obj = (JSONObject) p.parse(sb.toString());
					JSONArray dataArr = (JSONArray) obj.get("Data");
					// System.out.println("dataArr :: " + dataArr);
					JSONObject obj2 = (JSONObject) dataArr.get(0);
					JSONArray resultArr = (JSONArray) obj2.get("Result");
//					System.out.println("resultArr :: "+resultArr);

					// obj3 => resultArr.
					JSONObject obj3 = (JSONObject) resultArr.get(0);
					// 키값으로 하나씩 추출
					String movieSeq = (String) obj3.get("movieSeq");
					String title = (String) obj3.get("title");
					title = title.replaceAll("!HS ", "");
					title = title.replaceAll("!HE ", "");
					String titleEng = (String) obj3.get("titleEng");
					String genre = (String) obj3.get("genre");
					JSONArray dirArr = (JSONArray) obj3.get("director");
					JSONObject dir = (JSONObject) dirArr.get(0);
					String directorNm = (String) dir.get("directorNm");
					JSONArray actArr = (JSONArray) obj3.get("actor");
					String actorNm = "";
					for (int k = 0; k < actArr.size(); k++) {
						JSONObject act = (JSONObject) actArr.get(k);
						if (j == actArr.size() - 1) {
							actorNm += (String) act.get("actorNm");
							break;
						}
						actorNm += (String) act.get("actorNm") + ", ";
					}
					String plot = (String) obj3.get("plot");
					String runtime = (String) obj3.get("runtime");
					String repRlsDate = (String) obj3.get("repRlsDate");
					String keywords = (String) obj3.get("keywords");
					String postersStr = (String) obj3.get("posters");
					String[] posts = postersStr.split("\\|");
					String posters = posts[0];
					String default_poster = "http://liberaldead.com/blog/wp-content/uploads/no-poster.jpg";
					if (posters.equals("")) {
						posters = default_poster;
					}
					// MovieDto 객체 생성
					MovieDto dto = new MovieDto(++idx, movieSeq, title, titleEng, genre, directorNm, actorNm, plot,
							runtime, repRlsDate, keywords, 0, posters, null, 0, 0);
					System.out.println(idx + ". title :: " + title);
					dao.updateMovie(dto);

				} catch (Exception e) {
				}
			}
		}
	}
}
