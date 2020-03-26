package com.spoiler.movie.users.Dao;

import com.spoiler.movie.users.Dto.UsersDto;


public interface UsersDao {
	public boolean isExist(String inputId);
	public boolean isPwdright(String inputPw);
	public void insert(UsersDto dto);
	public String getPwdHash(String inputId);
	public UsersDto getData(String id);
	public void updateProfile(UsersDto dto);
	public void updatePwd(UsersDto dto);
	public void updateUser(UsersDto dto);
	public void delete(String id);
	public String getProfile(String id);
	
}
