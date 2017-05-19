package org.cc11001100.jfinal.controller;

import org.cc11001100.jfinal.modle.User;
import org.cc11001100.jfinal.utils.ConstantRepo;

import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

/**
 * 
 * 游客相关的Controller
 * 
 * @author CC11001100
 *
 */
public class VisitorController extends Controller {
	
	
	/**
	 * 进入登录页面
	 */
	public void loginEntry(){
		render("/WEB-INF/jsp/visitor/login.jsp");
	}
	
	/**
	 * 进入注册页面
	 */
	public void registerEntry(){
		render("/WEB-INF/jsp/visitor/register.jsp");
	}
	
	/**
	 * 注册
	 */
	public void register(){
		
		UploadFile avatar=getFile("avatar");
		
		User user=getModel(User.class);
		
		if(!user.isUsernameAvaliable()){
			setAttr("tipMsg", "用户名已经被占用");
			render("/WEB-INF/jsp/visitor/register.jsp");
			return ;
		}
		
		user.genId();
		user.enctypePasswd();
		user.processAvatar(avatar);
		
		user.save();
		
		/*设置登录成功标记位*/
		setSessionAttr(ConstantRepo.LOGIN_FLAG, user);
		
		/*注册成功后重定向到职位列表页*/
		redirect("/common/jobListEntry");
	}
	
	/**
	 * 获取验证码显示
	 */
	public void getAuthCode(){
		renderCaptcha();
	}
	
	/**
	 * 登录
	 */
	public void login(){
		
		boolean res=validateCaptcha("authCode");
		if(!res){
			setAttr("authCodeMsg", "验证码错误");
			render("/WEB-INF/jsp/visitor/login.jsp");
			return;
		}
		
		User user=getModel(User.class);
		
		user=user.login();
		
		
		if(user==null){
			//登录失败，重定向到登录页面
			setAttr("tipMsg", "登录失败，用户名或密码不正确");
			render("/WEB-INF/jsp/visitor/login.jsp");
			return;
		}
		
		if(user.getIsFreeze()==1){
			//账户已经被冻结掉了
			setAttr("tipMsg", "登录失败，账户已经被冻结");
			render("/WEB-INF/jsp/visitor/login.jsp");
			return;
		}
		
		//增加一个在线用户数
		Integer loginCount=(Integer) getSession().getServletContext().getAttribute(ConstantRepo.LOGIN_COUNT);
		if(loginCount==null){
			loginCount=1;
		}else{
			loginCount++;
		}
		getSession().getServletContext().setAttribute(ConstantRepo.LOGIN_COUNT, loginCount);
		
		//登录成功，重定向到首页
		setSessionAttr(ConstantRepo.LOGIN_FLAG, user);
		redirect("/indexEntry");
		return;
		
	}
	
	
}
