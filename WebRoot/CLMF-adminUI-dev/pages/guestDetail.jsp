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
			<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">

				<h5 class="modal-title pull-left white-text" id="myModalLabel">嘉宾信息</h5>
				<div class="pull-right btn-group-sm ">
					<button class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
				</div>

			</div>
			<div class="modal-body">

				<ul id="myTab" class="nav nav-tabs ">
					<li class="active"><a href="#info_about_guest" data-toggle="tab">个人信息</a></li>
					<li><a href="#passport_about_guest" data-toggle="tab">签证信息</a></li>
					<li><a href="#activity_about_guest" data-toggle="tab">活动安排</a></li>
					<li><a href="#accomodation_about_guest" data-toggle="tab">住宿安排</a></li>
					<li><a href="#traval_about_guest" data-toggle="tab">行程安排</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">

					<div class="tab-pane fade in active row-body" id="info_about_guest">

						<table class="table  table-hover table-striped table-responsive">
							<caption></caption>

							<tbody>
								<tr>
									<!--姓名开始--->
									<td>英文姓名：</td>
									<td>${guestInfor.english_name}</td>
									<!--姓名结束--->
									<!--中文用户名开始--->
									<td>中文名：</td>
									<td>${guestInfor.chinese_name}</td>
									<!--中文用户名结束--->
								</tr>
								
								<tr>
									<!--职务开始--->
									<td>职务：</td>
									<td>${guestInfor.post}</td>
									<!---职务结束--->
									<!--性别开始-->
									<td>性别：</td>
									<td>
										<c:choose>
											<c:when test="${guestInfor.sex == 1}">男</c:when>
											<c:when test="${guestInfor.sex == 2}">女</c:when>
										</c:choose>
									</td>
									<!--性别结束-->
								</tr>
								<tr>
									<!--护照身份证开始--->
									<td>护照/身份证：</td>
									<td>${guestInfor.passport_no}</td>
									<!--护照身份证结束--->
									<!--国家地区开始--->
									<td>国家地区：</td>
									<td>${guestInfor.national}</td>
									<!--国家地区结束--->
								</tr>
								<!--机构名称开始--->
								<tr>
									<td>机构英文名称(单位)：</td>
									<td>${guestInfor.en_organ_name}</td>
									<!--机构中文名称开始--->
									<td>机构中文名称：</td>
									<td>${guestInfor.ch_organ_name }</td>
									<!---机构中文名称结束--->
								</tr>
								<!---机构名称结束--->
								<!--联系电话开始--->
								<tr>
									<td>联系电话：</td>
									<td>${guestInfor.phone}</td>
									<!--联络手机电话开始--->
									<td>联系手机电话：</td>
									<td>${guestInfor.mobile}</td>
									<!---联络手机电话结束--->
								</tr>
								<!---联系电话结束--->
								<!--电子邮箱开始--->
								<tr>
									<td>电子邮箱：</td>
									<td>${guestInfor.email}</td>
									<td></td>
									<td></td>
								</tr>
								<!---电子邮件结束--->

								<!--地址开始--->
								<tr>
									<td>地址：</td>
									<td>${guestInfor.address}</td>
									<!--邮编开始--->
									<td>邮编：</td>
									<td>${guestInfor.zip_code}</td>
									<!---邮编结束--->
								</tr>
								<!---地址结束--->

								

								<!--联络人开始--->
								<tr>
									<td>联络人：</td>
									<td>${guestInfor.cp_name}</td>
									<!--联络人电话开始--->
									<td>联络人电话：</td>
									<td>${guestInfor.cp_phone }</td>
									<!---联络人电话结束--->
								</tr>
								<!---联络人结束--->
								<!--联络人邮件开始--->
								<tr>
									<td>联络人电子邮箱：</td>
									<td>${guestInfor.cp_email}</td>
									<td></td>
									<td></td>
								</tr>
								<!---联络人邮件结束--->

							</tbody>

						</table>

					</div>

					<div class="tab-pane fade row-body" id="passport_about_guest">

						<table class="table table-striped  table-hover table-responsive text-right">
							<caption class="text-center">
								<div>
									<c:choose>
										<c:when test="${guestInfor.toVisa == 1}">需要申请签证</c:when>
										<c:otherwise>不需要申请签证</c:otherwise>
									</c:choose>
								</div>
							</caption>
							<tbody id="passport_info">
								<tr>
									<td width="20%">名：</td>
									<td width="30%">${guestInfor.given_name}</td>
									<td width="20%">姓：</td>
									<td width="30%">${guestInfor.surname}</td>
								</tr>
								<tr>
									<td>出生日期：</td>
									<td>${guestInfor.birth_date}</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>性别：</td>
									<td>
										<c:choose>
											<c:when test="${guestInfor.visa_sex == 1}">男</c:when>
											<c:when test="${guestInfor.visa_sex == 2}">女</c:when>
										</c:choose>
									</td>
									<td>国籍：</td>
									<td>${guestInfor.nationality}</td>
								</tr>
								<tr>
									<td>机构：</td>
									<td>${guestInfor.organ_name}</td>
									<td>职业：</td>
									<td>${guestInfor.visa_post}</td>
								</tr>
								<tr>
									<td>护照号码：</td>
									<td>${guestInfor.visa_passport_no}</td>
									<td>护照有效日期：</td>
									<td>${guestInfor.passport_valid_date}</td>
								</tr>
								<tr>
									<td>电子邮箱：</td>
									<td>${guestInfor.visa_email}</td>
									<td>传真：</td>
									<td>${guestInfor.visa_fax}</td>
								</tr>
								<tr>
									<td>联系地址：</td>
									<td>${guestInfor.contact_address}</td>
									<td>签发地点：</td>
									<td>${guestInfor.issue_place}</td>
								</tr>

								<tr>
									<td>入境日期：</td>
									<td>${guestInfor.entry_date}
									<td>预计中国境内逗留天数：</td>
									<td>${guestInfor.stay_days}天</td>
								</tr>
							</tbody>

						</table>

					</div>

					<div class="tab-pane fade" id="activity_about_guest">

						<table class="table table-striped  table-hover table-responsive">

							<caption>
								<div class="pull-left">
									会后由会议安排赴外地参观考察
								</div>
							</caption>
							<tbody id="select_visit_info">
								<tr>
									<td class="text-left">
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

					<div class="tab-pane fade row-body" id="accomodation_about_guest">
						<table class="table table-striped  table-hover table-responsive">
							<tbody>
								<tr>
									<td>酒店名称:</td>
									<td>${guestInfor.hotel.hotel_name}</td>
								</tr>
								<tr>
									<td>酒店地址:</td>
									<td>${guestInfor.hotel.hotel_addr}</td>
								</tr>
								<tr>
									<td>入住日期:</td>
									<td>${guestInfor.hotel.checkin_time}</td>
								</tr>
								<tr>
									<td>离店日期：</td>
									<td>${guestInfor.hotel.checkout_time }</td>
								</tr>
								<tr>
									<td>入住房型：</td>
									<td>
										<%-- <input type="radio" name="living_room_type" value="${guestInfor.hotel.room_id}" /> --%>${guestInfor.hotel.room_type_name} <!-- </label> -->
									</td>
								</tr>
								<tr>
									<td>同宿人员安排：</td>
									<td>
										<c:choose>
											<c:when test="${guestInfor.hotel.with_roommate == 0}">
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" checked="checked" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
											</c:when>
											<c:when test="${guestInfor.hotel.with_roommate == 1}">
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" checked="checked" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
											</c:when>
											<c:when test="${guestInfor.hotel.with_roommate == 2}">
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" checked="checked" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
											</c:when>
											<c:otherwise>
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
												<input type="radio" disabled="disabled" name="living_same_accomadation_type" value="2" id="only_accomodation_about_guest"/>指定同宿人员</label>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td>是否需要无烟楼层：</td>
									<td>
										<c:choose>
											<c:when test="${guestInfor.hotel.is_smoking == 0}">
												<input type="radio" disabled="disabled" name="living_room_about_smoking" value="1"/>吸烟楼层 </label>
												<input type="radio" disabled="disabled" name="living_room_about_smoking" value="0" checked="checked"/>不吸烟楼层</label>
											</c:when>
											<c:when test="${guestInfor.hotel.is_smoking == 1}">
												<input type="radio" disabled="disabled" name="living_room_about_smoking" value="1" checked="checked"/>吸烟楼层 </label>
												<input type="radio" disabled="disabled" name="living_room_about_smoking" value="0"/>不吸烟楼层</label>
											</c:when>
											<c:otherwise>
												<input type="radio" disabled="disabled" name="living_room_about_smoking" value="1"/>吸烟楼层 </label>
												<input type="radio" disabled="disabled" name="living_room_about_smoking" value="0"/>不吸烟楼层</label>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="tab-pane fade row-body" id="traval_about_guest">
						<table class="table table-striped  table-hover table-responsive">
							<tbody>
								<tr>
									<td>抵达日期：</td>
									<td>${guestInfor.arrival_date}</td>
								</tr>
								<tr>
									<td>抵达时间：</td>
									<td>${guestInfor.arrival_time}</td>
								</tr>
								<tr>
									<td>抵达站点：</td>
									<td>${guestInfor.arrival_station}</td>
								</tr>
								<tr>
									<td>抵达航班（车次）号：</td>
									<td>${guestInfor.arrival_shift_no}</td>
								</tr>
								<tr>
									<td>离开日期：</td>
									<td>${guestInfor.leave_date}</td>
								</tr>
								<tr>
									<td>离开时间：</td>
									<td>${guestInfor.leave_time}</td>
								</tr>
								<tr>
									<td>离开站点：</td>
									<td>${guestInfor.leave_station}</td>
								</tr>
								<tr>
									<td>离开航班（车次）号：</td>
									<td>${guestInfor.leave_shift_no}</td>
								</tr>
								<tr>
									<td>离境城市：</td>
									<td>${guestInfor.leave_city}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
