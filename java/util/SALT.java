package util;

public class SALT {
	
	public String makeSALT() {
		
		String result = "";
		
		      char ch1 = (char) ((Math.random() * 26) + 97);
		      char ch2 = (char) ((Math.random() * 26) + 97);

		
		 result += ch1 ;
		 result += ch2 ;
		
		return result;

}

}
