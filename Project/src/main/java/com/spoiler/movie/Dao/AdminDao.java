package com.spoiler.movie.Dao;


import java.util.List;

import com.spoiler.movie.Dto.PopupDto;

public interface AdminDao {
	public void insertPopup(PopupDto dto);
	public PopupDto getPopup(int num);
	public void updateState(PopupDto dto);
	public boolean checkAdmin(String id);
	public void updatePopup(PopupDto dto);
	public List<PopupDto> getPopupList();
	public void deletePop(int num);
}
