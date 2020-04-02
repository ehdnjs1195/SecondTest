package com.spoiler.movie.Dao;


import com.spoiler.movie.Dto.PopupDto;

public interface AdminDao {
	public void insertPopup(PopupDto dto);
	public PopupDto getPopup(String writer);
	public void updateState(PopupDto dto);
	public boolean checkAdmin(String id);
	public void updatePopup(PopupDto dto);
}
