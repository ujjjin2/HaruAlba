package util;

import java.security.MessageDigest;

public class SHA256 {
	
	public String getSHA256(String input, String saltresult) {
		StringBuffer result = new StringBuffer();
		try {
        		// input 값에 해쉬함수를 적용하는 과정
			
			//메시지다이제스트 클래스를 이용하여 digest 값을 갱신시키기 위해 SHA-256 방식으로 변수 생성
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			
			// 받아온 랜덤 값을 바이트로 변환
			byte[] salt = saltresult.getBytes();
			
			//digest를 사용하기 전 리셋
			digest.reset();
			
			//가염처리를 통해 데이터를 해쉬
			digest.update(salt);
			
			//input을 바이트로 변환 후 해쉬를 반환하여 chars에 저장
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			
			
			for(int i = 0; i < chars.length; i++) { // chars를 16진수 스트링으로 변환하는 for문
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length() == 1) result.append("0"); // 항상 두 자리 16진수로만들기 위해 길이가 1일경우 뒤에 0 추가
				result.append(hex); // 스트링버퍼 result에 16진수 스트링 추가
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result.toString(); // 가공된 해쉬 스트링을 결과로 리턴함
	}
}