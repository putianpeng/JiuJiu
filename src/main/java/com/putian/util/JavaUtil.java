package com.putian.util;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import sun.misc.BASE64Encoder;

public class JavaUtil {
	private JavaUtil() {
		
	}
	public static String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		MessageDigest md5=MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();
		String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
		return newstr;
	}
	
	/**
	 * 将带小数点的字符串转换成double
	 * @return
	 */
	public static double strtoint(String str) {
		String preStr = str.substring(0,str.lastIndexOf("."));
		String endStr = str.substring(str.lastIndexOf(".")+1);
		int endStrLength = endStr.length();
		int preInt = Integer.parseInt(preStr);
		int endInt = Integer.parseInt(endStr);
		double endIntdou =preInt+ endInt/Math.pow(10,endStrLength);
		return endIntdou;
	}
	
	/**
	 * 判断字符串是否为空
	 * 返回true:字符串为空
	 * 返回false:字符串不为空
	 */
	public static boolean stringIsNull(String str) {
		if(str==null||"".equals(str)) {
			return true;
		}
		return false;
	}
	
	/**
	 * 生成uuid
	 */
	public static String returnUUID() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replaceAll("-","");
	}
}


