package com.spoiler.movie.search.dto;

public class SearchDto {
	private String actor;
	private String image;
	private String director;
	private String subtitle;
	private String link;
	private String title;
	private String pubDate;
	private String userRating;
	
	public SearchDto() {}

	public SearchDto(String actor, String image, String director, String subtitle, String link, String title,
			String pubDate, String userRating) {
		super();
		this.actor = actor;
		this.image = image;
		this.director = director;
		this.subtitle = subtitle;
		this.link = link;
		this.title = title;
		this.pubDate = pubDate;
		this.userRating = userRating;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

	public String getUserRating() {
		return userRating;
	}

	public void setUserRating(String userRating) {
		this.userRating = userRating;
	}
	
}
