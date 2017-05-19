package org.cc11001100.jfinal.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

/**
 * 首页
 * 
 * @author CC11001100
 *
 */
public class IndexController extends Controller{

	/**
	 * 首页
	 */
	public void indexEntry(){
		
		render("/WEB-INF/jsp/index.jsp");
	}
	
	@ActionKey("/")
	public void index(){
		redirect("indexEntry");
	}
	
}
