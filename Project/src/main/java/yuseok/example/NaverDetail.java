package yuseok.example;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NaverDetail {
	public static void main(String[] args) {
		try{
			String URL="https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=pnt";
			String dateParam="&date=";
			
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");	
			Date time = new Date();
			String time1 = format1.format(time);

			Document doc=Jsoup.connect(URL+dateParam+time1).get();
			Elements elements=doc.select("tbody tr");
			Iterator<Element> titles = elements.select("td.title a").iterator();
			Iterator<Element> points = elements.select("td.point").iterator();
			Iterator<Element> links = elements.select(".tit5 a").iterator();
			int count=0;
				while (titles.hasNext()) {
					count = count+1;
					System.out.println(
						"순위 :"+count+"위" +"|"+
						"제목 :"+titles.next().text() +"|"+
						"평점 :"+points.next().text() +"점"+"|"+
						"링크 : https://movie.naver.com/"+links.next().attr("href"));
				}	
		}catch(Exception e){
			System.out.println("크롤링 실패 : "+e);
		}
		
		// 네이버 영화 평점
		try{
			String URL="https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=pnt";
			String dateParam="&date=";
			
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");	
			Date time = new Date();
			String time1 = format1.format(time);
			
			String pageParam="&page=";
			int PAGE=2;
			for(PAGE=2; PAGE<=40; PAGE++){
				Document doc=Jsoup.connect(URL+dateParam+time1+pageParam+PAGE).get();
				Elements elements=doc.select("tbody tr");
				Iterator<Element> rankings = elements.select("td.order").iterator();
				Iterator<Element> titles = elements.select("td.title a").iterator();
				Iterator<Element> points = elements.select("td.point").iterator();
				Iterator<Element> links = elements.select(".tit5 a").iterator();

				/*
				 * for(Element element : elements){ System.out.println(element.text()); }
				 */

				while (titles.hasNext()) {
					System.out.println(
						"순위 :"+rankings.next().text()+"위" + "|"+
						"제목 :"+titles.next().text() +"|"+
						"평점 :"+points.next().text() +"점"+"|"+
						"링크 : https://movie.naver.com/"+links.next().attr("href"));
				}
				
			}//for end
		}catch(Exception e){
			System.out.println("크롤링 실패 : "+e);
		}//try end
	}//main() end
}
