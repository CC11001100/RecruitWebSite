package org.cc11001100.jfinal.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.cc11001100.jfinal.generator.ModelGenerator;
import org.cc11001100.jfinal.interceptor.FooInterceptor;
import org.cc11001100.jfinal.modle.Foo;
import org.cc11001100.jfinal.validator.FooValidator;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheInterceptor;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.CacheName;
import com.jfinal.plugin.ehcache.EvictInterceptor;
import com.jfinal.plugin.ehcache.IDataLoader;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.jfplugin.mail.MailKit;

import net.dreamlu.event.EventKit;

/**
 * Controller中的方法无需映射，方法名就是映射url尾
 * 
 * @author CC11001100
 *
 */
/** 配置方法级别的拦截器，将拦截本类中所有的方法 */
@Before(FooInterceptor.class)
public class FooController extends Controller {

	private static Logger log=Logger.getLogger(FooController.class);
	
	/**一个普通的action方法*/
	public void login() {

		log.debug("登录");

		new Foo().set("username", "陈继成").set("passwd", "qwerty").save();

		render("/index.html");

	}

	/** 一些DB操作的示例 */
	public void operation() {

		/*创建name属性为James,age属性为25的record对象并添加到数据库*/ 
		Record user = new Record().set("name", "James").set("age", 25);
		Db.save("user", user);

		/*删除id值为25的user表中的记录*/ 
		Db.deleteById("user", 25);

		/*查询id值为25的Record将其name属性改为James并更新到数据库*/ 
		user = Db.findById("user", 25).set("name", "James");
		Db.update("user", user);

		/*获取user的name属性*/
		String userName = user.getStr("name");

		/*获取user的age属性*/ 
		Integer userAge = user.getInt("age");

		/*查询所有年龄大于18岁的user*/ 
		List<Record> users = Db.find("select * from user where age > 18");

		/*分页查询年龄大于18的user,当前页号为1,每页10个user*/ 
		Page<Record> userPage = Db.paginate(1, 10, "select *", "from user where age > ?", 18);

	}

	/** 事务，原子操作 */
	public void transaction1() {
		Db.tx(new IAtom() {

			/** 当抛出异常或者return false的时候事务将会回滚 */
			public boolean run() throws SQLException {
				int count = Db.update("update account set cash = cash - ? where id = ?", 100, 123);
				int count2 = Db.update("update account set cash = cash + ? where id = ?", 100, 456);
				return count == 1 && count2 == 1;
			}

		});
	}

	/** 通过拦截器添加事务支持，只需要@Before(Tx.class)即可为这个方法开启事务支持 */
	@Before(Tx.class)
	public void transaction2() {

		/*获取转账金额*/ 
		Integer transAmount = getParaToInt("transAmount");
		/*获取转出账户id*/ 
		Integer fromAccountId = getParaToInt("fromAccountId");
		/*获取转入账户id*/ 
		Integer toAccountId = getParaToInt("toAccountId");
		/*转出操作*/ 
		Db.update("update account set cash = cash - ? where id = ?", transAmount, fromAccountId);
		/*转入操作*/ 
		Db.update("update account set cash = cash + ? where id = ?", transAmount, toAccountId);

	}

	/** 带缓存查询，需要开启了缓存支持的 */
	public void list() {
		List<Foo> blogList = Foo.dao.findByCache("cacheName", "key", "select * from blog");
		setAttr("blogList", blogList).render("list.html");

		// Model.paginateByCache("");
		// Db.findByCache(…);
		// Db.paginateByCache(…);

	}

	/** 配置方法级别的拦截器，可以配置多个的，Class<? extends Interceptor>[] value(); */
	@Before(FooInterceptor.class)
	public void useInterceptor() {
	}

	/**
	 * Clear 用法记忆技巧： 共有 Global、 Inject、 Class、 Method 四层拦截器 清除只针对 Clear
	 * 本身所处层的向上所有层，本层与下层不清除 不带参数时清除所有拦截器，带参时清除参数指定的拦截器
	 * 
	 * Clear也可以加在类级别上
	 * 
	 * 可以边清除边添加拦截器
	 * 
	 */
	@Clear
	@Before(FooInterceptor.class)
	public void clearInterceptor() {
	}

	/**
	 * 使用缓存，如果命中的话会直接使用之前的数据render，而不会再调用action
	 * 如果不指定CacheName的话默认使用ActionKey作为缓存名字的
	 */
	@Before(CacheInterceptor.class)
	@CacheName("fooList")
	public void useCache() {
	}

	/**
	 * EvictInterceptor会根据CacheName自动清除缓存的
	 */
	@Before(EvictInterceptor.class)
	@CacheName("fooList")
	public void evictCache() {
	}

	/**
	 * 使用CacheKit，在缓存未命中的情况下回调用传入的IDataLoader来获取数据,
	 * IDataLoader执行后会将其返回数据放入缓存中
	 */
	public void useCacheKit() {
		List<Foo> blogList = CacheKit.get("blog", "blogList", new IDataLoader() {
			public Object load() {
				return Foo.dao.find("select * from blog");
			}
		});
		setAttr("blogList", blogList);
		render("blog.html");
	}
	
	/**
	 * 使用redis缓存插件
	 * 
	 * 使用 incr、 incrBy、 decr、 decrBy 方法操作的计数器，
	 * 需要使用 getCounter(key) 进行读取而不能使用 get(key)，否则会抛反序列化异常
	 * 
	 * redis插件没有注解支持，需要手动进行get/set
	 * 
	 */
	public void useRedisCache(){
		Cache bbsCache = Redis.use("bbs");
		bbsCache.set("key", "value");
		bbsCache.get("key");
	}
	
	/**
	 * 使用验证器的时候只需要将Validator当做Interceptor使用即可
	 * 这个时候会自动的调用Validator的validate()方法来校验数据的
	 */
	@Before(FooValidator.class)
	public void useValidator(){
	}
	
	/**
	 * 使用Event插件
	 */
	public void useEventPlugin(){
//		EventKit.postRemote(final ApplicationEvent event);
	}
	
	/**
	 * 使用发邮件插件
	 */
	public void useMailPlugin(){
		
		/*发送普通邮件*/
		MailKit.send("receive@foo.com", Arrays.asList("抄送1", "抄送2"), "邮件主题", "邮件内容");
		
		/*带附件的邮件*/
		MailKit.send("receive@foo.com", Arrays.asList("抄送1", "抄送2"), "邮件主题", "邮件内容", Arrays.asList(new File("附件1"), new File("附件2")));
		
		/*还支持使用模板的邮件*/
		/*普通模板邮件*/
		Map<String, Object> dataMap1 = new HashMap<>();
		dataMap1.put("var1", "变量1");
		dataMap1.put("var2", "变量2");
		MailKit.send("receive@foo.com", Arrays.asList("抄送1", "抄送2"), "邮件主题", "模板路径", dataMap1);
		/*附件邮件模板*/
		Map<String, Object> dataMap2 = new HashMap<>();
		dataMap2.put("var1", "变量1");
		dataMap2.put("var2", "变量2");
		MailKit.send("receive@foo.com", Arrays.asList("抄送1", "抄送2"), "邮件主题", "模板路径", dataMap2, Arrays.asList(new File("附件1"), new File("附件2")));
		
	}
	
//	http://www.jfinal.com/project/22

}
