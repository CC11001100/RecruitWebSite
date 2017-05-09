package org.cc11001100.jfinal.modle;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Model;

/**
 * 用户模型
 * 
 * @author CC11001100
 *
 */
public class Foo extends Model<Foo> {

	private static final long serialVersionUID = -5795237958237024883L;
	
	private static Logger log=Logger.getLogger(Foo.class);
	
	/**这个dao只可以用来 进行读操作，但如果用来进行写操作的话就会被污染掉*/
	public static final Foo dao=new Foo();
	
	private List<Foo> fooList;
	
	/**使用充血模型，这种都是临时查顺带缓存一下的*/
	public List<Foo> getFooList(){
		if(fooList==null){
			fooList=dao.find("select * from foo where foo like ?", "foo");
		}
		return fooList;
	}
	
	
	
}