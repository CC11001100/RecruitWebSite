/**
 * 
 * 我收到的简历页面用到的js文件
 * 
 */



$(function(){
	
	
	
	/*拒绝简历按钮*/
	$("button[name=refuseBtn]").click(function(){
		
		layer.confirm("确定要将此简历标记为“不合适”？", {
		  btn: ["确实不合适","我点错了"],
		  icon: 3
		}, function(){
			/*将此简历标记为不合适代码*/
			
			layer.msg("此简历已被标记为不合适", {icon: 1});
		}, function(){
			/*nothing...*/ 
		});		
		
	});
	
	
	/*通过简历筛选，邀请面试信息*/
	$("button[name=inviteInterviewBtn]").click(function(){
		
		/*打开页面输入邀请面试相关的信息*/
		layer.open({
		  type: 2,
		  skin: 'layui-layer-rim',
		  area: ['800px', '600px'],
		  maxmin:true,
		  title:"发送面试邀请",
		  id:"inviteInterviewWindow",
		  content: "http://127.0.0.1:8020/JobNavigation/html/companyHr/resume/inviteInterview.html"
		});
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
});
















