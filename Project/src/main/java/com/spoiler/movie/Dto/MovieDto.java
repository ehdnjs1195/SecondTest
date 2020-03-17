package com.spoiler.movie.Dto;

public class MovieDto {
	private String movieSeq;
	private String title;
	private String titleEng;
	private String genre;
	private String director;
	private String actor;
	private String plot;
	private String runtime;
	private String repRlsDate;
	private String keywords;
	private float starPoint;
	private String posters;
	private String videoLink;
	private int startRowNum;
	private int endRowNum;
	
	public MovieDto() {}

	public MovieDto(String movieSeq, String title, String titleEng, String genre, String director, String actor,
			String plot, String runtime, String repRlsDate, String keywords, float starPoint, String posters,
			String videoLink, int startRowNum, int endRowNum) {
		super();
		this.movieSeq = movieSeq;
		this.title = title;
		this.titleEng = titleEng;
		this.genre = genre;
		this.director = director;
		this.actor = actor;
		this.plot = plot;
		this.runtime = runtime;
		this.repRlsDate = repRlsDate;
		this.keywords = keywords;
		this.starPoint = starPoint;
		this.posters = posters;
		this.videoLink = videoLink;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public String getMovieSeq() {
		return movieSeq;
	}

	public void setMovieSeq(String movieSeq) {
		this.movieSeq = movieSeq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitleEng() {
		return titleEng;
	}

	public void setTitleEng(String titleEng) {
		this.titleEng = titleEng;
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

	public String getPlot() {
		return plot;
	}

	public void setPlot(String plot) {
		this.plot = plot;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getRepRlsDate() {
		return repRlsDate;
	}

	public void setRepRlsDate(String repRlsDate) {
		this.repRlsDate = repRlsDate;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public float getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(float starPoint) {
		this.starPoint = starPoint;
	}

	public String getPosters() {
		return posters;
	}

	public void setPosters(String posters) {
		this.posters = posters;
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

	
}