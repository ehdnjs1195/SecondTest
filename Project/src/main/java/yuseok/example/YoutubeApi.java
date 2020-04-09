package yuseok.example;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class YoutubeApi {
	public static void main(String[] args) {
        String key = "AIzaSyBfnZOb2CBf1zDnW4TBlQ9CKaGK2CspqiE"; //애플리케이션 키값
        
        //query 에 들어갈 것
        String text = null;
        try {
            text = URLEncoder.encode("그린북", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://www.googleapis.com/youtube/v3/search?&part=snippet&maxResults=10&key="+key+"&q="+text; // json 결과

        Map<String, String> requestHeaders = new HashMap<>();
        String responseBody = get(apiURL,requestHeaders);
        System.out.println(responseBody);
        
        try {
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParser.parse(responseBody);
            JSONArray memberArray = (JSONArray) jsonObj.get("items");

            for(int i=0 ; i<memberArray.size() ; i++){
                JSONObject tempObj = (JSONObject) memberArray.get(i);
                System.out.println(""+(i+1)+"번째 영화 : "+tempObj.get("id"));
                System.out.println("-------------------------------------------");
            }

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

	private static String get(String apiURL, Map<String, String> requestHeaders) {
		// TODO Auto-generated method stub
		return null;
	}
}
