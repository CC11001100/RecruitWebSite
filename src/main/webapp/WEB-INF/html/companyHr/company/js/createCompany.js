/**
 * 
 * 创建公司页面用到的js文件
 * 
 * 
 */



$(function(){
	
	
	
	
	$("#person_scale").slider({
		formatter: function(value) {
			if(value[0]==value[1]){
				return "公司规模 "+value[0]+"人";
			}else{
				return "公司规模 "+value[0]+"~"+value[1]+"人";	
			}
		}
	});
	
	$("#logo").fileinput({'showUpload':false, 'previewFileType':'any'}); 
	
	
	
	
	
	
	
	
	
	
	
});

















