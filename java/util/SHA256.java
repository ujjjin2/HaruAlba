package util;

import java.security.MessageDigest;

public class SHA256 {
	
	public String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
		try {
        		// 입력한 값에 해쉬 알고리즘 적용
			
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			
			/****** 가염 처리과정 ******/
			
			byte[] salt = "Hello Salt".getBytes();
			digest.reset();
			digest.update(salt);
			
			byte[] chars = digest.digest(input.getBytes("UTF-8")); // Hash 적용 값을 담아준다.
			
			/******* chars -> 16진수 String으로 변환 *******/
			
			for(int i = 0; i < chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length() == 1) result.append("0"); // 항상 두 자리 16진수로
				result.append(hex);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
}