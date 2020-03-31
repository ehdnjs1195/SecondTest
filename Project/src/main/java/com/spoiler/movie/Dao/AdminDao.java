package com.spoiler.movie.Dao;

import java.util.List;

import com.spoiler.movie.Dto.PopupDto;

public interface AdminDao {
	public void insertPopup(PopupDto dto);
	public List<PopupDto> getPopupList();
	public void updateState(PopupDto dto);
}
