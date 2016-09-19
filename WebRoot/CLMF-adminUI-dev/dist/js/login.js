
$('.username').on('keydown',enterKey);
$('.password').on('keydown',enterKey);
function enterKey(e){
	if(e.keyCode==13){
		$('.submit_button').click();
	}
}
$('.submit_button').on('click',function(){
	var username = $('.username').val();
	var password = $('.password').val();
	if(!(username&&password)){
		alert("用户名和密码不能为空！");
	}else{
		//提交表单
	}
});
