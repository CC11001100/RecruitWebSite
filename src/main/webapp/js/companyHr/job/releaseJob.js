/**
 * 
 * 发布职位页面用到的js文件
 * 
 */

$(function(){
	
	
	/*经验要求滑块*/
	$("#workExperience").slider({
		formatter: function(value) {
			if(value[0]==value[1]){
				return "经验要求 "+value[0]+"年";
			}else{
				return "经验要求 "+value[0]+"~"+value[1]+"年";	
			}
		}
	});
	
	/*薪水滑块*/
	$("#salary").slider({
		formatter: function(value) {
			if(value[0]==value[1]){
				return "月薪 "+(value[0]/1000)+"K";
			}else{
				return "月薪 "+(value[0]/1000)+"K~"+(value[1]/1000)+"K";
			}
		}
	});
	
	/*表单提交时校验数据*/
	$("#releaseJobBtn").click(function(){
		
		var ok=true;
		
		//职位名
		var nameEtl=$("#name");
		var name=nameEtl.val().trim();
		if(!name){
			ok=false;
			layer.tips("请输入职位名", nameEtl,{
				tipsMore:true
			});
		}else if(name.length>20){
			ok=false;
			layer.tips("职位名在20个字符以内", nameEtl,{
				tipsMore:true
			});
		}
		
		//工作位置
		var locationEtl=$("#location");
		var location=locationEtl.val().trim();
		if(!location){
			ok=false;
			layer.tips("请输入工作位置", locationEtl,{
				tipsMore:true
			});
		}else if(location.length>50){
			ok=false;
			layer.tips("工作位置在50个字符以内", locationEtl,{
				tipsMore:true
			});
		}
		
		//联系方式
		var contactEtl=$("#contact");
		var contact=contactEtl.val().trim();
		if(!contact){
			ok=false;
			layer.tips("请填写联系方式", contactEtl, {
				tipsMore:true
			});
		}else if(contact.length>50){
			ok=false;
			layer.tips("联系方式在50个字符以内", contactEtl, {
				tipsMore:true
			});
		}
		
		//职位描述
		var descContentEtl=$("#descContent");
		var descContent=descContentEtl.val().trim();
		if(!descContent){
			ok=false;
			layer.tips("请填写职位描述信息", descContentEtl, {
				tipsMore:true
			});
		}else if(descContent.length>3000){
			ok=false;
			layer.tips("职位秒数在3000个字符以内", descContentEtl, {
				tipsMore:true
			});
		}
		
		return ok;
	});
	
	
	
	
	
	
	
	
	
});




