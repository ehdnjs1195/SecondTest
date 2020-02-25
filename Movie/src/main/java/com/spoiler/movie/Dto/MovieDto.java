package com.spoiler.movie.Dto;

public class MovieDto {
	private int num;
	private String title; 
	private String content;
	private String releasDate;
	private String genre;
	private String director;
	private String actor;
	private String fileName;
	public MovieDto() {}
	public MovieDto(int num, String title, String content, String releasDate, String genre, String director,
			String actor, String fileName) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.releasDate = releasDate;
		this.genre = genre;
		this.director = director;
		this.actor = actor;
		this.fileName = fileName;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReleasDate() {
		return releasDate;
	}
	public void setReleasDate(String releasDate) {
		this.releasDate = releasDate;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
