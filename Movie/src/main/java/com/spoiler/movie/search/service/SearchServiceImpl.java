package com.spoiler.movie.search.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.spoiler.movie.search.dto.SearchDto;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Override
	public void getSearch(HttpServletRequest request, String keyword) {
        String clientId = "nJrCloAE0D1njqCPPx7r"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "6o0qps3Adl"; //애플리케이션 클라이언트 시크릿값"

        String text = null;
        try {
            text = URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }
        	String apiURL = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2"; //KM Db api
//        String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text;    // json 결과
        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        JSONObject jsonObj=new JSONObject(responseBody);	//JSON으로 변환
        
        //JSON에서 items 추출 후 dto에 담고 list에 담기
        JSONArray arr=jsonObj.getJSONArray("items");
        List<SearchDto> list=new ArrayList<>();
        for(int i=0;i<arr.length();i++) {
        	String actor=jsonObj.getJSONArray("items").getJSONObject(i).getString("actor");
            String image=jsonObj.getJSONArray("items").getJSONObject(i).getString("image");
            String director=jsonObj.getJSONArray("items").getJSONObject(i).getString("director");
            String subtitle=jsonObj.getJSONArray("items").getJSONObject(i).getString("subtitle");
            String link=jsonObj.getJSONArray("items").getJSONObject(i).getString("link");
            String title=jsonObj.getJSONArray("items").getJSONObject(i).getString("title");
            String pubDate=jsonObj.getJSONArray("items").getJSONObject(i).getString("pubDate");
            String userRating=jsonObj.getJSONArray("items").getJSONObject(i).getString("userRating");
        	SearchDto dto=new SearchDto(actor, image, director, subtitle, link, title, pubDate, userRating);
        	list.add(dto);
        }
        request.setAttribute("list", list);
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line+"\n");
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
