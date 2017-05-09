package org.cc11001100.jfinal.interceptor;

import org.apache.log4j.Logger;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 
 * 拦截器
 * 
 * 1. 全局拦截器
 * 		全局Action拦截器
 * 		全局Service拦截器
 * 2. Inject拦截器（非侵入式拦截器Enhancer.enhance(OrderService.class, Tx.class)）
 * 3. Class级别拦截器
 * 4. Method级别拦截器
 * 
 * 
 * @author CC11001100
 *
 */
public class FooInterceptor implements Interceptor {

	private static Logger log=Logger.getLogger(FooInterceptor.class);
	
	public void intercept(Invocation inv) {
		log.debug("Before FooInterceptor...");
		inv.invoke();
		log.debug("After FooInterceptor...");
	}

}
