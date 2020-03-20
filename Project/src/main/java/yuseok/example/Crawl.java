package yuseok.example;
import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawl{
	
	public static void main(String[] args) throws Exception{
		String url = "https://movie.naver.com/movie/running/current.nhn?order=reserve"; //크롤링할 url 지정
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
        Elements element  = doc.select(".lst_detail_t1 li");
        
		//Iterator을 사용하여 하나씩 값 가져오기
//		Iterator<Element> image = element.select(".lst_detail_t1 .thumb img").iterator(); //이미지		        
		Iterator<Element> title = element.select(".lst_dsc .tit a").iterator(); //제목
		Iterator<Element> ie = element.select(".star_t1 .num").iterator();//네티즌 평점	        
		Iterator<Element> ie2 = element.select(".star_t1 .num2 em").iterator();		        
//		Iterator<Element> ie3 = element.select(".lst_dsc .info_exp dd .star_t1 .num").iterator();		        
		Iterator<Element> ie4 = element.select(".lst_dsc .info_txt1 .tit_t1+dd").iterator();		        
		Iterator<Element> ie5 = element.select(".lst_dsc .info_txt1 .tit_t2+dd a").iterator();        
//		Iterator<Element> ie6 = element.select(".lst_dsc .info_txt1 .tit_t3+dd").iterator();
		
		int count=0;
		while (title.hasNext()) {
			count = count+1;
			System.out.println(
					"순위 :"+count+"위" +"|"+
//					"이미지 :"+image.next().text() +"|"+
					"제목 :"+title.next().text() +"|"+
					"네티즌 평점 :"+ie.next().text() +"|"+
					"참여 :"+ie2.next().text()+"명" +"|"+
//					"예매율 :"+ie3.next().text()+"%" +"|"+
					"개요 :"+ie4.next().text() +"|"+
					"감독 :"+ie5.next().text() +"|");
//					"출연 :"+ie6.next().text());
		}

	}//main
}//class