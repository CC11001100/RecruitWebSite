/**
 * 
 * 管理员 > 公司管理
 * 
 */


$(function(){
	
	
	
	$("button[name=delCompanyBtn]").click(function(){
	
		var location=$(this).data("location");
		
		layer.confirm("确定要删除此公司？", {
		  btn: ["删除掉它","我点错了"],
		  icon: 3
		}, function(){
			window.location=location;
		}, function(){
			/*nothing...*/ 
		});
		
	
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
























