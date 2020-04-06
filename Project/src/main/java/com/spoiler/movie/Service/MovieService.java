package com.spoiler.movie.Service;


import javax.servlet.http.HttpServletRequest;

import com.spoiler.movie.Dto.MovieCommentDto;

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
	//영화 랭킹 리스트
	public void getRankList(HttpServletRequest request);
	//영화 업데이트
	public void updateRank(HttpServletRequest request);
}
