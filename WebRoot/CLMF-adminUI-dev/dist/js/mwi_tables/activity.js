$('.activityNorm').on('change',getDiningDetail);
function getDiningDetail(){
	/*$.ajax({
		
	})*/
	var detail = {
		"activityTheme" : "世界华文论坛及互联网",
		"activityDate" : "2015-05-29",
		"activityTime" : "11:11:11",
		"activitySum" : "3333",
		"activityCurrent" : "333",
		"activityAdress" : "香格里拉酒店"
	}
	$(this).parents(".query").find('input.activityTheme').val(detail.activityTheme);
	$(this).parents(".query").find('input.activityDate').val(detail.activityDate);
	$(this).parents(".query").find('input.activityTime').val(detail.activityTime);
	$(this).parents(".query").find('input.activityAdress').val(detail.activityAdress);
	$(this).parents(".query").find('.activitySum').text(detail.activitySum);
	$(this).parents(".query").find('.activityCurrent').text(detail.activityCurrent);
}
$('.activityNormDetail').on('change',function(){
	$(this).parents('.query').find('select.activityNorm').val("0");
});