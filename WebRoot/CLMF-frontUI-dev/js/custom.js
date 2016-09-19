/* Theme Name: Worthy - Free Powerful Theme by HtmlCoder
 * Author:HtmlCoder
 * Author URI:http://www.htmlcoder.me
 * Version:1.0.0
 * Created:November 2014
 * License: Creative Commons Attribution 3.0 License (https://creativecommons.org/licenses/by/3.0/)
 * File Description: Place here your custom scripts
 */
$(function(){
	var func = validfunc();
	/************************注册页面****************************/
	$('.nextTo0').on('click',function(){
		stepTo(0);
	});
	$('.nextTo1').on('click',function(){
		var hasRead = $('.hadRead');
		if(hasRead){
			if($(hasRead).is(':checked')){
				stepTo(1);
			}else{
				alert('请先阅读注册须知！');
			}
		}else{
			stepTo(1);
		}
		
	});
	$('.nextTo2').on('click',function(){
		var inputList = $('#formdiv_1').find('input');
		var flag = true;
		for(var i=0;i<inputList.length;i++){
			var formInput = inputList[i];
			if($(formInput).hasClass('check-null')){
				if(func.checkNull(formInput)){
					flag = false;
				}
			}else if($(formInput).hasClass('check-email')){
				if(func.checkEmail(formInput)){
					flag = false;
				}
			}else if($(formInput).hasClass('check-tel')){
				if(func.checkTel(formInput)){
					flag = false;
				}
			}else if($(formInput).hasClass('check-phone')){
				if(func.checkPhone(formInput)){
					flag = false;
				}
			}else if($(formInput).hasClass('check-ID')){
				if(func.checkID(formInput)){
					flag = false;
				}
			}else if($(formInput).hasClass('check-english')){
				if(func.checkEnglish(formInput)){
					flag = false;
				}
			}else{
				
			}
		}
		var selectList = $('#formdiv_1').find('select.check-null');
		for(var i=0;i<selectList.length;i++){
			var select = selectList[i];
			console.log($(select).val());
			if(func.checkNull(select)) flag = false;
		}
		if(!flag){
			alert('请完整填写信息');
		}else{
			stepTo(2);
		}
	});
	$('.nextTo3').on('click',function(){
		stepTo(3);
	});
	$('.nextTo4').on('click',function(){
		stepTo(4);
	});
	$('.nextTo5').on('click',function(){
		stepTo(5);
	});
	function stepTo(num){
		$("#formdiv_" + num).css("display", "block");
		var i = num+1;
		for (; i < num + 6; i++) {
			var str = "#formdiv_" + (i % 6 + "");
			$(str).css("display", "none");
		}
	}
	/*************地址选择框*****************//*
	initCountry();
	$('#country').on('change',function(){
		var countryValue = $('#country').val();
		if(countryValue == 1){
			showSelect('province',1);
			showSelect('city',1);
			initProvince();
			initCity();
		}else{
			showSelect('province',0);
			showSelect('city',0);
		}
	});
	$('#province').on('change',function(){
		initCity();
	});*/
	//根据国家联动省份和城市
	function showSelect(id,state){
		if(state){
			$('#'+id).show();
		}else{
			$('#'+id).hide();
		}
	}
	//初始化国家
	function initCountry(){
		var data = [{"countryValue":"1","country":"中国"},{"countryValue":"2","country":"American"},{"countryValue":"3","country":"España"},{"countryValue":"4","country":"россия"},{"countryValue":"4","country":"россия"}];
		var html = '<option value="0">所有国家</option>';
		for(var i=0;i<data.length;i++){
			html += '<option value="'+data[i].countryValue+'">'+data[i].country+'</option>';
		}
		$('#country').empty();
		console.log(html);
		$('#country').append(html);
	}
	//初始化省份
	function initProvince(){
		var data = [{"provinceValue":"1","province":"广东"},{"provinceValue":"1","province":"广东"},{"provinceValue":"1","province":"广东"},{"provinceValue":"1","province":"广东"},{"provinceValue":"1","province":"广东"}];
		var html = '<option value="0">所有省份</option>';
		for(var i=0;i<data.length;i++){
			html += '<option value="'+data[i].provinceValue+'">'+data[i].province+'</option>';
		}
		$('#province').empty().html(html);
	}
	//初始化城市
	function initCity(){
		var data = [{"cityValue":"1","city":"广州"},{"cityValue":"1","city":"广州"},{"cityValue":"1","city":"广州"},{"cityValue":"1","city":"广州"},{"cityValue":"1","city":"广州"}];
		var html = '<option value="0">所有城市</option>';
		for(var i=0;i<data.length;i++){
			html += '<option value="'+data[i].cityValue+'">'+data[i].city+'</option>';
		}
		$('#city').empty().html(html);
	}
	/*************地址选择框end*****************/
	/*************时间插件*****************/
	$('.chose-accomadates').on('click',function(){
		var checkVal = $(this).find('input[type=radio]:checked').val();
		var nextArea = $(this).parent().next();
		checkVal == 2 ? nextArea.show() : nextArea.hide();
	});
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
	/*************时间插件end*****************/
	/******************tabel-tooltip**********************/
	$('.staff').on('mouseover',function(){
		$(this).find('div.table-tooltip').show();
	});
	$('.staff').on('mouseout',function(){
		$(this).find('div.table-tooltip').hide();
	});
	/************************注册页面end****************************/
	$('.filters').on( 'click', 'ul.nav li a', function() {
		var filterValue = $(this).attr('data-filter');
		$(this).parents(".filters").find("li.active").removeClass("active");
		$(this).parent().addClass("active");
	});
	$('.visaTd').on('click',showNext0);
	$('.visitCityTd').on('click',showNext0);
	function showNext0(){
		var checkVal = $(this).find('input[type=radio]:checked').val();
		var nextArea = $(this).parent().next();
		checkVal == 0 ? nextArea.hide() : nextArea.show();
	}
	function showNext1(){
		var checkVal = $(this).find('input[type=radio]:checked').val();
		var nextArea = $(this).parent().next();
		checkVal == 1 ? nextArea.hide() : nextArea.show();
	}
});
