package com.spoiler.movie.favorite.Dto;

public class FavoriteDto {
	private int num;
	private String id;
	private String movieSeq;
	private String posters;
	private String title;
	
	public FavoriteDto() {}

	public FavoriteDto(int num, String id, String movieSeq,
			String posters, String title) {
		super();
		this.num = num;
		this.id = id;
		this.movieSeq = movieSeq;
		this.posters = posters;
		this.title = title;
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

	public String getMovieSeq() {
		return movieSeq;
	}

	public void setMovieSeq(String movieSeq) {
		this.movieSeq = movieSeq;
	}

	public String getPosters() {
		return posters;
	}

	public void setPosters(String posters) {
		this.posters = posters;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	
}