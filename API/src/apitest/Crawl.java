package apitest;

import java.io.IOException;
import java.text.SimpleDateFormat;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawl {
	public static void main(String[] args) {
		 SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
		 int idx = 0;
		 for(int i =1 ; i<=2;i++) {
			 
			 String URL="https://movie.daum.net/premovie/released?opt=reserve&page="+i;
			 
			 //1. Document를 가져온다.
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
				 String da = "20"+d[0]+d[1]+d[2];
				
				 System.out.println(++idx + " : " + titleKey + " | " + da);
			 }
		 }
	}
}
