package com.spoiler.movie.webscrape;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class WebScrape {
	
	
	
	public static void main(String[] args) throws IOException{
			
		
			Document doc= Jsoup.connect("http://movie.naver.com").get();
			String title=doc.title();
			int code=doc.
			System.out.println("title : " +title);
		
		}
				
				
	}

