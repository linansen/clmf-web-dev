/******************************添加工作人员和志愿者*********************************/
//添加工作人员的按钮绑定事件
$(document).on('click','button.add_staff_btn',function(){
	var staffFrame = window.frames['matchIframe'];  //获取框架
	var _table = staffFrame.document.getElementById('choseStaff');
	var _checkbox = $(_table).find('tbody input[type=checkbox]:checked');
	var workerIds =[];
	var workerCheck = $('#choseStaff').find('a');
	for(var i=0;i<workerCheck.length;i++){
		var workerId = $(workerCheck).eq(i).attr('name');
		workerIds.push(workerId);
	}
	var html = '';
	for(var i=0;i<_checkbox.length;i++){
		var name = $(_checkbox).eq(i).parent().siblings('.chose_name').text();
		var id = $(_checkbox).eq(i).val();
		if($.inArray(id,workerIds)<0){
			html += '<a type="button" class="btn btn-default btn-sm name_btn_a" name='+id+'>'+name+'</a>';
		}
	}
	$(this).parent().siblings('.name_btn').append(html);
});

//添加志愿者按钮绑定事件
$(document).on('click','button.add_voluteer_btn',function(){
	var staffFrame = window.frames['matchIframe'];
	var _table = staffFrame.document.getElementById('choseSuppoter');
	var _checkbox = $(_table).find('tbody input[type=checkbox]:checked');
	var supporterIds = [];
	var supporterCheck = $('#choseSuppoter').find('a');
	for(var i=0;i<supporterCheck.length;i++){
		var supporterId = $(supporterCheck).eq(i).attr('name');
		supporterIds.push(supporterId);
	}
	var html = '';
	for(var i=0;i<_checkbox.length;i++){
		var name = $(_checkbox).eq(i).parent().siblings('.chose_name').text();
		var id = $(_checkbox).eq(i).val();
		if($.inArray(id,supporterIds)<0){
			html += '<a type="button" class="btn btn-default btn-sm name_btn_a" name='+id+'>'+name+'</a>';
		}
	}
	$(this).parent().siblings('.name_btn').append(html);
});

//
$(document).on('click','.name_btn a',function(){
	$(this).remove();
});

//保存按钮点击事件
$(document).on('click','button.saveChosen',function(){
	var guestCheck = $('.chose_staff_btn').parents('table').children('tbody').find('input[type=checkbox]:checked');
	var guestIds = [];
	for(var i=0;i<guestCheck.length;i++){
		var guestId = $(guestCheck).eq(i).val();
		guestIds.push(guestId);
	}
	var guestIdsStr = guestIds.toString();
	$('#chose_staff').find('input[name=guestIds]').val(guestIdsStr);
	
	var workerCheck = $('#choseStaff').find('a');
	var workerIds = [];
	var supporterCheck = $('#choseSuppoter').find('a');
	var supporterIds = [];
	for(var i=0;i<workerCheck.length;i++){
		var workerId = $(workerCheck).eq(i).attr('name');
		workerIds.push(workerId);
	}
	for(var i=0;i<supporterCheck.length;i++){
		var supporterId = $(supporterCheck).eq(i).attr('name');
		supporterIds.push(supporterId);
	}
	$('#chose_staff').find('input[name=workerIds]').val(workerIds.toString());
	$('#chose_staff').find('input[name=supporterIds]').val(supporterIds.toString());
	$(this).parents('form').submit();
});
