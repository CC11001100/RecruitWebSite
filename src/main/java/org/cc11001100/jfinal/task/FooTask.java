package org.cc11001100.jfinal.task;

import org.apache.log4j.Logger;

/**
 * 
 * 一个可以被执行的定时任务
 * 
 * @author CC11001100
 *
 */
public class FooTask implements Runnable {

	private static Logger log=Logger.getLogger(FooTask.class);
	
	/**
	 * 必须要有run()方法
	 */
	public void run() {
		log.debug("Task running...");
	}
	
}
