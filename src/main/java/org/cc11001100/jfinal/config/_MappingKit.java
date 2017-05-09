package org.cc11001100.jfinal.config;

import org.cc11001100.jfinal.modle.Foo;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * 用来做 O-R 映射的，在这个里面进行配置，当比较多的时候继续分散，套路就是多了就分散...
 * 
 * @author CC11001100
 *
 */
public class _MappingKit {

	public static void mapping(ActiveRecordPlugin arp){
		arp.addMapping("foo", Foo.class);
	}
	
}
