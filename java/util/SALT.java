package util;

public class SALT {
	
	public String makeSALT() {
		
		String result = "";
		
		      char ch1 = (char) ((Math.random() * 26) + 97); // 랜덤 알파벳 생성
		      char ch2 = (char) ((Math.random() * 26) + 97); // 랜덤 알파벳 생성

		
		 result += ch1 ;
		 result += ch2 ;
		
		return result; // 문자열 반환

}

}
