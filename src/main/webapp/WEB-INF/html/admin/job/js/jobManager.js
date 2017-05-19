/**
 * 
 * 职位管理页面用到的js文件
 * 
 */




$(function(){
	
	
	
	$("button[name=delBtn]").click(function(){
		layer.confirm("确定要删除此职位？", {
		  btn: ["删除掉它","我点错了"],
		  icon: 3
		}, function(){
			/*删除职位代码*/
			
			layer.msg("删除职位成功", {icon: 1});
		}, function(){
			/*nothing...*/ 
		});
	});
	
	
	
	
	
	
	
	
	
	
});




















