

$(function(){
	setRight();
});
$('.car-table-list tr.infomate').on('click',resetRight);
$("#excel_info_add").click(function() {
	$("#excel_info").show();
	$("#basic_info").hide();
});
$("#ordinal_info_add").click(function() {
	$("#excel_info").hide();
	$("#basic_info").show();
});
function setRight(){
	var activity_name = $('.car-table-list').find('tr').eq(1).find('.activity_name').text();
	$('.activity_right').find('.activity_name').text(activity_name);
}

function resetRight(){
	$('.activity_right').hide();
	var activity_name = $(this).find('.activity_name').text();
	$('.activity_right').find('.activity_name').text(activity_name);
	$('.activity_right').show(700);
}
$('.checkAll').on('click',checkAll);
$('#checkAll').on('click',checkAll);
function checkAll(){
	var checkbox = $(this).parents('thead').siblings('tbody').find('input[type=checkbox]');
	if($(this).is(':checked')){
		for(var i=0;i<checkbox.length;i++){
			$(checkbox).eq(i).prop("checked",true);
		}
	}else{
		for(var i=0;i<checkbox.length;i++){
			$(checkbox).eq(i).removeAttr("checked");
		}
	}
}

/*************高级查询动作*************/
$('.ad_query_button').on('click',function(){
	$(this).parents('div.query').siblings('div.ad_query').slideToggle(500);
});
$('#ad_query_button').on('click',function(){
	$('#ad_query').slideToggle(500);
});
/*************地区联动*************/
$('#guest_country_email').on('change',function(){
	var selectValue = $(this).val();
	if(selectValue == 0){
		$('#guest_province_email').show();
	}else{
		$('#guest_province_email').hide();
	}
});
/*************新增嘉宾类别和接待标准*************/
$('#add_principle .ad_certificate_input').on('keyup',function(e){
	var keys = e.keyCode;
	if(((64<keys)&&(keys<90))||((96<keys)&&(keys<123))){
		var keyString = String.fromCharCode(keys);
		$(this).val(keyString);
	}else{
		$(this).val("");
	}
});
/******************tabel-tooltip**********************/
$('.staff').on('mouseover',function(){
	$(this).find('div').show();
});
$('.staff').on('mouseout',function(){
	$(this).find('div').hide();
});
/***********************back button****************************/
$('.back').on('click',function(){
	history.go(-1);
});

/*******************************填写邮件拒绝理由，同宿人员信息交互****************************************/
$('.guest-check-pass').on('click',showNext);
$('.check-if-email').on('click',showNext);
function showNext(){
	var checkVal = $(this).find('input[type=radio]:checked').val();
	var nextArea = $(this).parent().next();
	checkVal == 0 ? nextArea.hide() : nextArea.show();
}
$('.chose-accomadates').on('click',function(){
	var checkVal = $(this).find('input[type=radio]:checked').val();
	var nextArea = $(this).parent().next();
	checkVal == 2 ? nextArea.show() : nextArea.hide();
});

$(".modalRefresh").on("hidden.bs.modal", function() {
    $(this).removeData("bs.modal");
});
/*********************************获取当前时间**************************************/
function getNow(){
	var nowDate = new Date();
	var year = nowDate.getFullYear();
	var month = nowDate.getMonth()+1;
	var Month = month>9?month:('0'+month);
	var day = nowDate.getDate();
	var Day = day>9?day:('0'+day);
	var hour = nowDate.getHours();
	var Hour = hour>9?hour:('0'+hour);
	var minute = nowDate.getMinutes();
	var Minute = minute>9?minute:('0'+minute);
	var time = year+'-'+Month+'-'+Day+'  '+Hour+':'+Minute+':00';
	return time;
}
