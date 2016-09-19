<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>MWI用户注册page</title>
		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Favicon -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/css/bootstrap.min.css">
		<!-- Font Awesome CSS -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/font-awesome-4.3.0/css/font-awesome.css" />
		<!-- Plugins -->
		<link href="${contextPath}/CLMF-frontUI-dev/css/animations.css" rel="stylesheet">
		<!-- Worthy core CSS file -->
		<link href="${contextPath}/CLMF-frontUI-dev/css/style.css" rel="stylesheet">
		<link href="${contextPath}/CLMF-frontUI-dev/css/cotmer.css" rel="stylesheet">
	</head>

	<body>

		<!-- header start -->
		<div class="header_blue  navbar navbar-fixed-top fixed-header-on " style="position: absolute;">
			<div class="container">
		
				<div class="row">
		
					<div class="col-lg-4">
		
						<!-- header-left start -->
						<!-- ================ -->
						<div class="left clearfix">
		
							<!-- logo -->
							<div class="logo smooth-scroll  ">
		
								<div class="site-name">
									<a href="#banner">
										<img id="logo" src="${contextPath}/CLMF-frontUI-dev/images/logo.png" alt="Worthy" style="width: 15%; height: 15%;" /> 第八届世界华文传媒论坛
									</a>
								</div>
								<div class="site-slogan">
									<a target="_blank" href="http://htmlcoder.me" style="color:crimson ;">
										<strong>The Eighth Forum onthe Global Chinese Language Media </strong>
									</a>
								</div>
							</div>
		
						</div>
						<!-- header-left end -->
		
					</div>
					<div class="col-lg-4">
						<p style="text-align: center; font-size:26px ;" class="lea mt20">注册主要信息</p>
					</div>
				</div>
			</div>
		</div>
		<!-- header end -->
		<div class="row-header">
			<div class="col-lg-12">
				<h2 class="page-header">&nbsp;</h2>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<div class="row-body">

			<!-- /.后台公布的邮件 -->
			<div class="col-lg-offset-2 col-lg-8" style="min-width:1200px;">
				<form action="${contextPath}/guest_register/register" class="form-horizontal row text-info  demoform" method="post" style="" plugin="datepicker">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4 class="panel-title">温馨提示：填写完毕请点击下一步，系统自动保存所填信息（带*号为必填项）</h4>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">
						<div id="formdiv_0" style="min-height: 700px;">
							<table class="table table-responsive table-hover table-striped">
								<caption>
									<div class="panel-heading text-center">
										<h4>注册须知</h4>
									</div>
								</caption>
								<tbody>
									<tr>
										<td>
											<textarea rows="15" cols="130" readonly="readonly">
第八届世界环纹传媒论坛秘书处向所有参加本次论坛的代表致以热烈的欢迎！本文件将为您注册参会提供必要的帮助。
一、注册及报到时间
会前注册截止时间： 2015年8月15日24：00
报到：2015年8月21日-8月22日
会议：2015年8月22日-8月25日
二、注册方式
论坛采用线上注册的形式, 每位参会者需单独填写一份注册表,请参会者按照网页指引填写注册信息。
三、注册确认
论坛秘书处收到您的注册表后5个工作日内，通过电子邮件向您寄发“参会注册确认函”，对注册情况予以确认。如果您在提交注册后一周内仍未收到“参会注册确认函”，请与大会秘书处联系。
四、住宿预订
本次论坛免收参会费和注册费，住宿费用参会嘉宾自理。请在注册表中“住宿安排”页面录入酒店预订信息，酒店工作人员将通过论坛会议管理平台发送“酒店预订确认函”确认您的酒店是否预订成功。
五、不可抗力
由于自然灾害、战争、暴乱、疫病或由政府或法院指令终止等不可抗力影响，论坛组委会有权推迟或取消举办“第八届世界华文传媒论坛”。
六、联系信息
如您在参会注册过程中有任何疑问，请致电大会秘书处咨询，联系人：姚敦锋，联系电话：+86 851 87989091，或发送电子邮件至guizhouluntan@chinanews.com.cn。
											</textarea>
										</td>
									</tr>
									<tr><td><label><input type="checkbox" class="hadRead">我已阅读注册须知</label></td></tr>
								</tbody>
							</table>
							<div class="col-lg-12 text-center" style="position: absolute;top: 730px;">
								<button type="button" class="btn btn-primary mr10" disabled="disabled">上一步</button>
								<button type="button" class="btn btn-primary nextTo1">下一步</button>
							</div>
						</div>
						<div id="formdiv_1" class="my-hidden" style="min-height: 700px;">
							<table class="table table-responsive table-hover table-striped">
								<caption>
									<div class="panel-heading text-center">
										<h4>嘉宾信息</h4>
									</div>
								</caption>
								<tbody>
									<tr>
										<td class="text-right" width="20%"><span class="red-text">*</span>中文姓名：</td>
										<td class="text-left" width="30%">
											<input type="text" name="guest.chinese_name" placeholder="请输入中文姓名" value="" class="check-null"/>
										</td>
										<!--中文用户名开始--->
										<td class="text-right" width="20%"><span class="red-text">*</span>英文姓名/拼音：</td>
										<td class="text-left" width="30%">
											<input type="text" name="guest.english_name" placeholder="请输入英文姓名(例：Xiao Ming)" value="" class="check-english"/>
										</td>
									<!--中文用户名结束--->
									</tr>
									<tr>
									<!--性别开始-->
										<td class="text-right"><span class="red-text">*</span>性别：</td>
										<td class="text-left">
											<label><input type="radio" name="guest.sex" value="1" checked="checked" />男</label>
											<label class="ml20"><input type="radio" name="guest.sex" value="2" />女</label>
										</td>
									<!--性别结束-->
									<!--护照身份证开始--->
										<td class="text-right">出生日期：</td>
										<td class="text-left">
											<input type="text" name="guest.birthday" placeholder="请选择出生日期" value=""  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
										</td>
									<!--护照身份证结束--->
									</tr>
									<tr>
										<td class="text-right"><span class="red-text">*</span>国籍：</td>
										<td class="text-left">
											<select name="guest.national" class="check-null">
												<option value="">请选择</option>
												<c:forEach items="${countryList}" var="c">
													<option value="${c.zh_country_name}">${c.zh_country_name}</option>
												</c:forEach>
											</select>
										</td>
										<td class="text-right"><span class="red-text">*</span>护照/身份证号：</td>
										<td class="text-left">
											<input type="text" name="guest.passport_no" placeholder="请输入护照/身份证号" value="" class="check-ID"/>
										</td>
									</tr>
									<tr>
										<!--国家地区开始--->
										<td class="text-right"><span class="red-text">*</span>工作地区：</td>
										<td class="text-left">
											<select name="guest.work_area" class="check-null">
												<option value="">请选择</option>
												<c:forEach items="${countryList}" var="c">
													<option value="${c.zh_country_name}">${c.zh_country_name}</option>
												</c:forEach>
											</select>
										</td>
									<!--国家地区结束--->
									<!--机构名称开始--->
										<td class="text-right"><span class="red-text">*</span>单位及职务：</td>
										<td class="text-left">
											<input type="text" name="guest.post" placeholder="请输入单位及职务" value="" class="check-null"/>
										</td>
									<!---机构名称结束--->
									</tr>
									<tr>
									<!--联系电话开始--->
										<td class="text-right">联系电话：</td>
										<td class="text-left">
											<input type="text" name="guest.phone" placeholder="请输入联系电话" value=""/>
										</td>
										<!--联络手机电话开始--->
										<td class="text-right">联系手机：</td>
										<td class="text-left">
											<input type="text" name="guest.mobile" placeholder="请输入联系手机" value=""/>
										</td>
									<!---联络手机电话结束--->
									</tr>
									<tr>
										<td class="text-right">大陆手机号：</td>
										<td class="text-left">
											<input type="text" name="guest.phoneInMainLand" placeholder="请输入大陆手机号" value=""/>
										</td>
										<td class="text-right">微信号：</td>
										<td class="text-left">
											<input type="text" name="guest.wechat_username" placeholder="请输入微信号" value=""/>
										</td>
									</tr>
									<tr>
									<!--电子邮箱开始--->
										<td class="text-right"><span class="red-text">*</span>电子邮箱：</td>
										<td class="text-left">
											<input type="text" name="guest.email" placeholder="请输入电子邮件" value="" class="check-email" onblur="checkEmail(this);"/>
										</td>
									<!---电子邮件结束--->
									<!--地址开始--->
										<td class="text-right">地址：</td>
										<td class="text-left">
											<input type="text" name="guest.address" placeholder="请输入地址" value=""/>
										</td>
									<!---地址结束--->
									<!---联系电话结束--->
									</tr>
									<tr>
									<!--邮编开始--->
										<td class="text-right">邮编：</td>
										<td class="text-left">
											<input type="text" name="guest.zip_code" placeholder="请输入邮编" value=""/>
										</td>
										<!--联络人开始--->
										<td class="text-right">传真：</td>
										<td class="text-left">
											<input type="text" name="guest.fax" placeholder="请输入传真号" value=""/>
										</td>
									<!---联络人结束--->
									</tr>
									<tr>
										<td class="text-right">联络人：</td>
										<td class="text-left">
											<input type="text" name="guest.cp_name" placeholder="请输入联络人" value=""/>
										</td>
										<td></td>
										<td></td>
									</tr>
									<tr>
									<!--联络人电话开始--->
										<td class="text-right">联络人电话：</td>
										<td class="text-left">
											<input type="text" name="guest.cp_phone" placeholder="请输入联络人电话" value=""/>
										</td>
									<!---联络人电话结束--->
									<!--联络人邮件开始--->
										<td class="text-right">联络人电子邮箱：</td>
										<td class="text-left">
											<input type="text" name="guest.cp_email" placeholder="请输入联络人邮箱" value=""/>
										</td>
									<!---联络人邮件结束--->
									</tr>
									<!---联络人邮件结束--->
								</tbody>
							</table>
							<div class="col-lg-12 text-center" style="position: absolute;top: 730px;">
								<button type="button" class="btn btn-primary mr10 nextTo0">上一步</button>
								<button type="button" class="btn btn-primary nextTo2">下一步</button>
							</div>
						</div>
						<div id="formdiv_2" class="my-hidden" style="min-height: 700px;">
							<table class="table table-responsive table-hover table-striped">
								<caption>
									<div class="panel-heading text-center">
										<h4>行程安排</h4>
									</div>
								</caption>
								<tbody>
									<tr>
										<td class="text-right">抵达日期：</td>
										<td>
											<input type="text" placeholder="请选择抵达日期"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" name="gt.arrival_date"/>
										</td>
										<td class="text-right">抵达时间：</td>
										<td>
											<input type="text" placeholder="请选择抵达时间"  onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})" name="gt.arrival_time"/>
										</td>
									</tr>
									<tr>
										<td class="text-right">抵达站点：</td>
										<td>
											<input type="text" placeholder="请输入抵达站点" class="" id="" name="gt.arrival_station"/>
										</td>
										<td class="text-right">抵达航班（车次）：</td>
										<td>
											<input type="text" placeholder="请输入抵达航班(车次)" class="" id="" name="gt.arrival_shift_no"/>
										</td>
									</tr>
									<tr><td colspan="4">&nbsp;</td></tr>
									<tr>
										<td class="text-right">离开日期：</td>
										<td>
											<input type="text" placeholder="请选择离开日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" name="gt.leave_date"/>
										</td>
										<td class="text-right">离开时间：</td>
										<td>
											<input type="text" placeholder="请选择离开时间" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})" name="gt.leave_time"/>
										</td>
									</tr>
									<tr>
										<td class="text-right">离开站点：</td>
										<td>
											<input type="text" placeholder="请输入离开站点" class="" id="" name="gt.leave_station"/>
										</td>
										<td  class="text-right">离开航班（车次）：</td>
										<td>
											<input type="text" placeholder="请输入离开航班(车次)" class="" id="" name="gt.leave_shift_no"/>
										</td>
									</tr>
									<tr>
										<td class="text-right">离境城市：</td>
										<td><input type="text" placeholder="请输入离境城市" class="" id="" name="gt.leave_city"/></td>
										<td></td>
										<td></td>
									</tr>
									
								</tbody>
							</table>
							<div class="col-lg-12 text-center" style="position: absolute;top: 730px;">
								<button type="button" class="btn btn-primary mr10 nextTo1">上一步</button>
								<button type="button" class="btn btn-primary nextTo3">下一步</button>
							</div>
						</div>
						<div id="formdiv_3" class="my-hidden" style="min-height: 700px;">
							<table class="table table-responsive table-hover table-striped">
								<caption>
									<div class="panel-heading text-center">
										<h4>城市参观</h4>
									</div>
								</caption>
								<tbody>
									<tr>
										<td style="padding-left: 10px;width: 30%" class="visitCityTd">
											是否参观城市：
											<label>
												<input type="radio" name="guest.toActiv" value="1"/>是
											</label>
											<label class="ml30">
												<input type="radio" name="guest.toActiv" value="0" checked="checked" class="noVisitCity"/>否
											</label>
										</td>
										<td>
											
										</td>
									</tr>
									<tr style="display:none;">
										<td colspan="2">
											<table class="table table-responsive table-hover table-striped" style="margin: 0;width: 100%;">
												<caption>
													<div class="col-lg-offset-1">
														<h4>参观地点：</h4>
													</div>
												</caption>
												<tbody>
													<tr class="cityLine">
														<td width="30%"></td>
														<td class="text-left">
															<div>
																<p>8月23号：</p>
																<c:forEach items="${routeList}" var="rl23">
																	<c:if test="${rl23.route_start_time == '2015-08-23'}">
																		<label class="ml20">
																			<input type="checkbox" name="am.guest_id" value="${rl23.id}">
																			${rl23.route_content }
																		</label>
																	</c:if>
																</c:forEach>
															</div>
															<div>
																<p>8月24号：</p>
																<c:forEach items="${routeList}" var="rl">
																	<c:if test="${rl.route_start_time == '2015-08-24'}">
																		<label class="ml20">
																			<input type="checkbox" name="am.guest_id" value="${rl.id}">
																			${rl.route_content }
																		</label>
																	</c:if>
																</c:forEach>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="col-lg-12 text-center" style="position: absolute;top: 730px;">
								<button type="button" class="btn btn-primary mr10 nextTo2">上一步</button>
								<button type="button" class="btn btn-primary nextTo4">下一步</button>
							</div>
						</div>
						<div id="formdiv_4" class="my-hidden" style="min-height: 700px;">
							<table class="table table-responsive table-hover table-striped">
								<caption>
									<div class="panel-heading text-center">
										<h4>住宿安排</h4>
									</div>
								</caption>
								<tbody>
									<tr>
										<td  class="text-right" width="15%">入住日期:</td>
										<td width="35%"><input type="text" name="hm.checkin_time" placeholder="请选择入住日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
										<td class="text-right" width="15%">离店日期：</td>
										<td width="35%"><input type="text" name="hm.checkout_time" placeholder="请选择离店日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
									</tr>
									<tr>
										<td class="text-right">是否需要无烟楼层：</td>
										<td>
											<label><input type="radio" name="hm.is_smoking" value="0" />吸烟楼层</label>
											<label><input type="radio" name="hm.is_smoking" value="1" />不吸烟楼层</label>
										</td>
										<td class="text-right"></td>
										<td></td>
									</tr>
									<tr>
										<td class="text-right">入住房型：</td>
										<td>
											<label><input type="radio" name="hm.room_id" value="1"/>高级单人房</label>
											<label><input type="radio" name="hm.room_id" value="2"/>高级双人房</label>
										</td>
										<td class="text-right">同宿人员安排：</td>
										<td class="chose-accomadates">
											<label><input type="radio" name="hm.with_roommate" value="2"/>指定同宿人员</label>
											<label><input type="radio" name="hm.with_roommate" checked="checked" value="0"/>不与其他人员同宿</label>
											<label><input type="radio" name="hm.with_roommate" value="1"/>大会随机分配同宿人员</label>
										</td>
									</tr>
									<tr style="display: none;">
										<td colspan="4">
											<table  width="100%" class="inner-table">
												<tr>
													<td width="15%" class="text-right">
														姓名：
													</td>
													<td width="35%">
														<input type="text" class="form-control" id="rmName" name="hm.roommate_name" placeholder="请输入同宿人员姓名" value="" />
													</td>
													<td class="text-right" width="15%">
														身份证/护照号码：
													</td>
													<td width="35%">
														<input type="text" class="form-control" id="rm_idNo" name="hm.roommate_idNo" placeholder="请输入身份证/护照号码" value="" />
													</td>
													<td><button type="button" onclick="checkRoommate();" class="btn btn-primary">验证嘉宾</button></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td  class="text-right">
											饮食禁忌：
										</td>
										<td colspan="3" class="text-left">
											<label>
												<input type="radio" name="guest.diatHab" value="1" checked="checked"> 无特殊饮食习惯
											</label>
											<label>
												<input type="radio" name="guest.diatHab" value="2">素食
											</label>`1
											<label>
												<input type="radio" name="guest.diatHab" value="3">清真
											</label>
											<label>
												<input type="radio" name="guest.diatHab" value="4">其他
												<input type="text" class="" name="guest.diatDesc" placeholder="其他饮食习惯">
											</label>
											
										</td>
									</tr>
									<tr>
										<td class="text-right">是否需要医疗设备辅助：</td>
										<td colspan="3" class="ifNeedDevice text-left">
											<label class="mr20"><input type="radio" name="needDevice" value="0">否</label>
											<label class="mr20"><input type="radio" name="needDevice" value="1">是</label>
											<label class="my-hidden deviceName">
												<input type="text" placeholder="医疗辅助设备名称" style="width:200px;">
											</label>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="col-lg-12 text-center" style="position: absolute;top: 730px;">
								<button type="button" class="btn btn-primary mr10 nextTo3">上一步</button>
								<button type="button" class="btn btn-primary nextTo5">下一步</button>
							</div>
						</div>
						<div id="formdiv_5" class="my-hidden" style="min-height: 700px;">
							<table class="table table-responsive table-hover table-striped">
								<caption>
									<div class="panel-heading text-center">
										<h4>签证申请</h4>
									</div>
								</caption>
								<tbody>
									<tr>
										<td style="padding-left: 10px;width: 50%" class="visaTd">
											是否申请签证：
											<label>
												<input type="radio" name="guest.toVisa" checked="checked" value="0"/>否
											</label>
											<label class="ml30">
												<input type="radio" name="guest.toVisa" value="1"/>是，请单独填写《中国签证邀请信信息表》
											</label>
										</td>
										<td>
											
										</td>
									</tr>
									<tr style="display:none;">
										<td colspan="2">
											<table class="table table-responsive table-hover table-striped" style="margin: 0;width: 100%;">
												<caption>
													<div class="text-center">
														<h4>Info About Visa in China</h4>
													</div>
												</caption>
												<tbody>
													<tr>
														<td class="text-right">是否申请中国签证：</td>
														<td>是</td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td class="text-right">代表团名称：</td>
														<td>
															<input type="text" name="gv.group_name" placeholder="请输入代表团名称" class="form-control" disabled="disabled"/>
														</td>
														<td class="text-right">性别：</td>
														<td>
															<label><input type="radio" name="gv.sex" value="1" checked="checked"  disabled="disabled"/>男</label>
															<label class="ml30"><input type="radio" name="gv.sex" value="2"  disabled="disabled"/>女</label>
														</td>
													</tr>
													<tr>
														<td class="text-right">出生日期：</td>
														<td>
															<input type="text" placeholder="请选择出生日期" name="gv.birth_date" class="form-control" disabled="disabled"/>
														</td>
														<td class="text-right">国籍：</td>
														<td>
															<input type="text" placeholder="请输入国籍" name="gv.nationality" class="form-control" disabled="disabled"/>
														</td>
													</tr>
													<tr>
														<td class="text-right">职业：</td>
														<td>
															<input type="text" placeholder="请输入职业" name="gv.post" class="form-control" disabled="disabled"/>
														</td>
														<td class="text-right">工作单位：</td>
														<td>
															<input type="text" placeholder="请输入工作单位" name="gv.organ_name" class="form-control " disabled="disabled"/>
														</td>
													</tr>
													<tr>
														<td class="text-right">护照号码：</td>
														<td>
															<input type="text" placeholder="请输入护照号码" name="gv.passport_no" class="form-control" disabled="disabled"/>
														</td>
														<td class="text-right">护照有效期至：</td>
														<td>
															<input type="text" placeholder="请选择护照有效期" name="gv.passport_valid_date" class="form-control" disabled="disabled"/>
														</td>
													</tr>
													<tr>
														<td class="text-right">电子邮箱：</td>
														<td>
															<input type="text" placeholder="请输入电子邮箱" name="gv.email" class="form-control " disabled="disabled"/>
														</td>
														<td class="text-right">传真：</td>
														<td>
															<input type="text" placeholder="请输入传真" name="gv.fax" class="form-control " disabled="disabled"/>
														</td>
													</tr>
													<tr>
														<td class="text-right">联系地址：</td>
														<td>
															<input type="text" placeholder="请输入联系地址" name="gv.contact_address" class="form-control " disabled="disabled"/>
														</td>
														<td class="text-right">入境日期：</td>
														<td>
															<input type="text" placeholder="请选择入籍日期" name="gv.entry_date" class="form-control" disabled="disabled"/>
														</td>
													</tr>
													<tr>
														<td class="text-right">预计中国境内逗留天数：</td>
														<td>
															<input type="text" placeholder="请输入逗留天数" name="gv.stay_days" class="form-control " disabled="disabled"/>
														</td>
														<td class="text-right">签发地点：</td>
														<td>
															<input type="text" placeholder="请输入签发地点" name="gv.issue_place" class="form-control " disabled="disabled"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="col-lg-12 text-center" style="position: absolute;top: 730px;">
								<button type="button" class="btn btn-primary mr10 nextTo4">上一步</button>
								<button type="button" class="btn btn-primary submit">提交注册</button>
							</div>
						</div>
					</div>
					<!-- /.panel-body -->
				</div>
				</form>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->

		</div>

		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script src="${contextPath}/CLMF-frontUI-dev/plugins/jquery.min.js"></script>
		<!--<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>-->
		<script src="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
		
		<script src="${contextPath}/CLMF-frontUI-dev/plugins/My97DatePicker/WdatePicker.js"></script>
		<!-- Modernizr javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/modernizr.js"></script>
		<!-- Isotope javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/isotope/isotope.pkgd.min.js"></script>
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/jquery.backstretch.min.js"></script>
		<!-- Appear javascript -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/jquery.appear.js"></script>
		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/template.js"></script>
		<!-- Custom Scripts -->
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/custom.js"></script>
		
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/valid.js"></script>
		<script>
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			$('.submit').on('click',function(){
				
				$(this).parents('form').submit();
				
				/* $.post(getProjectName()+"/guest_register/register", {$(this).parents('form').serialize()}, function(data){
					alert(data.status);
				}); */
			});
			$('.noVisitCity').on('click',function(){
				var cityLineInput = $('.cityLine').find('input[type=checkbox]');
				for(var i=0;i<cityLineInput.length;i++){
					$(cityLineInput).eq(i).removeAttr('checked');
				}
			});
			$('.ifNeedDevice').on('click',function(){
				var value = $(this).find('input[type=radio]:checked').val();
				var deviceName = $(this).find('.deviceName');
				value == 1 ? $(deviceName).show() : $(deviceName).hide();
			});
			
			function checkEmail(ev){
				var email = $(ev).val();
				if(email.length > 0){
					$.post("${contextPath}/guest_register/checkEmail",{email:email},function(data){
						if(!data){
							alert("邮箱已使用！");
							$(ev).val("");
						}
					});
				}
			}
			
			function checkRoommate(){
				var rmName = $("#rmName").val();
				var rm_idNo = $("#rm_idNo").val();
				if(rmName.length > 0 && rm_idNo.length > 0){
					$.post("${contextPath}/guest_register/checkRoommate",{name:rmName,passportNo:rm_idNo},function(data){
						if(data){
							alert("可以与其同为室友！");
						}else{
							alert("查无此人！");
						}
					});
				}
			}
		</script>
	</body>

</html>