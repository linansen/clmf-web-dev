/*
 *Readme
 * valid-sub-btn : form提交按钮
 * form-check : 使用表单按钮，加载每个需要验证的input中
 * 
 * check-null : 空值检测
 * check-email : email规范格式检测
 * check-tel : 固定电话格式检测
 * check-phone : 手机号码格式检测
 * check-personID : 身份证号检测
 * */

validfunc();
function validfunc(){
	var text = {
		_null : "不能为空",
		email : "Email格式不正确",
		tel   : "电话号码格式不正确",
		phone : "手机号码格式不正确",
		ID    : "身份证号格式不正确",
		english : "请输入正确格式(例：Xiao Ming)"
	};
	var regex = {
		email : /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,//验证Mail的正则表达式,^[a-zA-Z0-9_-]:开头必须为字母,下划线,数字
		tel   : /^0(([1-9]\d)|([3-9]\d{2}))\d{8}$/,
		phone : /^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}$/,
		ID    : /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/,
		english : /^([A-Za-z]+\s?)*[A-Za-z]$/,
		passport : /^(P\d{7}|G\d{8}|S\d{7,8}|D\d+|1[4,5]\d{7})$/
	};
	var init = {
		_init : function(){
			init._blur();
			init._form();
		},
		initHtml : function(check_text,class_text,el){
			//获取当店点击元素的事件，并生成提示语的top和left值
			var box = el.getBoundingClientRect(),
				doc = el.ownerDocument,
				body = doc.body,
				htmll = doc.documentElement,
				clientTop = htmll.clientTop || body.clientTop || 0,
				clientLeft = htmll.clientLeft || body.clientLeft || 0,
				top = box.top + (self.pageYOffset || htmll.scrollTop || body.scrollTop ) - clientTop - 170,
				left = box.left + (self.pageXOffset || htmll.scrollLeft || body.scrollLeft) - clientLeft - 240;
			var html = '<span style="text-align: left; position: absolute; width: 300px;margin-left:0px;';
			html += 'left: '+left+'px; top: '+top+'px;" class="'+class_text+' check_input">';
			html += '<span style="text-align: left; padding: 8px; min-width: 300px; color: rgb(255, 255, 255); ';
			html += '		background-color: rgba(51, 153, 204, 0.7); border: 1px solid rgb(102, 153, 204); border-radius: 5px;">'+check_text+'</span>';
			html += '<span style="padding: 0px; margin: 0px; width: 0px; height: 0px; position: absolute; border-width: 10px;';
			html += '		border-style: solid; -moz-border-top-colors: none; -moz-border-right-colors: none;';
			html += '		-moz-border-bottom-colors: none; -moz-border-left-colors: none; border-image: none;';
			html += '		border-color: rgba(51, 153, 204,0.7) transparent transparent transparent; left: 2px; top: 28px;">';
			html += '</span></span>';
			return html;
		},
		_blur : function(){
			$('.check-null').on('blur',function(){func.checkNull();}).on('focus',function(){func.removeCheck();});
			$('.check-email').on('blur',function(){func.checkEmail();}).on('focus',function(){func.removeCheck();});
			$('.check-tel').on('blur',function(){func.checkTel();}).on('focus',function(){func.removeCheck();});
			$('.check-phone').on('blur',function(){func.checkPhone();}).on('focus',function(){func.removeCheck();});
			$('.check-ID').on('blur',function(){func.checkID();}).on('focus',function(){func.removeCheck();});
			$('.check-english').on('blur',function(){func.checkEnglish();}).on('focus',function(){func.removeCheck();});
		},
		_form : function(){
			$('.valid-sub-btn').on('click',function(){
				var form = $(this).parents('form');
				var inputList = $(form).find('input');
				var flag = true;
				for(var i=0;i<inputList.length;i++){
					var formInput = inputList[i];
					console.log(formInput);
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
					}else{
						
					}
				}
				if(!flag){
					alert('请完整填写信息');
				}else{
					form.submit();
				}
				
			});
		}
	};
	var func = {
		removeCheck : function(ob){
			var theEvent = window.event || arguments.callee.caller.arguments[0];
			var that = ob ? ob : (theEvent.target ? theEvent.target : theEvent.srcElement);
			$(that).parent().find('.check_input').remove();
		},
		checkNull : function(ob){
			var theEvent = window.event || arguments.callee.caller.arguments[0];
			var that = ob ? ob : (theEvent.target ? theEvent.target : theEvent.srcElement);
			var check_text = text._null;
			var check_val = $(that).val();
			if(check_val == ""||check_val == null){
				var html = init.initHtml(check_text,'check_null',that);
				$(that).parent().append(html);
				return true;
			}else{
				return false;
			}
		},
		checkEmail : function(ob){
			var theEvent = window.event || arguments.callee.caller.arguments[0];
			var that = ob ? ob : (theEvent.target ? theEvent.target : theEvent.srcElement);
			var check_text = text.email;
			var reg = regex.email;
			var check_val = $(that).val();
			if(check_val == "" || check_val == null){
				var check_nulltext = text._null;
				var html = init.initHtml(check_nulltext,'check_null',that);
				$(that).parent().append(html);
				return true;
			}else{
				if(!(reg.test(check_val))){
					var html = init.initHtml(check_text,'check_email',that);
					$(that).parent().append(html);
					return true;
				}else{
					return false;
				}
			}
		},
		checkTel : function(ob){
			var event = window.event || arguments.callee.caller.arguments[0];
			var that = ob ? ob : (event.target ? event.target : event.srcElement);
			var check_text = text.tel;
			var reg = regex.tel;
			var check_val = $(that).val();
			if(check_val == "" || check_val == null){
				var check_nulltext = text._null;
				var html = init.initHtml(check_nulltext,'check_null',that);
				$(that).parent().append(html);
				return true;
			}else{
				if(!(reg.test(check_val))){
					var html = init.initHtml(check_text,'check_tel',that);
					$(that).parent().append(html);
					return true;
				}else{
					return false;
				}
			}
		},
		checkPhone : function(ob){
			var event = window.event || arguments.callee.caller.arguments[0];
			var that = ob ? ob : (event.target ? event.target : event.srcElement);
			var check_text = text.phone;
			var reg = regex.phone;
			var check_val = $(that).val();
			if(check_val == "" || check_val == null){
				var check_nulltext = text._null;
				var html = init.initHtml(check_nulltext,'check_null',that);
				$(that).parent().append(html);
				return true;
			}else{
				if(!(reg.test(check_val))){
					var html = init.initHtml(check_text,'check_phone',that);
					$(that).parent().append(html);
					return true;
				}else{
					return false;
				}
			}
		},
		checkID : function(ob){
			var event = window.event || arguments.callee.caller.arguments[0];
			var that = ob ? ob : (event.target ? event.target : event.srcElement);
			var check_text = text.ID;
			var reg = regex.ID;
			var regPassport = regex.passport;
			var check_val = $(that).val();
			if(check_val == "" || check_val == null){
				var check_nulltext = text._null;
				var html = init.initHtml(check_nulltext,'check_null',that);
				$(that).parent().append(html);
				return true;
			}else{
				if(!(reg.test(check_val) || regPassport.test(check_val))){
					var html = init.initHtml(check_text,'check_ID',that);
					$(that).parent().append(html);
					return true;
				}else{
					return false;
				}
			}
		},
		checkEnglish : function(ob){
			var event = window.event || arguments.callee.caller.arguments[0];
			var that = ob ? ob : (event.target ? event.target : event.srcElement);
			var check_text = text.english;
			var reg = regex.english;
			var check_val = $(that).val();
			if(check_val == "" || check_val == null){
				var check_nulltext = text._null;
				var html = init.initHtml(check_nulltext,'check_null',that);
				$(that).parent().append(html);
				return true;
			}else{
				if(!(reg.test(check_val))){
					var html = init.initHtml(check_text,'check_english',that);
					$(that).parent().append(html);
					return true;
				}else{
					return false;
				}
			}
		}
	}
	init._init();
	return func;
}
	