package com.spoiler.movie.Dao;

import java.util.List;

import com.spoiler.movie.Dto.MovieCommentDto;

public interface MovieCommentDao {
	public List<MovieCommentDto> getList(int ref_group);
	public void delete(int num);
	public void insert(MovieCommentDto dto);
	public int getSequence(); //저장할 댓글의 글 번호를 리턴하는 메소드
	public int getNum(MovieCommentDto dto);
	public void update(MovieCommentDto dto);
	public void updateCnt(int num);//추천수 증가할 메소드
}
