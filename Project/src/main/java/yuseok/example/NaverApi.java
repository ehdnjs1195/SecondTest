package yuseok.example;

//네이버 검색 API 예제 - blog 검색
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class NaverApi {
	public static void main(String[] args) {
        String clientId = "TaKXWZfZzHTXp_VQm4rW"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "O3oM8EHFCG"; //애플리케이션 클라이언트 시크릿값"
        
        //query 에 들어갈 것
        String text = null;
        try {
            text = URLEncoder.encode("아바타", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + text;    // json 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);
        System.out.println(responseBody);
        
        try {
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParser.parse(responseBody);
            JSONArray memberArray = (JSONArray) jsonObj.get("items");

            for(int i=0 ; i<memberArray.size() ; i++){
                JSONObject tempObj = (JSONObject) memberArray.get(i);
                System.out.println(""+(i+1)+"번째 영화 : "+tempObj.get("title"));
                System.out.println(""+(i+1)+"번째 링크: "+tempObj.get("link"));
                System.out.println(""+(i+1)+"번째 이미지: "+tempObj.get("image"));
                System.out.println(""+(i+1)+"번째 부제목: "+tempObj.get("subtitle"));
                System.out.println(""+(i+1)+"번째 제작년도: "+tempObj.get("pubDate"));
                System.out.println(""+(i+1)+"번째 감독: "+tempObj.get("director"));
                System.out.println(""+(i+1)+"번째 배우: "+tempObj.get("actor"));
                System.out.println(""+(i+1)+"번째 평점: "+tempObj.get("userRating"));
                System.out.println("-------------------------------------------");
            }

        } catch (ParseException e) {
            e.printStackTrace();
        }
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
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
