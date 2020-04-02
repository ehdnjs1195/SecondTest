package com.spoiler.movie.Dto;

public class RecommendDto {
	private String id;
	private String recommend;
	private int num;
	
	public RecommendDto() {}

	public RecommendDto(String id, String recommend, int num) {
		super();
		this.id = id;
		this.recommend = recommend;
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	
}
