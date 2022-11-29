package util;

import java.security.SecureRandom;

public class SALT {
	
	public String makeSALT() {
		
		SecureRandom sr = new SecureRandom();
		byte[] salt = new byte[16];
		
		sr.nextBytes(salt);
		
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i<salt.length; i++) {
			sb.append(String.format("%02x", salt[i]));
		};
		
		return sb.toString(); // 문자열 반환
}

}
