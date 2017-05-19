/**
 * 
 * 我的简历页面用到的js文件
 * 
 */



$(function(){
	
	
	/*上传简历插件*/
	$("#uploadNewResume").fileinput({'showUpload':false, 'previewFileType':'any'}); 
	
	
	/*上传简历校验*/
	$("#uploadNewResumeBtn").click(function(){
		var uploadNewResumeElt=$("#uploadNewResume");
		var uploadNewResume=uploadNewResumeElt.val();
		if(!uploadNewResume){
			layer.tips("请选择新简历上传", uploadNewResumeElt, {
				tips:1
			});
			return false;
		}
		return true;
	});
	
	
	
});












