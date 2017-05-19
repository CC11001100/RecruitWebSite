/**
 * 
 * 修改用户资料页面用到的js文件
 * 
 */


$(function(){
	
	
	/*错误提示信息*/
	var tipMsg=$("#tipMsg").val();
	if(tipMsg){
		layer.msg(tipMsg);
	}
	
	/*头像*/
	$("#avatar").fileinput({'showUpload':false, 'previewFileType':'any'}); 
	
	
	/*修改昵称头像表单提交时校验*/
	$("#changeUserInfoBtn").click(function(){
		
		var nicknameElt=$("#nickname");
		var nickname=nicknameElt.val().trim();
		if(!nickname){
			layer.tips("请填写昵称", nicknameElt);
			return false;
		}else if(nickname.length>20){
			layer.tips("用户昵称在20个字符以内", nicknameElt)
			return false;
		}
		
		return true;
	});

	/*修改密码表单校验*/
	$("#changePasswdBtn").click(function(){
		
		var oldPasswdElt=$("#oldPasswd");
		var newPasswdElt=$("#newPasswd");
		var confirmNewPasswdElt=$("#confirmNewPasswd");
		
		var oldPasswd=oldPasswdElt.val().trim();
		var newPasswd=newPasswdElt.val().trim();
		var confirmNewPasswd=confirmNewPasswdElt.val().trim();
		
		if(!oldPasswd){
			layer.tips("请填写旧密码", oldPasswdElt);
			return false;
		}else if(oldPasswd.length>20){
			layer.tips("密码在20个字符以内", oldPasswdElt);
			return false;
		}
		
		if(!newPasswd){
			layer.tips("请填写新密码", newPasswdElt);
			return false;
		}else if(newPasswd.length>20){
			layer.tips("密码在20个字符以内", newPasswdElt);
			return false;
		}
		
		if(!confirmNewPasswd){
			layer.tips("请确认新密码", confirmNewPasswdElt);
			return false;
		}else if(confirmNewPasswd.length>20){
			layer.tips("密码在20个字符以内", confirmNewPasswdElt);
			return false;
		}
		
		if(newPasswd!=confirmNewPasswd){
			layer.tips("两次密码填写不一致", confirmNewPasswdElt);
			return false;
		}
		
		return true;
	});
	
	
	
});



















