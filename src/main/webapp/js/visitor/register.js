/**
 * 
 * 注册页面用到的js文件
 * 
 * 
 */



$(function(){
	
	
	/*提示信息*/
	var tipMsg=$("#tipMsg").val().trim();
	if(tipMsg){
		layer.msg(tipMsg);
	}
	
	/*上传头像*/
	$("#avatar").fileinput({'showUpload':false, 'previewFileType':'any'}); 
	
	
	/*注册时对参数合法性进行检查*/
	$("#registerBtn").click(function(){
		
		var ok=true;
		
		// 用户名
		var usernameElt=$("#username");
		var username=usernameElt.val().trim();
		if(!username){
			ok=false;
			layer.tips("请输入用户名", usernameElt, {
				tipsMore:true
			});
		}else if(username.length>20){
			ok=false;
			layer.tips("用户名在20个字符以内", usernameElt, {
				tipsMore:true
			});
		}
		
		// 密码
		var passwdElt=$("#passwd");
		var passwd=passwdElt.val().trim();
		if(!passwd){
			ok=false;
			layer.tips("请输入密码", passwdElt, {
				tipsMore:true
			});
		}else if(passwd.length>20){
			ok=false;
			layer.tips("密码在20个字符以内", passwdElt, {
				tipsMore:true
			});
		}
		
		// 昵称
		var nicknameElt=$("#nickname");
		var nickname=nicknameElt.val().trim();
		if(!nickname){
			ok=false;
			layer.tips("请输入昵称", nicknameElt, {
				tipsMore:true
			});
		}else if(nickname.length>20){
			ok=false;
			layer.tips("昵称必须在20个字符以内", nicknameElt, {
				tipsMore:true
			});
		}
		
		return ok;
	});
	
	
	
	
	
});

















