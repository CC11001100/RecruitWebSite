package org.cc11001100.jfinal.utils;

import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;

/**
 * 
 * 存放相关常量的地方
 * 
 * @author CC11001100
 *
 */
public class ConstantRepo {

	/**用户登录的标记，当用户登录后在Session里放一个这个为名称的属性*/
	public static final String LOGIN_FLAG="user";
	
	/**默认的头像位置*/
	public static final String DEFAULT_AVATAR="defaultAvatar.png";
	
	/**上传文件basepath*/
	public static String BASE_UPLOAD_FILE_PATH="";
	
	/**下载文件basepath*/
	public static String BASE_DOWNLOAD_FILE_PATH="";
	
	/**登录用户数统计*/
	public static final String LOGIN_COUNT="LOGIN_COUNT";
	
	static{
		
		/*加载各种配置文件*/
		Prop miscProp=PropKit.use("config/misc.properties");
		BASE_UPLOAD_FILE_PATH=miscProp.get("defaultBaseUploadPath");
		BASE_DOWNLOAD_FILE_PATH=miscProp.get("defaultBaseDownloadPath");
		
	}
	
	
	
	
	
	
	
	
	
}
