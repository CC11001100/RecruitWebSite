/**
 * 
 * 职位列表页面用到的js文件
 * 
 */


$(function(){
	
	
	$("#keyworkSearchBtn").click(function(){

		//关键词检查
		var keywordEtl=$("#keyword");
		var keyword=keywordEtl.val().trim();
		if(keyword.length>20){
			layer.tips("关键字不能超过20个字", keywordEtl, {
				tips:4,
				tipsMore:true
			});
			return false;
		}
		
		return true;
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
















