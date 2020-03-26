package yuseok.example;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ApiExplorer {
	public static void main(String[] args) throws Exception { 
		StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new"); /*URL*/ 
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + "9731W6386MMONF38O15D"); /* Service Key */ 
		urlBuilder.append("&" + URLEncoder.encode("query","UTF-8") + "=" + URLEncoder.encode("다크 워터스", "UTF-8")); /* 검색 질의어 */ 
		urlBuilder.append("&" + URLEncoder.encode("genre","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* 검색 질의어 */ 
		urlBuilder.append("&" + URLEncoder.encode("detail","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /* 상세정보 출력여부 => Y or N */ 
		urlBuilder.append("&" + URLEncoder.encode("sort","UTF-8") + "=" + URLEncoder.encode("prodYear", "UTF-8")); /* 결과 정렬  */ 
		URL url = new URL(urlBuilder.toString()); 
		System.out.println(url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET"); 
		conn.setRequestProperty("Content-type", "application/json"); 
		System.out.println("Response code:: " + conn.getResponseCode()); 
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
//		System.out.println(sb.toString()); sb.toString()가 JSON 형태의 Data
		JSONParser p=new JSONParser();
		JSONObject obj=(JSONObject)p.parse(sb.toString());
		JSONArray dataArr=(JSONArray)obj.get("Data");
//		System.out.println("dataArr :: " + dataArr);
		JSONObject obj2=(JSONObject)dataArr.get(0);
		JSONArray resultArr=(JSONArray)obj2.get("Result");
//		System.out.println("resultArr : "+resultArr);
		JSONArray director=null;
		JSONArray actor=null;
		//obj3 => resultArr. 
		for(int i=0;i<resultArr.size();i++) {

			JSONObject obj3=(JSONObject)resultArr.get(i);
			//키값으로 하나씩 추출
			String movieSeq=(String)obj3.get("movieSeq");
			String title=(String)obj3.get("title");
			String titleEng=(String)obj3.get("titleEng");
			String genre=(String)obj3.get("genre");
			director=(JSONArray)obj3.get("director");
			actor=(JSONArray)obj3.get("actor");
			String plot=(String)obj3.get("plot");
			String runtime=(String)obj3.get("runtime");
			String repRlsDate=(String)obj3.get("repRlsDate");
			String keywords=(String)obj3.get("keywords");
			String posters=(String)obj3.get("posters");
			//출력.
			System.out.println("movieSeq:: " + movieSeq);
			System.out.println("title:: " + title.replaceAll("!HS", "").replaceAll("!HE", ""));
			System.out.println("titleEng:: " + titleEng);
			System.out.println("genre:: " + genre);
			System.out.println("director:: " + director);
			System.out.println("actor:: " + actor);
			System.out.println("plot:: " + plot);
			System.out.println("runtime:: " + runtime);
			System.out.println("repRlsDate:: " + repRlsDate);
			System.out.println("keywords:: " + keywords);
			System.out.println("posters:: " + posters);
			System.out.println("=============================================================");
		}

	}

} 
