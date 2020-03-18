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
			String URL="https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=cnt&date=" + today;
			
			//1. Document를 가져온다.
			Document doc = null;
			try {
				doc = Jsoup.connect(URL).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
			//2. 목록을 가져온다.
			Elements elements = doc.select(".tit3");	// ul의 clear 클래스 안에 있는 li를 모두 가져온다.
			//제목별로 검색하여 데이터를 Dto에 저장하고 insert한다.
			int idx = 0;
			for(Element element : elements) {
				String titleKey=element.text();
				System.out.println(++idx + " : " + titleKey);
			}
	}
}
