/**
 * 
 *  用户管理页面用到的js文件
 * 
 */




$(function(){
	
	
	
	
	/*冻结用户账户*/
	$("[name=freezeBtn]").click(function(){
		
		var location=$(this).data("location");
		
		layer.confirm("确定要冻结此账户？", {
		  btn: ["冻结掉它","我点错了"],
		  icon: 3
		}, function(){
			window.location=location;
		}, function(){
			/*nothing...*/ 
		});		
		
		return true;
	});
	
	/*解冻用户账户*/
	$("[name=unfreezeBtn]").click(function(){
		
		var location=$(this).data("location");
		
		layer.confirm("确定要解冻账户？", {
		  btn: ["解除冻结","我点错了"],
		  icon: 3
		}, function(){
			window.location=location;
		}, function(){
			/*nothing...*/ 
		});		
		
		return true;
	});
	
	
	
	
	
	
});

