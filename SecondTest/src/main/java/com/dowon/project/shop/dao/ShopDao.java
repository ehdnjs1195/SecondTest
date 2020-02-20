package com.dowon.project.shop.dao;

import java.util.List;

import com.dowon.project.shop.dto.ShopDto;

public interface ShopDao {
	//?��?��?�� 목록?�� 리턴?��주는 메소?��
	public List<ShopDto> getList();
	//?��?�� ?��고�?? 감소 ?��?��?�� 메소?��
	public void minusCount(int num);
	//?���? 감소?��?��?�� 메소?��
	public void minusMoney(ShopDto dto);
	//?��?��?���? 증�??��?��?�� 메소?��
	public void plusPoint(ShopDto dto);
	//?��?��?��?��?�� �?격을 리턴?��?�� 메소?��
	public int getPrice(int num);
}
