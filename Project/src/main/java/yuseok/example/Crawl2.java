package yuseok.example;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawl2 {

	public static void main(String[] args) throws Exception{
		String url = "http://ticket2.movie.daum.net/Movie/MovieRankList.aspx"; //크롤링할 url 지정
        Document doc = null; //Document 에는 페이지의 전체 소스가 저장된다  
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }

        Elements element  = doc.select(".movie_detail");
//      Elements element2 = doc.select(".thumb_poster img");
//		String image = element2.attr("src"); //제목
//      System.out.println(image);
		//Iterator을 사용하여 하나씩 값 가져오기		        
		Iterator<Element> image2 = element.select("img.thumb_photo").iterator(); //이미지
		Iterator<Element> title = element.select(".movie_join .tit_join .link_g").iterator(); //제목
		Iterator<Element> Point = element.select(".list_boxthumb .raking_grade .emph_grade").iterator();//별점      		        
		//순위
		int count=0;
		while (title.hasNext()) {
			count = count+1;
			System.out.println(
					"순위 :"+count+"위" +"|"+
					"이미지:"+image2.next().attr("src") +"|"+
					"제목 :"+title.next().text() +"|"+
					"별점 :"+Point.next().text()+"/10"
			);//System.out.println
		}//while

	}//main
}