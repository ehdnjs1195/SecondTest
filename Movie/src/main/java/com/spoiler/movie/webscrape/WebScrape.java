package com.spoiler.movie.webscrape;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class WebScrape {
	
	
	
	public static void main(String[] args) throws Exception{
			
		final Document document=Jsoup.connect("https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=cur&date=20200314").get();
		for(Element row : document.select("table.list_ranking tr td")) {		
		final String rank=row.select("td.img").text();
		final String rating=row.select("td.point").text();
		System.out.println(rank + "->Rating: "+ rating);
	}
	}
}

