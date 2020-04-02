package yuseok.example;

import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Poster {
	public static void main(String[] args) throws Exception{
		try{
			String URL="https://kinolights.com/title/archive?filter_genre=ALL&filter_hide_watched=&filter_index_rating=&filter_nation=ALL&filter_star_rating=&filter_year=ALL&play_filter_channel=&play_filter_monetization=&play_filter_price=&sort_filter=watched_count_desc";

			String pageParam="&page=";
			int PAGE=1;
			for(PAGE=1; PAGE<=847; PAGE++){
				Document doc=Jsoup.connect(URL+pageParam+PAGE).get();
				Elements elements=doc.select(".poster");
				Iterator<Element> images = elements.select("img").iterator();

				while (images.hasNext()) {
					System.out.println(
						"이미지 :"+images.next().attr("src")
					);
				}	
			}
		}catch(Exception e){
				System.out.println("크롤링 실패 : "+e);
		}
	}
}