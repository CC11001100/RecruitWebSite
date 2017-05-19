/**
 * 
 * 我创建的公司页面用到的js文件
 * 
 * 
 *
 */




$(function(){
	
	
	
	$("#delBtn").click(function(){
		
		layer.confirm("确定要删除此公司？", {
		  btn: ["删除掉它","我点错了"],
		  icon: 3
		}, function(){
			/*删除公司代码*/
			
			layer.msg("删除公司成功", {icon: 1});
		}, function(){
			/*nothing...*/ 
		});
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
});
























