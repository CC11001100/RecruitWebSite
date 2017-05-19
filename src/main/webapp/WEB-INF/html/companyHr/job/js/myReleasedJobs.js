/**
 * 
 * 我发布的职位页面用到的js文件
 * 
 */





$(function(){
	
	
	$("#offlineBtn").click(function(){
		
		layer.confirm("确定要下线此职位？", {
		  btn: ["确定下线","我点错了"],
		  icon: 3
		}, function(){
			/*下线职位代码*/
			
			layer.msg("此职位已下线", {icon: 1});
		}, function(){
			/*nothing...*/ 
		});
		
	});
	
	
	
	
	
	
	
	
});













