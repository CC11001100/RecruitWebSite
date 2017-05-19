package org.cc11001100.jfinal.controller;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.cc11001100.jfinal.config.ImageRender;
import org.cc11001100.jfinal.utils.ConstantRepo;

import com.jfinal.core.Controller;

/**
 * 文件相关的controller
 * 
 * @author CC11001100
 *
 */
public class FileController extends Controller {

	/**
	 * 显示图像
	 */
	public void showPic(){
		
		String filename=getPara("name");
		if(!securityCheck(filename)){
			return ;
		}
		
		File imgFile=new File(ConstantRepo.BASE_UPLOAD_FILE_PATH+"/"+filename);
		render(new ImageRender(imgFile));
	}
	
	/**
	 * 下载文件
	 */
	public void download(){
		
		
	}
	
	/**
	 * 对文件路径做安全检查
	 */
	private boolean securityCheck(String filename){
		if(StringUtils.isBlank(filename)){
			return false;
		}
		
		if(filename.contains("..")){
			return false;
		}
		
		return true;
	}
	
}
