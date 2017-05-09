package org.cc11001100.jfinal.route;

import org.cc11001100.jfinal.controller.FooController;
import org.cc11001100.jfinal.interceptor.FooInterceptor;

import com.jfinal.config.Routes;

/**
 * 可以将复杂的路由按模块进行拆分，然后把模块组装到一起系统也就成了
 * 
 * @author CC11001100
 *
 */
public class FooRoutes extends Routes {

	@Override
	public void config() {
		
		/*这个拦截器将对下面配置的所有映射生效，这种拦截器称为Route级别的拦截器*/
		addInterceptor(new FooInterceptor());
		
		/*在这里配置路由映射，这里的映射都会被上面配置的拦截器拦截到的*/
		add("/foo", FooController.class);
		
	}


}
