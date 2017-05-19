/**
 * 
 * 发布职位页面用到的js文件
 * 
 */

$(function(){
	
	
	
	$("#workExperience").slider({
		formatter: function(value) {
			if(value[0]==value[1]){
				return "经验要求 "+value[0]+"年";
			}else{
				return "经验要求 "+value[0]+"~"+value[1]+"年";	
			}
		}
	});
	
	$("#salary").slider({
		formatter: function(value) {
			if(value[0]==value[1]){
				return "月薪 "+(value[0]/1000)+"K";
			}else{
				return "月薪 "+(value[0]/1000)+"K~"+(value[1]/1000)+"K";
			}
		}
	});
	
	
	
	
	
	
	
	
	
	
});




