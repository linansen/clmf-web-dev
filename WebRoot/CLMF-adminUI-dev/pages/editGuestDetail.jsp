<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>嘉宾详细信息编辑</title>
	</head>

	<body>
		<div class="modal-content">
			<form action="${contextPath}/guestInfo/editGuest" method="post" id="form_edit_guest">
			<input type="hidden" name="flag" value="${flag}" id="hid_flag"/>
			<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">

				<h5 class="modal-title pull-left white-text" id="myModalLabel">编辑嘉宾信息</h5>
				<div class="pull-right btn-group-sm ">
					<button type="button" onclick="submitForm();" class="btn btn-success">保存<span class="fa fa-save"></span></button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
				</div>

			</div>

			<div class="modal-body">
				<ul id="myTab1" class="nav nav-tabs ">
					<li class="active"><a href="#edit_info_guest" data-toggle="tab">个人信息</a></li>
					<li><a href="#edit_passport_about_guest" data-toggle="tab">签证信息</a></li>
					<li><a href="#edit_activity_about_guest" data-toggle="tab">活动安排</a></li>
					<li><a href="#edit_accomodation_about_guest" data-toggle="tab">住宿安排</a></li>
					<li><a href="#edit_traval_about_guest" data-toggle="tab">行程安排</a></li>
				</ul>
	
				<div id="myTabContent1" class="tab-content">
					<input type="hidden" name="guestInfor.id" value="${guestInfor.gi_id}"/>
					<div class="tab-pane fade in active row-body" id="edit_info_guest">
	
						<table class="table table-hover table-striped table-responsive">
							<tbody>
								<tr>
									<!--姓名开始--->
									<td>英文姓名：</td>
									<td>
										<input type="text" name="guestInfor.english_name" placeholder="请输入英文姓名"  value="${guestInfor.english_name}" style="width: 100%;" />
									</td>
									<!--姓名结束--->
									<!--中文用户名开始--->
									<td>中文姓名：</td>
									<td>
										<input type="text" name="guestInfor.chinese_name"  placeholder="请输入中文姓名" value="${guestInfor.chinese_name}" style="width: 100%;" />
									</td>
									<!--中文用户名结束--->
								</tr>
								
								<tr>
									<!--职务开始--->
									<td>单位及职务：</td>
									<td>
										<input type="text" name="guestInfor.post" placeholder="请输入职务" value="${guestInfor.post}" style="width: 100%;" />
									</td>
									<!---职务结束--->
									<!--性别开始-->
									<td>性别：</td>
									<td>
										<c:choose>
											<c:when test="${guestInfor.sex == 1}">
												<label><input type="radio" name="guestInfor.sex" value="1" checked="checked"/>男</label>
												<label><input type="radio" name="guestInfor.sex" value="2" />女</label>
											</c:when>
											<c:when test="${guestInfor.sex == 2}">
												<label><input type="radio" name="guestInfor.sex" value="1" />男</label>
												<label><input type="radio" name="guestInfor.sex" value="2" checked="checked" />女</label>
											</c:when>
											<c:otherwise>
												<label><input type="radio" name="guestInfor.sex" value="1" />男</label>
												<label><input type="radio" name="guestInfor.sex" value="2"/>女</label>
											</c:otherwise>
										</c:choose>
									</td>
									<!--性别结束-->
								</tr>
								<tr>
									<!--护照身份证开始--->
									<td>护照/身份证：</td>
									<td>
										<input type="text" name="guestInfor.passport_no"  placeholder="请输入护照/身份证号" value="${guestInfor.passport_no}" style="width: 100%;" />
									</td>
									<!--护照身份证结束--->
									<!--国家地区开始--->
									<td>国家地区：</td>
									<td>
										<select id="guest_country_email" name="guestInfor.national" class="check-null">
											<option value="">请选择</option>
											<c:forEach items="${countryList}" var="c">
												<c:choose>
													<c:when test="${guestInfor.national == c.zh_country_name}">
														<option value="${c.zh_country_name}" selected="selected">${c.zh_country_name}</option>
													</c:when>
													<c:otherwise>
														<option value="${c.zh_country_name}">${c.zh_country_name}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</td>
									<!--国家地区结束--->
								</tr>
								<!--机构名称开始--->
								<tr>
									<td>机构英文名称(单位)：</td>
									<td>
										<input type="text" name="guestInfor.en_organ_name" placeholder="请输入机构英文名称" value="${guestInfor.en_organ_name}" style="width: 100%;" />
									</td>
									<!--机构中文名称开始--->
									<td>机构中文名称：</td>
									<td>
										<input type="text" name="guestInfor.ch_organ_name" placeholder="请输入机构中文名称" value="${guestInfor.ch_organ_name }" style="width: 100%;" />
									</td>
									<!---机构中文名称结束--->
								</tr>
								<!---机构名称结束--->
								<!--联系电话开始--->
								<tr>
									<td>联系电话：</td>
									<td>
										<input type="text" name="guestInfor.phone"  placeholder="请输入联系电话" value="${guestInfor.phone}" style="width: 100%;" />
									</td>
									<!--联络手机电话开始--->
									<td>联系手机号码：</td>
									<td>
										<input type="text" name="guestInfor.mobile"  placeholder="请输入手机号码" value="${guestInfor.mobile}" style="width: 100%;" />
									</td>
									<!---联络手机电话结束--->
								</tr>
								<!---联系电话结束--->
								<!--电子邮箱开始--->
								<tr>
									<td>电子邮箱：</td>
									<td>
										<input type="text" name="guestInfor.email" placeholder="请输入电子邮箱"  value="${guestInfor.email}" style="width: 100%;" />
									</td>
									<td>国籍：</td>
									<td>
										<select>
											<option>所有国家</option>
										</select>
									</td>
								</tr>
								<!---电子邮件结束--->
	
								<!--地址开始--->
								<tr>
									<td>地址：</td>
									<td>
										<input type="text" name="guestInfor.address" placeholder="请输入地址" value="${guestInfor.address}" style="width: 100%;" />
									</td>
									<!--邮编开始--->
									<td>邮编：</td>
									<td>
										<input type="text" name="guestInfor.zip_code" placeholder="请输入邮编" value="${guestInfor.zip_code}" style="width: 100%;" />
									</td>
									<!---邮编结束--->
								</tr>
								<!---地址结束--->
	
								
	
								<!--联络人开始--->
								<tr>
									<td>联络人：</td>
									<td>
										<input type="text" name="guestInfor.cp_name" placeholder="请输入联络人姓名" value="${guestInfor.cp_name}" style="width: 100%;" />
									</td>
									<!--联络人电话开始--->
									<td>联络人电话：</td>
									<td>
										<input type="text" name="guestInfor.cp_phone" placeholder="请输入联络人电话" value="${guestInfor.cp_phone}" style="width: 100%;" />
									</td>
									<!---联络人电话结束--->
								</tr>
								<!---联络人结束--->
								<!--联络人邮件开始--->
								<tr>
									<td>联络人电子邮箱：</td>
									<td>
										<input type="text" name="guestInfor.cp_email" placeholder="请输入联络人邮箱" value="${guestInfor.cp_email}" style="width: 100%;" />
									</td>
									<td></td>
									<td></td>
								</tr>
								<!---联络人邮件结束--->
	
							</tbody>
	
						</table>
	
					</div>
	
					<div class="tab-pane fade row-body" id="edit_passport_about_guest">
						<input type="hidden" name="visa.id" value="${guestInfor.visa_id}"/>
						<table class="table table-striped  table-hover table-responsive text-right">
							<caption class="text-center">
								<div>
									<c:choose>
										<c:when test="${guestInfor.toVisa == 1}">
											<label><input type="radio" id="passport_ok" name="guestInfor.toVisa" value="1" checked="checked">需要申请签证</label>
											<label><input type="radio" id="passport_no" name="guestInfor.toVisa" value="0" class="ml20">不需要申请签证</label>
										</c:when>
										<c:otherwise>
											<label><input type="radio" id="passport_ok" name="guestInfor.toVisa" value="1">需要申请签证</label>
											<label><input type="radio" id="passport_no" name="guestInfor.toVisa" value="0" class="ml20" checked="checked"/>不需要申请签证</label>
										</c:otherwise>
									</c:choose>
								</div>
							</caption>
							<tbody>
								<tr>
									<td width="20%">名：</td>
									<td width="30%">
										<input type="text" name="visa.given_name" placeholder="请输入名字" value="${guestInfor.given_name}" style="width: 100%;"/>
									</td>
									<td width="20%">姓：</td>
									<td width="30%">
										<input type="text" name="visa.surname" placeholder="请输入姓" value="${guestInfor.surname}"  style="width: 100%;"/>
									</td>
								</tr>
								<tr>
									<td>性别：</td>
									<td>
										<c:choose>
											<c:when test="${guestInfor.visa_sex == 1}">
												<input type="radio" name="visa.sex" value="1" checked="checked" />男
												<input type="radio" name="visa.sex" value="2" />女
											</c:when>
											<c:when test="${guestInfor.visa_sex == 2}">
												<input type="radio" name="visa.sex" value="1" />男
												<input type="radio" name="visa.sex" value="2" checked="checked" />女
											</c:when>
											<c:otherwise>
												<input type="radio" name="visa.sex" value="1" />男
												<input type="radio" name="visa.sex" value="2" />女
											</c:otherwise>
										</c:choose>
									</td>
									<td>出生日期：</td>
									<td>
										<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" name="visa.birth_date" placeholder="请输入出生日期" value="${guestInfor.birth_date}" style="width: 100%;">
									</td>
								</tr>
								<tr>
									<td>职业：</td>
									<td>
										<input type="text" name="visa.post" placeholder="请输入职业" value="${guestInfor.visa_post}" style="width: 100%;"/>
									</td>
									<td>国籍：</td>
									<td>
										<input type="text" name="visa.nationality" placeholder="请输入国籍" value="${guestInfor.nationality}" style="width: 100%;"/>
										<!-- <select name="guest_country">
											<option value="中国">中国</option>
											<option value="中国">中国</option>
											<option value="中国">中国</option>
											<option value="中国">中国</option>
											<option value="中国">中国</option>
											<option value="中国">中国</option>
											<option value="中国">中国</option>
											<option value="中国">中国</option>
										</select> -->
									</td>
								</tr>
	
								<tr>
									<td>机构：</td>
									<td>
										<input type="text" name="visa.organ_name" placeholder="请输入机构名称" value="${guestInfor.organ_name}" style="width: 100%;"/>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>护照号码：</td>
									<td>
										<input type="text" name="visa.passport_no" placeholder="请输入护照号码" value="${guestInfor.visa_passport_no}" style="width: 100%;"/>
									</td>
									<td>护照有效日期：</td>
									<td>
										<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" name="visa.passport_valid_date" placeholder="请输入护照有效日期" value="${guestInfor.passport_valid_date}" style="width: 100%;">
									</td>
								</tr>
	
								<tr>
									<td>电子邮箱：</td>
									<td>
										<input type="text" name="visa.email" placeholder="请输入电子邮箱" value="${guestInfor.visa_email}" style="width: 100%;" />
									</td>
									<td>传真：</td>
									<td>
										<input type="text" name="visa.fax" placeholder="请输入传真" value="${guestInfor.visa_fax}" style="width: 100%;" />
									</td>
								</tr>
	
								<tr>
									<td>联系地址：</td>
									<td>
										<input type="text" name="visa.contact_address" placeholder="请输入联系地址" value="${guestInfor.contact_address}" style="width: 100%;" />
									</td>
									<td>签发地点：</td>
									<td>
										<input type="text" name="visa.issue_place" placeholder="请输入签发地点" value="${guestInfor.issue_place}" style="width: 100%;" />
									</td>
								</tr>
	
								<tr>
									<td>入境日期：</td>
									<td>
										<input type="text" name="visa.entry_date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" placeholder="请输入入境日期" value="${guestInfor.entry_date}" style="width: 100%;" />
									</td>
									<td>预计中国境内逗留天数：</td>
									<td>
										<input type="number" name="visa.stay_days" placeholder="请输入天数" value="${guestInfor.stay_days}" style="width: 100%;">
									</td>
								</tr>
	
							</tbody>
	
						</table>
	
					</div>
	
					<div class="tab-pane fade" id="edit_activity_about_guest">
	
						<table class="table table-striped  table-hover table-responsive">
	
							<caption>
								<div class="pull-left">
									会后由会议安排赴外地参观考察
									<button type="button" class="btn btn-sm btn-primary clearChooseLine">清空选择</button>
								</div>
							</caption>
							<tbody id="select_visit_info">
								<tr>
									<td class="text-left">
										<div>
											<p>8月23号：</p>
											<c:forEach items="${routeList}" var="route">
												<c:if test="${route.route_start_time == '2015-08-23'}">
													<c:set var="flag" value="false"></c:set>
													<c:forEach items="${guestInfor.activity}" var="ac">
														<c:if test="${route.id == ac.id}">
															<c:set var="flag" value="true"></c:set>
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${flag == true}">
															<p class="ml20"><label><input type="radio" checked="checked" name="routeId23" value="${route.id}">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
														</c:when>
														<c:otherwise>
															<p class="ml20"><label><input type="radio" name="routeId23" value="${route.id}">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</div>
										<div>
											<p>8月24号：</p>
											<c:forEach items="${routeList}" var="route">
												<c:if test="${route.route_start_time == '2015-08-24'}">
													<c:set var="flag" value="false"></c:set>
													<c:forEach items="${guestInfor.activity}" var="ac">
														<c:if test="${route.id == ac.id}">
															<c:set var="flag" value="true"></c:set>
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${flag == true}">
															<p class="ml10"><label><input type="radio" checked="checked" name="routeId24" value="${route.id}">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
														</c:when>
														<c:otherwise>
															<p class="ml10"><label><input type="radio" name="routeId24" value="${route.id}">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</div>
										<div>
											<p>8月25号之后：</p>
											<c:forEach items="${routeList}" var="route">
												<c:if test="${route.route_start_time == '2015-08-25'}">
													<c:set var="flag" value="false"></c:set>
													<c:forEach items="${guestInfor.activity}" var="ac">
														<c:if test="${route.id == ac.id}">
															<c:set var="flag" value="true"></c:set>
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${flag == true}">
															<p class="ml10"><label><input type="radio" checked="checked" name="routeId25" value="${route.id}">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
														</c:when>
														<c:otherwise>
															<p class="ml10"><label><input type="radio" name="routeId25" value="${route.id}">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
	
					</div>
	
					<div class="tab-pane fade row-body" id="edit_accomodation_about_guest">
						<%-- <input type="hidden" name="room_id" value="${guestInfor.hotel.room_id}" /> --%>
						<table class="table table-striped table-hover table-responsive">
						
							<tbody>
								<tr>
	
									<td width="30%">酒店名称:</td>
	
									<td>
										<%-- <input type="text" name="hotel_name" placeholder="请输入酒店名称" value="${guestInfor.hotel.hotel_name}" style="width: 78%;"/> --%>
										<select onchange="changeHotel(this);">
											<option value="0">不限</option>
											<c:forEach items="${hotelList}" var="hl">
												<c:choose>
													<c:when test="${hl.id == guestInfor.hotel.hotel_id}">
														<option value="${hl.id}" selected="selected">${hl.hotel_name}</option>
													</c:when>
													<c:otherwise>
														<option value="${hl.id}">${hl.hotel_name}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
	
									<td>酒店地址:</td>
	
									<td>
										<input type="text" name="" id="hotel_addr" placeholder="请输入酒店地址" value="${guestInfor.hotel.hotel_addr}" style="width: 78%;"/>
									</td>
	
								</tr>
	
								<tr>
	
									<td>入住日期:</td>
	
									<td>
										<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" name="checkin_time" placeholder="请输入入住日期" value="${guestInfor.hotel.checkin_time}" style="width: 78%;" />
									</td>
	
								</tr>
	
								<tr>
									<td>离店日期：</td>
	
									<td>
										<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" name="checkout_time" placeholder="请输入离店日期" value="${guestInfor.hotel.checkout_time}"  style="width: 78%;"/>
									</td>
	
								</tr>
	
								<tr>
									<td>入住房型：</td>
	
									<td id="room_type">
										<c:forEach items="${roomList}" var="room">
											<c:if test="${room.hotel_id == guestInfor.hotel.hotel_id}">
											<c:choose>
												<c:when test="${room.id == guestInfor.hotel.room_id}">
													<label><input type="radio" name="room_id" value="${room.id}" checked="checked"/>${room.room_type_name}</label>
												</c:when>
												<c:otherwise>
													<label><input type="radio" name="room_id" value="${room.id}" />${room.room_type_name}</label>
												</c:otherwise>
											</c:choose>
											</c:if>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<td>是否需要无烟楼层：</td>
	
									<td>
										<c:choose>
											<c:when test="${guestInfor.hotel.is_smoking == 0}">
												<input type="radio" name="is_smoking" value="1"/>吸烟楼层 </label>
												<input type="radio" name="is_smoking" value="0" checked="checked"/>不吸烟楼层</label>
											</c:when>
											<c:when test="${guestInfor.hotel.is_smoking == 1}">
												<input type="radio" name="is_smoking" value="1" checked="checked"/>吸烟楼层 </label>
												<input type="radio" name="is_smoking" value="0"/>不吸烟楼层</label>
											</c:when>
											<c:otherwise>
												<input type="radio" name="is_smoking" value="1"/>吸烟楼层 </label>
												<input type="radio" name="is_smoking" value="0"/>不吸烟楼层</label>
											</c:otherwise>
										</c:choose>
									</td>
	
								</tr>
	
								<tr>
									<td>同宿人员安排：</td>
									<td class="chose-accomadates">
										<c:choose>
											<c:when test="${guestInfor.hotel.with_roommate == 0}">
												<label><input type="radio" name="with_roommate" checked="checked" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
												<label><input type="radio" name="with_roommate" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
												<label><input type="radio" name="with_roommate" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
											</c:when>
											<c:when test="${guestInfor.hotel.with_roommate == 1}">
												<label><input type="radio" name="with_roommate" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
												<label><input type="radio" name="with_roommate" checked="checked" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
												<label><input type="radio" name="with_roommate" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
											</c:when>
											<c:when test="${guestInfor.hotel.with_roommate == 2}">
												<label><input type="radio" name="with_roommate" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
												<label><input type="radio" name="with_roommate" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
												<label><input type="radio" name="with_roommate" checked="checked" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
											</c:when>
											<c:otherwise>
												<label><input type="radio" name="with_roommate" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
												<label><input type="radio" name="with_roommate" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
												<label><input type="radio" name="with_roommate" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
	
								<tr style="display: none;">
									<td colspan="2">
										<table class="table table-striped  table-hover table-responsive">
											<tr>
												<td width="30%">
													姓名：
												</td>
												<td>
													<input type="text" name="roommate_name" value="${guestInfor.hotel.roommate_name}"  width="80%"/>
												</td>
											</tr>
	
											<tr>
												<td>
													身份证/护照号码：
												</td>
												<td>
													<input type="text" name="roommate_idNo" value="${guestInfor.hotel.roommate_idNo}"  width="80%"/>
												</td>
											</tr>
											<tr>
												<td>同宿人员电子邮件：</td>
												<td>
													<input type="text" name="roommate_email" value="${guestInfor.hotel.roommate_email}" width="80%">
												</td>
											</tr>
											<tr>
												<td colspan="2" class="text-center">
													<button type="button" class="btn btn-sm btn-primary">验证同宿人员</button>
												</td>
											</tr>
										</table>
									</td>
								</tr>
	
							</tbody>
	
						</table>
	
					</div>
	
					<div class="tab-pane fade row-body" id="edit_traval_about_guest">
	
						<table class="table table-striped  table-hover table-responsive">
	
							<tbody>
	
								<tr>
	
									<td>抵达日期：</td>
	
									<td>
										<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" name="trip.arrival_date" placeholder="请输入抵达日期" value="${guestInfor.arrival_date}"  style="width: 78%;"/>
									</td>
	
								</tr>
	
								<tr>
	
									<td>抵达时间：</td>
	
									<td>
										<input type="text" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})" name="trip.arrival_time" placeholder="请输入抵达时间" value="${guestInfor.arrival_time}"  style="width: 78%;"/>
									</td>
	
								</tr>
	
								<tr>
	
									<td>抵达站点：</td>
	
									<td>
										<input type="text"  name="trip.arrival_station" placeholder="请输入抵达站点" value="${guestInfor.arrival_station}"  style="width: 78%;"/>
										<!-- <select name="destination">
											<option value="aiport">广州白云国际机场</option>
											<option value="train">广州高铁南站</option>
											<option value="subway">广州火车东站</option>
										</select>&nbsp; -->
									</td>
	
								</tr>
	
								<tr>
	
									<td>抵达航班（车次）号：</td>
	
									<td>
										<input type="text" name="trip.arrival_shift_no" placeholder="请输入航班(车次)号" value="${guestInfor.arrival_shift_no}"  style="width: 78%;"/>
									</td>
	
								</tr>
	
								<tr>
	
									<td>离开日期：</td>
	
									<td>
										<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" name="trip.leave_date" placeholder="请输入离开日期" value="${guestInfor.leave_date}"  style="width: 78%;"/>
									</td>
	
								</tr>
	
								<tr>
	
									<td>离开时间：</td>
	
									<td>
										<input type="text" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})" name="trip.leave_time" placeholder="请输入离开时间" value="${guestInfor.leave_time}"  style="width: 78%;"/>
									</td>
	
								</tr>
	
								<tr>
	
									<td>离开站点：</td>
	
									<td>
										<input type="text" name="trip.leave_station" placeholder="请输入离开时间" value="${guestInfor.leave_station}" style="width: 78%;" />
										<!-- <select name="leaving_destination">
											<option value="aiport">广州白云国际机场</option>
											<option value="train">广州高铁南站</option>
											<option value="subway">广州火车东站</option>
										</select>&nbsp; -->
									</td>
	
								</tr>
	
								<tr>
	
									<td>离开航班（车次）号：</td>
	
									<td>
										<input type="text" name="trip.leave_shift_no" placeholder="请输入航班(车次)号" value="${guestInfor.leave_shift_no}" style="width: 78%;">
									</td>
	
								</tr>
								<tr>
	
									<td>离境城市：</td>
	
									<td>
										<input type="text" name="trip.leave_city" placeholder="请输入离境城市" value="${guestInfor.leave_city}" style="width: 78%;">
									</td>
	
								</tr>
	
							</tbody>
	
						</table>
	
					</div>
	
				</div>

			</div>
			</form>
		</div>
			<!-- /.modal-content -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
			$('.chose-accomadates').on('click',function(){
				var checkVal = $(this).find('input[type=radio]:checked').val();
				var nextArea = $(this).parent().next();
				checkVal == 2 ? nextArea.show() : nextArea.hide();
			});
			$('.clearChooseLine').on('click',function(){
				var lineRadio = $(this).parents('caption').siblings('tbody').find('input[type=radio]');
				console.log(lineRadio);
				for(var i=0;i<lineRadio.length;i++){
					$(lineRadio).eq(i).removeAttr('checked');
				}
			});
			function changeHotel(ev){
				var hotelId = $(ev).val();
				if(hotelId == 0){
					$("#hotel_addr").val("");
					$("#room_type").empty();
				}else{
					$.post("${contextPath}/guestInfo/getHotel",{hotelId:hotelId},function(data){
						$("#hotel_addr").val(data.hotel_addr);
						var room = data.list;
						$("#room_type").empty();
						for ( var i = 0; i < room.length; i++) {
							$("#room_type").append("<label><input type='radio' name='room_id' value='"+room[i].id+"'/>"+room[i].room_type_name+"</label>");
						}
					});
				}
			}
			
			function submitForm(){
				if($("#hid_flag").val() == 1){
					$("#form_edit_guest").attr("action","${contextPath}/guestInfo/editGuest").submit();
				}else if($("#hid_flag").val() == 2){
					$("#form_edit_guest").attr("action","${contextPath}/guestAudit/editGuest").submit();
				}else if($("#hid_flag").val() == 3){
					$("#form_edit_guest").attr("action","${contextPath}/makeLicense/editGuest").submit();
				}else if($("#hid_flag").val() == 4){
					$("#form_edit_guest").attr("action","${contextPath}/makeLicense/addGuest").submit();
				}
			}
			
		</script>
	</body>

</html>