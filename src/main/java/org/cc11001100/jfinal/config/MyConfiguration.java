package org.cc11001100.jfinal.config;

import org.cc11001100.jfinal.controller.FooController;
import org.cc11001100.jfinal.interceptor.ExceptionInterceptor;
import org.cc11001100.jfinal.interceptor.FooInterceptor;
import org.cc11001100.jfinal.route.FooRoutes;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log4jLogFactory;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.tx.TxByActionKeyRegex;
import com.jfinal.plugin.activerecord.tx.TxByActionKeys;
import com.jfinal.plugin.activerecord.tx.TxByMethodRegex;
import com.jfinal.plugin.activerecord.tx.TxByMethods;
import com.jfinal.plugin.cron4j.Cron4jPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.plugin.redis.RedisPlugin;
import com.jfinal.template.Engine;
import com.jfplugin.mail.MailPlugin;

import net.dreamlu.event.EventPlugin;

/**
 * JFinal配置类
 * 
 * @author CC11001100
 *
 */
public class MyConfiguration extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		
		me.setDevMode(true);
		me.setLogFactory(new Log4jLogFactory());
		
		/*设置错误对应页*/
		me.setError404View("/error/404.html");
		me.setError500View("/error/500.html");
		
	}

	@Override
	public void configRoute(Routes me) {

		/*配置模块映射*/
		me.add(new FooRoutes());
		
		/*配置映射，但最好是将映射按照模块划分*/
		me.setBaseViewPath("/user");
		me.add("/user", FooController.class);

	}

	@Override
	public void configEngine(Engine me) {
		
	}

	@Override
	public void configPlugin(Plugins me) {
		
		/*druid连接池*/
		Prop jdbcProp=PropKit.use("config/jdbc.properties");
		DruidPlugin dp = new DruidPlugin(jdbcProp.get("mysql.url").trim(), jdbcProp.get("mysql.user").trim(), jdbcProp.get("mysql.passwd").trim(), jdbcProp.get("mysql.driver").trim());
		me.add(dp);
		
		/*ORM插件*/ 
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
		/*设置数据库的类型*/
		arp.setDialect(new MysqlDialect());
		/*配置O-R映射，不直接配置在这里，而是提取出去了*/
//		arp.addMapping("user", Foo.class);
		_MappingKit.mapping(arp);
		me.add(arp);
		
		/*配置EhCache缓存插件*/
		me.add(new EhCachePlugin("config/ehcache.xml"));

		/*配置redis缓存插件*/
		RedisPlugin bbsRedis = new RedisPlugin("bbs", "localhost");
		me.add(bbsRedis);
		
		/*配置Cron插件*/
		Cron4jPlugin cp=new Cron4jPlugin("config/cron.properties", "cronTask");
		me.add(cp);
		
		/*添加Event插件*/
		EventPlugin eventPlugin = new EventPlugin();
		/*开启异步，默认同步。或者使用`threadPool(ExecutorService executorService)`自定义线程池。*/ 
		eventPlugin.async();
		/*设置扫描jar包，默认不扫描*/ 
		eventPlugin.scanJar();
		/*设置监听器默认包，默认全扫描*/ 
		eventPlugin.scanPackage("org.cc11001100.jfinal");
//		/*服务器端*/
//		plugin.setRmiServer(int port);
//		/*客户端*/
//		plugin.setRmiClient(String host, int port);
		me.add(eventPlugin);
		
		/*添加发送邮件插件*/
		me.add(new MailPlugin(PropKit.use("config/mail.properties").getProperties()));
		
	}

	@Override
	public void configInterceptor(Interceptors me) {
		
		/*配置事务拦截器，为匹配到的方法开启事务，这样比一个一个配置爽多啦，regex是正则匹配，不带regex的是全匹配*/
		me.add(new TxByMethodRegex("(.*save.*|.*update.*)"));
		me.add(new TxByMethods("save", "update"));
		me.add(new TxByActionKeyRegex("/trans.*"));
		me.add(new TxByActionKeys("/tx/save", "/tx/update"));
		
		/*普通拦截器示例*/
		/*添加控制层全局拦截器*/ 
		me.addGlobalActionInterceptor(new FooInterceptor());
		/*添加业务层全局拦截器*/ 
		me.addGlobalServiceInterceptor(new FooInterceptor());
		/*为兼容老版本保留的方法，功能与addGlobalActionInterceptor完全一样*/ 
		me.add(new FooInterceptor());
		
		/*配置全局异常拦截器*/
		me.addGlobalActionInterceptor(new ExceptionInterceptor());
		me.addGlobalServiceInterceptor(new ExceptionInterceptor());
		
	}

	@Override
	public void configHandler(Handlers me) {
		
	}
	
	@Override
	public void afterJFinalStart() {
		
		/*在此进行预加载数据等操作*/
		
	}

}
