package org.cc11001100.jfinal.utils;

import java.util.UUID;

/**
 * 
 * 生成器工具类
 * 
 * @author CC11001100
 *
 */
public class GenUtil {

	/**
	 * 生成全局唯一的id
	 * 
	 * @return
	 */
	public static String id(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}
