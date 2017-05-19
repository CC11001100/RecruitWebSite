/**
 * 
 * 消息页面用到的js文件
 * 
 */




$(function(){
	
	
	$(".msg-content").click(function(){
		
		var _self=$(this);
		var msgContent=_self.text();
		layer.alert(msgContent, {
  			skin: "layer-ext-moon",
  			title: "读消息"
		}, function(index, e){
			
			/*修改界面上的显示*/
			layer.close(index);
			_self.parent().find(".unread").removeClass("unread").addClass("have-read");
			
			/*向服务器发送信息标记词条消息为已读状态*/
			
			
			
		});
		
		
		
	});
	
	
	
	
	
	
});


















