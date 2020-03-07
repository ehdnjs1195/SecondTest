package com.spoiler.movie.Dao;

import java.util.List;

import com.spoiler.movie.Dto.MovieCommentDto;

public interface MovieComementDao {
	public List<MovieCommentDto> getList(String title); //인자로 전달된 그룹번호(원글의 글번호) 에 해당되는 댓글 목록 얻어오기
	public void delete(int num);
	public void insert(MovieCommentDto dto);
	public int getSequnce(); //저장할 댓글의 글 번호를 리턴하는 메소드
}
