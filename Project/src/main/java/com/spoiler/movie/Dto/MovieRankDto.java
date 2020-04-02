package com.spoiler.movie.Dto;

public class MovieRankDto {
	private String rank;
	private String title;
	private String starPoint;
	
	public MovieRankDto() {}

	public MovieRankDto(String rank, String title, String starPoint) {
		super();
		this.rank = rank;
		this.title = title;
		this.starPoint = starPoint;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStarPoint() {
		return starPoint;
	}

	public void setStarPoint(String starPoint) {
		this.starPoint = starPoint;
	}

}
