package com.spoiler.movie.Dto;

public class MovieDto {
	private int num;
	private String title; 
	private String content;
	private String releaseDate;
	private String genre;
	private String director;
	private String actor;
	private float starPoint;
	private String imageLink;
	private String videoLink;
	private int startRowNum;
	private int endRowNum;
	private String keyword;
	
	public MovieDto() {}

	public MovieDto(int num, String title, String content, String releaseDate, String genre, String director,
			String actor, float starPoint, String imageLink, String videoLink, int startRowNum, int endRowNum,
			String keyword) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.releaseDate = releaseDate;
		this.genre = genre;
		this.director = director;
		this.actor = actor;
		this.starPoint = starPoint;
		this.imageLink = imageLink;
		this.videoLink = videoLink;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.keyword = keyword;
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

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
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

	public float getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(float starPoint) {
		this.starPoint = starPoint;
	}

	public String getImageLink() {
		return imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	public String getVideoLink() {
		return videoLink;
	}

	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
}
