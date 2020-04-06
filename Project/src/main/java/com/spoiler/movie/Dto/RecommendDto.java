package com.spoiler.movie.Dto;

public class RecommendDto {
	private String id;
	private boolean isRecommend;
	private int num;
	
	public RecommendDto() {}

	public RecommendDto(String id, boolean isRecommend, int num) {
		super();
		this.id = id;
		this.isRecommend = isRecommend;
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean getisRecommend() {
		return isRecommend;
	}

	public void setisRecommend(boolean isRecommend) {
		this.isRecommend = isRecommend;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	
}
