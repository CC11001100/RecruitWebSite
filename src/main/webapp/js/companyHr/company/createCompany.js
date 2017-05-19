/**
 * 
 * 创建公司页面用到的js文件
 * 
 * 
 */



$(function(){
	
	
	
	/*公司规模选择滑块*/
	$("#person_scale").slider({
		formatter: function(value) {
			if(value[0]==value[1]){
				return "公司规模 "+value[0]+"人";
			}else{
				return "公司规模 "+value[0]+"~"+value[1]+"人";	
			}
		}
	});
	
	/*上传公司logo*/
	$("#logo").fileinput({'showUpload':false, 'previewFileType':'any'}); 
	
	/*提交表单时校验数据*/
	$("#createCompanyBtn, #editCompanyBtn").click(function(){
		
		var ok=true;
		
		//公司名称
		var nameEtl=$("#name");
		var name=nameEtl.val().trim();
		if(!name){
			ok=false;
			layer.tips("请填写公司名称", nameEtl, {
				tipsMore:true
			});
		}else if(name.length>20){
			ok=false;
			layer.tips("公司名称在20个字符以内", nameEtl, {
				tipsMore:true
			});
		}
		
		//公司logo
		var logoEtl=$("#logo");
		var logo=logoEtl.val().trim();
		if(!logo){
			ok=false;
			layer.tips("请上传公司logo", logoEtl,{
				tipsMore:true
			});
		}
		
		//公司负责人联系方式
		var contactEtl=$("#contact");
		var contact=contactEtl.val().trim();
		if(!contact){
			ok=false;
			layer.tips("请填写公司负责人联系方式", contactEtl,{
				tipsMore:true
			});
		}else if(contact.length>50){
			ok=false;
			layer.tips("公司负责人联系方式在50个字符以内", contactEtl,{
				tipsMore:true
			});
		}
		
		//公司描述
		var descContentEtl=$("#descContent");
		var descContent=descContentEtl.val().trim();
		if(!descContent){
			ok=false;
			layer.tips("请填写公司描述", descContentEtl,{
				tipsMore:true
			});
		}else if(descContent.length>3000){
			ok=false;
			layer.tips("公司描述不能多于3000字", descContentEtl,{
				tipsMore:true
			});
		}
		
		return ok;
	});

	
	
	
	
	
	
	
});

















