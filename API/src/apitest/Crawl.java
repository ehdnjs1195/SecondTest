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
//		 for(int i =1 ; i<=2;i++) {
			 
			 String URL="https://movie.naver.com/movie/running/current.nhn";
			 
			 //1. Document를 가져온다.
			 Document doc = null;
			 try {
				 doc = Jsoup.connect(URL).get();
			 } catch (IOException e) {
				 e.printStackTrace();
			 }
			 //2. 목록을 가져온다.
			 Elements elements = doc.select(".tit > a");	// ul의 clear 클래스 안에 있는 li를 모두 가져온다.
			 Elements dir = doc.select(".info_txt1 > dd ");	// ul의 clear 클래스 안에 있는 li를 모두 가져온다.
			 //제목별로 검색하여 데이터를 Dto에 저장하고 insert한다.
			 Element day=dir.get(1);
			 String direc=day.text();
			 System.out.println(direc);
//			 for(int j = 0; j < 10; j ++) {
//				 Element ele=elements.get(j);
//				 String titleKey=ele.text();
//				 
//				 Element day=dir.get(2);
//				 String direc=day.toString();
//				 System.out.println(++idx + " : " + titleKey + " | " + direc);
//			 }
//		 }
	}
}
