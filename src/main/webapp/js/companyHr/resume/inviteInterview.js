/**
 * 
 * 邀请面试页面用到的js文件
 * 
 */


$(function(){
	
	
	
	/*提交按钮*/
	$("#submitBtn").click(function(){
		
		/*数据校验*/
		var inviteInterviewMsgElt=$("#inviteInterviewMsg");
		var inviteInterviewMsg=inviteInterviewMsgElt.val().trim();
		if(!inviteInterviewMsg){
//			layer.tips("请填写面试邀请信息", inviteInterviewMsgElt);
			layer.msg("请填写面试邀请信息");
			return false;
		}else if(inviteInterviewMsg.length>3000){
//			layer.tips("面试邀请信息在3000个字符以内", inviteInterviewMsgElt);
			layer.msg("面试邀请信息在3000个字符以内");
			return false;
		}
		
		var location=$("#inviteInterviewForm").attr("action");
		debugger;
		$.ajax({  
		    data:{"inviteInterviewMsg":inviteInterviewMsg},  
		    url:location,  
		    type:"post",  
		    success:function(data){
//		    	console.log(data);
		    	debugger;
		    	window.parent.location.href=data.redirect;
		    }
	    });
		
		return false;
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});


















