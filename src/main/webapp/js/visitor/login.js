/**
 * 登录页面用到的js文件
 */





$(function(){
	
	
	/*验证码*/
	var authCodeMsg=$("#authCodeMsg").val();
	if(authCodeMsg){
		layer.msg(authCodeMsg);
	}
	
	/*表单提交时校验数据*/
	$("#loginBtn").click(function(){
		
		var ok=true;
		
		//用户名
		var usernameEtl=$("#username");
		var username=usernameEtl.val().trim();
		if(!username){
			ok=false;
			layer.tips("请输入用户名", usernameEtl, {
				tipsMore:true
			});
		}else if(username.length>20){
			ok=false;
			layer.tips("用户名在20个字符以内", usernameEtl, {
				tipsMore:true
			});
		}
		
		//密码
		var passwdEtl=$("#passwd");
		var passwd=passwdEtl.val().trim();
		if(!passwd){
			ok=false;
			layer.tips("请输入密码", passwdEtl, {
				tipsMore:true
			});
		}else if(passwd.length>20){
			ok=false;
			layer.tips("密码在20个字符以内", passwdEtl, {
				tipsMore:true
			});
		}
		
		//验证码
		var authCodeEtl=$("#authCode");
		var authCode=authCodeEtl.val().trim();
		if(!authCode){
			ok=false;
			layer.tips("请输入验证码", authCodeEtl, {
				tipsMore:true
			});
		}else if(authCode.length!=4){
			ok=false;
			layer.tips("验证码为四位", authCodeEtl, {
				tipsMore:true
			});
		}
		
		return ok;
	});
	
	/*验证码单击刷新*/
	$("#authCodeImage").click(function(){
		var src=$(this).attr("src");
		if(src.indexOf("?")!=-1){
			src=src.substring(0, src.indexOf("?"));
		}
		$(this).attr("src", src+"?_="+new Date().getTime());
	});
	
	
});
