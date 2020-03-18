package yuseok.example;
import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawl{
	
	public static void main(String[] args) throws Exception{
		String url = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=cnt&date=20200317"; //크롤링할 url 지정
        Document doc = null; //Document 에는 페이지의 전체 소스가 저장된다  
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
        /*
         * select 를 이용하여 원하는 태그를 선택한다. select 는 원하는 값을 가져오기 위한 중요한 기능이다.
         * ==>원하는 값들이 들어있는 덩어리를 가져온다.
         */
        Elements element  = doc.select("tbody");
        
		//Iterator을 사용하여 하나씩 값 가져오기
		Iterator<Element> ie = element.select("td.title").iterator();		        
		while (ie.hasNext()) {
			System.out.println(ie.next().text());
		}

	}//main
}//class