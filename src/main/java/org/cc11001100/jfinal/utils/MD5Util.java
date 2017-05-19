package org.cc11001100.jfinal.utils;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * 
 * MD5工具，用来对密码进行加密什么的
 * 
 * @author CC11001100
 *
 */
public class MD5Util {

	/**默认加的盐*/
	private static final String DEFAULT_SALT="foobar";
	
	/**
	 * 
	 * 对明文字符串进行加密
	 * 
	 * @param plaintext 要加密的明文字符串
	 * @param salt 加的盐
	 * @return
	 */
	public static String md5(String plaintext, String salt){
		String md5 = DigestUtils.md5Hex(plaintext);
		StringBuilder sb=new StringBuilder();
		sb.append(md5).append(salt);
		return DigestUtils.md5Hex(sb.toString());
	}
	
	/**
	 * 对明文字符串进行加密，省略盐的话使用默认的加盐方式
	 * 
	 * @param plaintext 要加密的明文字符串
	 * @return
	 */
	public static String md5(String plaintext){
		return md5(plaintext, DEFAULT_SALT);
	}
	
}
