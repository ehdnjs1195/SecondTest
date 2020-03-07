package com.spoiler.movie.users.dao;

import com.spoiler.movie.users.dto.UsersDto;

public interface UsersDao {
	public boolean isExist(String inputId);
	public void insert(UsersDto dto);
	//입력한 아이디를 이용해서 암호화 된 비밀번호를 가져와야한다.(가입되지 않은 아이디면 null = 로그인 실패, 가입된 아이디여도 입력한 비밀번호와 일치해야된다.)
	public String getPwdHash(String inputId);
	public UsersDto getData(String id);
	public void updateProfile(UsersDto dto);
	public void updatePwd(UsersDto dto);
	public String getProfile(String id);
	public void updateUser(UsersDto dto);
	public void delete(String id);
}
