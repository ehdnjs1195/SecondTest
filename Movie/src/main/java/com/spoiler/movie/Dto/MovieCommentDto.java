package com.spoiler.movie.Dto;

public class MovieCommentDto {
	private int num; //댓글 번호
	private String title; //해당 영화제목
	private String writer; //(비로그인)댓글 작성자
	private String pwd; //(비로그인)댓글 작성자 비밀번호
	private String content; //댓글 내용
	private int likeNum; //좋아요
	private int hateNum; //싫어요
	private String deleted; // 삭제한 댓글인지 여부 "no" | "yes"
	private String regdate; // 댓글 작성시간
	//생성자
	public MovieCommentDto() {}
	public MovieCommentDto(int num, String title, String writer, String pwd, String content, int likeNum, int hateNum,
			String deleted, String regdate) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.pwd = pwd;
		this.content = content;
		this.likeNum = likeNum;
		this.hateNum = hateNum;
		this.deleted = deleted;
		this.regdate = regdate;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public int getHateNum() {
		return hateNum;
	}
	public void setHateNum(int hateNum) {
		this.hateNum = hateNum;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
		
}