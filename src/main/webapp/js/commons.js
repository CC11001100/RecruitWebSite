/**
 * 
 * 
 * 全局通用的js文件
 * 
 */

/**
 * 全局变量
 */
var serverAddress="http://localhost:8080";


$(function(){
	
	
	
	$("#logout").click(function(){
		
		layer.confirm("确定要退出登录吗？", {
		  btn: ["确定退出","我点错了"],
		  icon: 3
		}, function(){
			/*退出登录代码*/
			layer.msg("退出成功，马上跳转首页...", {icon: 1}, function(){
//				window.location=serverAddress+"/common/logout";
			});
			//这样更快一些
			window.location=serverAddress+"/common/logout";
		}, function(){
			/*nothing...*/ 
		});
		
	});
	
	
	
	
	
	
});

































