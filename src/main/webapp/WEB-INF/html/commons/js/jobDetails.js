/**
 * 职位详情页用到的js文件
 * 
 */



$(function(){
	
	
	$("#deliverMyResume").click(function(){
		layer.confirm("确定向此岗位投递简历吗？", {
		  btn: ["就投它了","我点错了"],
		  icon: 3
		}, function(){
			/*投递简历代码*/
			
			layer.msg("投递成功", {icon: 1});
		}, function(){
			/*nothing...*/ 
		});
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});




















