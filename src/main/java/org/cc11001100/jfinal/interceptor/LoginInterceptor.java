package org.cc11001100.jfinal.interceptor;

import org.cc11001100.jfinal.modle.User;
import org.cc11001100.jfinal.utils.ConstantRepo;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 登录拦截器
 * 
 * @author CC11001100
 *
 */
public class LoginInterceptor implements Interceptor {

	/**
	 * 检测Session中有没有会话信息
	 */
	@Override
	public void intercept(Invocation inv) {
		User user=(User) inv.getController().getSession().getAttribute(ConstantRepo.LOGIN_FLAG);
		if(user!=null){
			inv.invoke();
		}else{
			inv.getController().redirect("/visitor/loginEntry");
		}
	}

}
