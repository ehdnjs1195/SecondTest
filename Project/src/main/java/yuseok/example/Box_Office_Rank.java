package yuseok.example;

import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Box_Office_Rank {
	public static void main(String[] args) {
		try{
			String URL="https://www.the-numbers.com/box-office-records/worldwide/all-movies/cumulative/all-time/";
			int PAGE=1;
			for(PAGE=1; PAGE<=1; PAGE=PAGE+100) {
				Document doc=Jsoup.connect(URL+PAGE).get();
				Elements elements=doc.select("tbody tr");
				Iterator<Element> rank = elements.select(".data:nth-child(odd)").iterator(); //홀수번째 선택자
				Iterator<Element> year = elements.select(".data:nth-child(2n)").iterator(); //짝수번째 선택자
				Iterator<Element> title = elements.select("b > a").iterator(); //영화 제목
				Iterator<Element> worldWide = elements.select("td[align='right']:nth-child(3n-2)").iterator(); //전세계 박스 오피스
				//Iterator<Element> domestic = elements.select("td[align='right']:nth-child(3n-1)").iterator(); //국내 박스 오피스
				//Iterator<Element> international = elements.select("td[align='right']:nth-child(3n)").iterator(); //국제 박스 오피스
				while (year.hasNext()) {
					System.out.println(
							"Rank : "+ rank.next().text()
							+", Year : "+ year.next().text()
							+", Title : "+ title.next().text()
							+", WorldWide : "+ String.valueOf(Long.parseLong(worldWide.next().text().replace("$", "").replace(",", ""))*1236)+" 원" //2020년 04월 05일 기준 환율 1$ = 1236.61원
							//+", Domestic : "+ String.valueOf(Long.parseLong(domestic.next().text().replace("$", "").replace(",", ""))*1236)+"원"
							//+", International : "+ String.valueOf(Long.parseLong(international.next().text().replace("$", "").replace(",", ""))*1236)+"원"
					);//System.out.println
				}//while		
			}//for
		}catch(Exception e){
			System.out.println("크롤링 실패 : "+e);
		}//try~catch		
	}//main() end
}
