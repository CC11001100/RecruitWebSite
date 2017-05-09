package org.cc11001100.jfinal.validator;

import org.cc11001100.jfinal.modle.Foo;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * 验证器
 * 
 * @author CC11001100
 *
 */
public class FooValidator extends Validator {

	protected void validate(Controller controller) {
		validateRequiredString("blog.title", "titleMsg", "请输入Blog标题!");
		validateRequiredString("blog.content", "contentMsg", "请输入Blog内容!");
	}
	
	/**
	 * 在跳转后的页面仍可以访问的变量
	 */
	protected void handleError(Controller controller) {
		
		/*使用这个可以直接hold住整个Model*/
		controller.keepModel(Foo.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/blog/save")){
			controller.render("add.html");
		}else if (actionKey.equals("/blog/update")){
			controller.render("edit.html");
		}
			
	}

}
