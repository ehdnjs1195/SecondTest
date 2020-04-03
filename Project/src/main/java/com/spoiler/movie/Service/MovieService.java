package com.spoiler.movie.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.spoiler.movie.Dto.MovieCommentDto;
import com.spoiler.movie.Dto.MovieDto;

public interface MovieService {
	public void homeList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	//댓글 저장하는 메소드
	public void saveComment(HttpServletRequest request);
	//댓글 삭제하는 메소드
	public void deleteComment(int num);
	//댓글 수정하는 메소드
	public void updateComment(MovieCommentDto dto);
	//
	public void plusCnt(int num,HttpServletRequest request);
	public void minusCnt(int num,HttpServletRequest request);
}
