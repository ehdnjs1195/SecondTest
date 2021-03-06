package com.spoiler.movie.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spoiler.movie.Dao.MovieDao;
import com.spoiler.movie.Dto.MovieDto;

@Service
public class MovieAPIServiceImpl implements MovieAPIService{
	@Autowired
	private MovieDao dao;
	
	public List<MovieDto> getList(String titleKey, String genreKey, String nationKey, int pageNum) {
		List<MovieDto> list = new ArrayList<>();

		StringBuilder urlBuilder = new StringBuilder(
				"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new&listCount=10"); 
		try {
			urlBuilder
					.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=0510885533XK58C4291C"); /* Service Key */
			if (titleKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("title", "UTF-8") + "="
						+ URLEncoder.encode(titleKey, "UTF-8")); /* 검색어 */
			}
			if (genreKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("genre", "UTF-8") + "="
						+ URLEncoder.encode(genreKey, "UTF-8")); /* 장르 */
			}
			if (nationKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("nation", "UTF-8") + "="
						+ URLEncoder.encode(nationKey, "UTF-8")); /* 나라별 리스트 */
			}
			urlBuilder.append("&" + URLEncoder.encode("sort", "UTF-8") + "="
					+ URLEncoder.encode("prodYear", "UTF-8")); /* 개봉순으로 정렬 */
//			int startCount = 1 + (pageNum) * 10;
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
				String movieId = (String) obj3.get("movieId");
				String movieSeq = (String) obj3.get("movieSeq");
				String title = (String) obj3.get("title");
				title = title.replaceAll("!HS ", "");
				title = title.replaceAll("!HE ", "");
				String titleEng = (String) obj3.get("titleEng");
				String genre = (String) obj3.get("genre");
				String nation=(String) obj3.get("nation");
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
				if(repRlsDate.equals("")) {
					
				}else {
					String yyyy=repRlsDate.substring(0,4);
					String mm = repRlsDate.substring(4,6);
					String dd = repRlsDate.substring(6,8);
					if(dd.equals("00")) {
						repRlsDate = yyyy+"년 " + mm+"월 ";						
					}else {
						repRlsDate = yyyy+"년 " + mm+"월 " + dd+"일 ";						
					}
				}
				String keywords = (String) obj3.get("keywords");
				String postersStr = (String) obj3.get("posters");
				String[] posts = postersStr.split("\\|");
				String posters = posts[0];
				String default_poster = "http://liberaldead.com/blog/wp-content/uploads/no-poster.jpg";
				if (posters.equals("")) {
					posters = default_poster;
				}

				// MovieDto 객체 생성
				// list에 담기
				MovieDto dto = new MovieDto(0,movieId, movieSeq, title, titleEng, genre, nation, directorNm, actorNm, plot, runtime,
						repRlsDate, keywords, 0, posters, null, 0, 0);
				list.add(dto);
			}
		} catch (Exception e) {
		}
		return list;
	}

	public MovieDto getMovieInfo(String movieSeqKey, String movieIdKey) {
		MovieDto dto = null;
		StringBuilder urlBuilder = new StringBuilder(
				"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new"); /*
																													 * URL
																													 */
		try {
			urlBuilder
					.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=0510885533XK58C4291C"); /* Service Key */

			urlBuilder.append("&" + URLEncoder.encode("movieSeq", "UTF-8") + "="
					+ URLEncoder.encode(movieSeqKey, "UTF-8")); /* movieSeq */
			urlBuilder.append("&" + URLEncoder.encode("movieId", "UTF-8") + "=" + URLEncoder.encode(movieIdKey, "UTF-8")); /* movieId */
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
			JSONObject obj3 = (JSONObject) resultArr.get(0);
			// 키값으로 하나씩 추출
			String movieId = (String) obj3.get("movieId");
			String movieSeq = (String) obj3.get("movieSeq");
			String title = (String) obj3.get("title");
			title = title.replaceAll("!HS ", "");
			title = title.replaceAll("!HE ", "");
			String titleEng = (String) obj3.get("titleEng");
			String genre = (String) obj3.get("genre");
			String nation=(String) obj3.get("nation");
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
			if(repRlsDate.equals("")) {
				
			}else {
				String yyyy=repRlsDate.substring(0,4);
				String mm = repRlsDate.substring(4,6);
				String dd = repRlsDate.substring(6,8);
				if(dd.equals("00")) {
					repRlsDate = yyyy+"년 " + mm+"월 ";						
				}else {
					repRlsDate = yyyy+"년 " + mm+"월 " + dd+"일 ";						
				}
			}
			String keywords = (String) obj3.get("keywords");
			String postersStr = (String) obj3.get("posters");
			String[] posts = postersStr.split("\\|");
			String posters = posts[0];
			String default_poster = "http://liberaldead.com/blog/wp-content/uploads/no-poster.jpg";
			if (posters.equals("")) {
				posters = default_poster;
			}

			// MovieDto 객체 생성
			dto = new MovieDto(0,movieId, movieSeq, title, titleEng, genre, nation, directorNm, actorNm, plot, runtime, repRlsDate,
					keywords, 0, posters, null, 0, 0);

		} catch (Exception e) {
		}
		return dto;
	}
	public void updateMovie() {
//      SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
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

				StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new");
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
					String movieId = (String) obj3.get("movieId");
					String movieSeq = (String) obj3.get("movieSeq");
					String title = (String) obj3.get("title");
					title = title.replaceAll("!HS ", "");
					title = title.replaceAll("!HE ", "");
					String titleEng = (String) obj3.get("titleEng");
					String genre = (String) obj3.get("genre");
					String nation=(String) obj3.get("nation");
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
					MovieDto dto = new MovieDto(++idx,movieId, movieSeq, title, titleEng, genre, nation, directorNm, actorNm, plot,
							runtime, repRlsDate, keywords, 0, posters, null, 0, 0);
					System.out.println(idx + ". title :: " + title);
					dao.updateMovie(dto);

				} catch (Exception e) {
				}
			}
		}
	}
	
	@Override
	public List<MovieDto> moreMovieList(String startCount, String genreKey, String titleKey,String nationKey) {
		List<MovieDto> list = new ArrayList<>();

		StringBuilder urlBuilder = new StringBuilder(
				"http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new&listCount=10"); 
		try {
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=0510885533XK58C4291C"); /* Service Key */
			if(genreKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("genre", "UTF-8") + "=" + URLEncoder.encode(genreKey, "UTF-8")); /* 장르 */				
			}
			if(titleKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("title", "UTF-8") + "="+ URLEncoder.encode(titleKey, "UTF-8")); /* 개봉순으로 정렬 */				
			}
			if(nationKey != null) {
				urlBuilder.append("&" + URLEncoder.encode("nation", "UTF-8") + "="+ URLEncoder.encode(nationKey, "UTF-8")); /* 나라별리스트 */				
			}
			urlBuilder.append("&" + URLEncoder.encode("sort", "UTF-8") + "="+ URLEncoder.encode("prodYear", "UTF-8")); /* 개봉순으로 정렬 */
			
			urlBuilder.append("&" + URLEncoder.encode("startCount","UTF-8") + "=" + URLEncoder.encode(startCount, "UTF-8")); /*페이징처리*/ 				

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
				String movieId = (String) obj3.get("movieId");
				String movieSeq = (String) obj3.get("movieSeq");
				String title = (String) obj3.get("title");
				title = title.replaceAll("!HS ", "");
				title = title.replaceAll("!HE ", "");
				String titleEng = (String) obj3.get("titleEng");
				String genre = (String) obj3.get("genre");
				String nation=(String) obj3.get("nation");
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
				if(repRlsDate.equals("")) {
					
				}else {
					String yyyy=repRlsDate.substring(0,4);
					String mm = repRlsDate.substring(4,6);
					String dd = repRlsDate.substring(6,8);
					if(dd.equals("00")) {
						repRlsDate = yyyy+"년 " + mm+"월 ";						
					}else {
						repRlsDate = yyyy+"년 " + mm+"월 " + dd+"일 ";						
					}
				}
				String keywords = (String) obj3.get("keywords");
				String postersStr = (String) obj3.get("posters");
				String[] posts = postersStr.split("\\|");
				String posters = posts[0];
				String default_poster = "http://liberaldead.com/blog/wp-content/uploads/no-poster.jpg";
				if (posters.equals("")) {
					posters = default_poster;
				}

				// MovieDto 객체 생성
				// list에 담기
				MovieDto dto = new MovieDto(0,movieId, movieSeq, title, titleEng, genre, nation, directorNm, actorNm, plot, runtime,
						repRlsDate, keywords, 0, posters, null, 0, 0);
				list.add(dto);
			}
		} catch (Exception e) {
		}
		return list;
	}	
	
}
