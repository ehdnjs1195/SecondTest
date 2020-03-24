package apitest;

public class Test {

	public static void main(String[] args) {
		String repRlsDate = "20100400";
		String yyyy=repRlsDate.substring(0,4);
		String mm = repRlsDate.substring(4,6);
		String dd = repRlsDate.substring(6,8);
		
		repRlsDate = yyyy+"년 " + mm+"월 " + dd;
		System.out.println(repRlsDate);
	}
}
