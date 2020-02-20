package com.dowon.shop.dto;

//ì£¼ë¬¸ ? •ë³´ë?? ?‹´?„ Dto
public class OrderDto {
	private int num; //ì£¼ë¬¸ ë²ˆí˜¸
	private String id; //ì£¼ë¬¸??˜ ?•„?´?””
	private int code; //?ƒ?’ˆë²ˆí˜¸
	private String addr; //ë°°ì†¡ì£¼ì†Œ

	public OrderDto() {}

	public OrderDto(int num, String id, int code, String addr) {
		super();
		this.num = num;
		this.id = id;
		this.code = code;
		this.addr = addr;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

}