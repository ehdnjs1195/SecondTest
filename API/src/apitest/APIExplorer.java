package apitest;

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
import org.json.simple.parser.ParseException;
//https://www.kmdb.or.kr/info/api/apiDetail/6  에서 API이용
//json-simple-1.1.1.jar 이
public class APIExplorer {
	
	public static void main(String[] args) throws IOException, ParseException { 
		StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new"); /*URL*/ 
//		String keyword = null;
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=04YVG7XZ00W520AJ41N7"); /*Service Key*/ 
		urlBuilder.append("&" + URLEncoder.encode("query","UTF-8") + "=" + URLEncoder.encode("해리포터", "UTF-8")); /*검색어*/ 
		urlBuilder.append("&" + URLEncoder.encode("title","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제목*/ 
		urlBuilder.append("&" + URLEncoder.encode("genre","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*장르*/ 
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
		
		getList(resultArr);
	}
	
	public static void getList(JSONArray resultArr){
		List<MovieDto> list = new ArrayList<>();
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
			MovieDto dto=new MovieDto(movieSeq, title, titleEng, genre, directorNm, actorNm, plot, runtime, repRlsDate, keywords, posters);
			list.add(dto);
			
		}
	}
}