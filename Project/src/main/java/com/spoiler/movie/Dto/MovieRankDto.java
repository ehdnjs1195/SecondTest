package com.spoiler.movie.Dto;

public class MovieRankDto {
	private int rank;
	private String title;
	private float starPoint;
	
	public MovieRankDto() {}

	public MovieRankDto(int rank, String title, float starPoint) {
		super();
		this.rank = rank;
		this.title = title;
		this.starPoint = starPoint;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public float getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(float starPoint) {
		this.starPoint = starPoint;
	}

}
