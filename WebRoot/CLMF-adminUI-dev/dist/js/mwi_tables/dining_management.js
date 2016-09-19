/*
 * 用餐人数统计
 * author by wlx
 * 2015-07-29
 * */

$('.diningNorm').on('change',getDiningDetail);
function getDiningDetail(){
	/*$.ajax({
		
	})*/
	var detail = {
		"diningDate" : "2015-05-29",
		"diningTime" : "11:11:11",
		"diningNum" : "3",
		"diningAdress" : "香格里拉酒店",
		"diningSum" : "22222",
		"diningCurrent" : "1111"
	}
	$(this).parents(".query").find('input.diningDate').val(detail.diningDate);
	$(this).parents(".query").find('input.diningTime').val(detail.diningTime);
	$(this).parents(".query").find('input.diningNum').val(detail.diningNum);
	$(this).parents(".query").find('input.diningAdress').val(detail.diningAdress);
	$(this).parents(".query").find('.diningSum').text(detail.diningSum);
	$(this).parents(".query").find('.diningCurrent').text(detail.diningCurrent);

}
$('.diningNormDetail').on('change',function(){
	$(this).parents('.query').find('select.diningNorm').val("0");
});
