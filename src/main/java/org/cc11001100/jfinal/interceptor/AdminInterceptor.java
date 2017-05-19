package org.cc11001100.jfinal.interceptor;

import org.cc11001100.jfinal.modle.User;
import org.cc11001100.jfinal.utils.ConstantRepo;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**
 * 管理员登录拦截器
 * 
 * @author CC11001100
 *
 */
public class AdminInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		
		Controller controller=inv.getController();
		User user=controller.getSessionAttr(ConstantRepo.LOGIN_FLAG);
		if(user==null){
			controller.redirect("/visitor/loginEntry");
			return;
		}else if(3!=user.getUserType()){
			controller.redirect("/indexEntry");
			return;
		}

		inv.invoke();
	}

}
