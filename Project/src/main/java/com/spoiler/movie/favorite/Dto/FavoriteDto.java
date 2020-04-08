package com.spoiler.movie.favorite.Dto;


public class FavoriteDto {
	private int num;
	private String id;
	private String movieId;
	private String movieSeq;
	private String repRlsDate;
	private String genre;
	private String title;
	private String posters;
	private float starPoint;
	private float randomStarPoint;
	public FavoriteDto() {}
	
	public FavoriteDto(int num, String id, String movieId, String movieSeq, String repRlsDate, String genre,
			String title, String posters, float starPoint, float randomStarPoint) {
		super();
		this.num = num;
		this.id = id;
		this.movieId = movieId;
		this.movieSeq = movieSeq;
		this.repRlsDate = repRlsDate;
		this.genre = genre;
		this.title = title;
		this.posters = posters;
		this.starPoint = starPoint;
		this.randomStarPoint = randomStarPoint;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getMovieSeq() {
		return movieSeq;
	}
	public void setMovieSeq(String movieSeq) {
		this.movieSeq = movieSeq;
	}
	public String getRepRlsDate() {
		return repRlsDate;
	}
	public void setRepRlsDate(String repRlsDate) {
		this.repRlsDate = repRlsDate;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPosters() {
		return posters;
	}
	public void setPosters(String posters) {
		this.posters = posters;
	}
	public float getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(float starPoint) {
		this.starPoint = starPoint;
	}
	public float getRandomStarPoint() {
		return randomStarPoint;
	}
	public void setRandomStarPoint(float randomStarPoint) {
		this.randomStarPoint = randomStarPoint;
	}
	
}