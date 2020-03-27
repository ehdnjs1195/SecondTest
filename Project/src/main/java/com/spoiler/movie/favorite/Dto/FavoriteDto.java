package com.spoiler.movie.favorite.Dto;


public class FavoriteDto {
	private int num;
	private String id;
	private String movieId;
	private String movieSeq;
	private String resRlsDate;
	private String genre;
	private String title;
	private String poster;
	
	public FavoriteDto() {}

	public FavoriteDto(int num, String id, String movieId,
			String movieSeq, String resRlsDate,
			String genre, String title, String poster) {
		super();
		this.num = num;
		this.id = id;
		this.movieId = movieId;
		this.movieSeq = movieSeq;
		this.resRlsDate = resRlsDate;
		this.genre = genre;
		this.title = title;
		this.poster = poster;
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

	public String getResRlsDate() {
		return resRlsDate;
	}

	public void setResRlsDate(String resRlsDate) {
		this.resRlsDate = resRlsDate;
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

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	};
	
	
	
}