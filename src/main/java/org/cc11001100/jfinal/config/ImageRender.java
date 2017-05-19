package org.cc11001100.jfinal.config;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import com.jfinal.render.Render;

/**
 * 
 * 用来向客户端渲染图片
 * 
 * @author CC11001100
 *
 */
public class ImageRender extends Render {
	
	/**要渲染到客户端去的图像文件*/
	private File imgFile;
	
	public ImageRender(File imgFile) {
		super();
		this.imgFile = imgFile;
	}

	public File getImgFile() {
		return imgFile;
	}

	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}

	/**
	 * 将特定的图片写回到客户端
	 */
	public void render() {
		
		response.setContentType("image/jpeg");
		try {
			FileUtils.copyFile(imgFile, response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}

