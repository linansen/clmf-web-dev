<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>

		<meta charset="utf-8">
		<title>嘉宾基本信息</title>
		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Favicon -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/css/bootstrap.min.css">
		
		<!-- Font Awesome CSS -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/font-awesome-4.3.0/css/font-awesome.css" />
		<!-- Plugins -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/animations.css">
		<!-- Worthy core CSS file -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/style.css">
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/cotmer.css">
	</head>
	<body>
		<!-- 个人基本信息开始 -->
		<div class="row">
			<div class="col-md-offset-1 col-md-10">
				<hr style="line-height: 3px; color: #265A88;margin-top:10px;">
				
				<div class="row object-visible">
					<div>
						<span class="pull-right mb10">
							<a class="btn btn-primary" href="${contextPath}/guest_infor/editGuestDetail" data-toggle="modal" data-target="#edit_info_about_guest">编辑个人信息</a>
						</span>
					</div>
					<div class="col-md-12">
						<!-- 对话模态框 start -->
						<div class="filters text-left info">
							<ul class="nav nav-justified nav-tabs">
								<li><a href="#" data-filter=".self_info">个人信息</a></li>
								<li class="active"><a href="#" data-filter=".web-design">申请中国签证</a></li>
								<li><a href="#" data-filter=".app-development">参会活动安排</a></li>
								<li><a href="#" data-filter=".site-building">住宿安排</a></li>
								<li><a href="#" data-filter=".site-builder">行程安排</a></li>
							</ul>
						</div>
						<!--  对话模态框 end -->
						<!-- portfolio items start -->
						<div class="isotope-container row grid-space-20">
							<div class="col-sm-offest-4 col-sm-6 col-md-8 isotope-item self_info guest-info-center active">
								<!--个人基本信息开始-->
								<table class="table table-striped table-responsive">
									<caption class="text-center">
										<span class="fa fa-2x ml10">个人信息</span>
									</caption>
									<thead>
										<tr>
											<th colspan="3">Info About Constitution</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>会议名称：</td>
											<td colspan="2">第八届世界华文传媒论坛</td>
										</tr>
										<tr>
											<td>中文姓名：</td>
											<td colspan="2">${guestInfor.chinese_name}</td>
										</tr>
										<tr>
											<td>英文姓名/拼音：</td>
											<td colspan="2">${guestInfor.english_name}</td>
										</tr>
										<tr>
											<td>性别：</td>
											<td colspan="2">
												<c:choose>
													<c:when test="${guestInfor.sex == 1}">男</c:when>
													<c:when test="${guestInfor.sex == 2}">女</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>身份证/护照号码：</td>
											<td colspan="2">${guestInfor.passport_no }</td>
										</tr>
										<tr>
											<td>单位及职务：</td>
											<td colspan="2">${guestInfor.post}</td>
										</tr>
										<tr>
											<td>国家/地区：</td>
											<td colspan="2">${guestInfor.national }</td>
										</tr>
										<tr>
											<td>城市：</td>
											<td colspan="2">${guestInfor.city}</td>
										</tr>
										<tr>
											<td>地址：</td>
											<td colspan="2">${guestInfor.address}</td>
										</tr>
										<tr>
											<td>邮编：</td>
											<td colspan="2">${guestInfor.zip_code}</td>
										</tr>
										<tr>
											<td>手机：</td>
											<td colspan="2">${guestInfor.mobile}</td>
										</tr>
										<tr>
											<td>电子邮箱：</td>
											<td colspan="2">${guestInfor.email}</td>
										</tr>
										<tr>
											<td>饮食习惯：</td>
											<td colspan="2">
												<c:choose>
													<c:when test="${guestInfor.diatHab == 1}">无特殊饮食习惯</c:when>
													<c:when test="${guestInfor.diatHab == 2}">素食</c:when>
													<c:when test="${guestInfor.diatHab == 3}">清真</c:when>
													<c:when test="${guestInfor.diatHab == 4}">其他</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>饮食描述：</td>
											<td colspan="2">${guestInfor.diatDesc}</td>
										</tr>
										<tr>
											<td>联络人姓名：</td>
											<td colspan="2">${guestInfor.cp_name}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!--个人基本信息结束-->
							<!--申请中国签证开始-->
							<div class="col-sm-offest-4 col-sm-6 col-md-8 isotope-item web-design  guest-info-center">
								<table class="table table-striped table-responsive">
									<caption class="text-center">
										<span class="fa fa-2x">申请中国签证</span>
									</caption>
									<thead>
										<tr>
											<th colspan="3">Info About Visa in China</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>是否申请中国签证：</td>
											<td colspan="2">
												<c:choose>
													<c:when test="${guestInfor.toVisa == 1}">是</c:when>
													<c:when test="${guestInfor.toVisa == 0}">否</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>代表团名称：</td>
											<td colspan="2">${guestInfor.visa_group_name}</td>
										</tr>
										<tr>
											<td>性：</td>
											<td colspan="2">${guestInfor.surname}</td>
										</tr>
										<tr>
											<td>出生日期：</td>
											<td colspan="2">${guestInfor.birth_date}</td>
										</tr>
										<tr>
											<td>性别：</td>
											<td colspan="2">
												<c:choose>
													<c:when test="${guestInfor.visa_sex == 1}">男</c:when>
													<c:when test="${guestInfor.visa_sex == 2}">女</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>国籍：</td>
											<td colspan="2">${guestInfor.nationality}</td>
										</tr>
										<tr>
											<td>职业：</td>
											<td colspan="2">${guestInfor.visa_post}</td>
										</tr>
										<tr>
											<td>护照号码：</td>
											<td colspan="2">${guestInfor.visa_passport_no}</td>
										</tr>
										<tr>
											<td>护照有效期：</td>
											<td colspan="2">${guestInfor.passport_valid_date}</td>
										</tr>
										<tr>
											<td>工作单位：</td>
											<td colspan="2">${guestInfor.organ_name}</td>
										</tr>
										<tr>
											<td>电子邮箱：</td>
											<td colspan="2">${guestInfor.visa_email}</td>
										</tr>
										<tr>
											<td>传真：</td>
											<td colspan="2">${guestInfor.visa_fax}</td>
										</tr>
										<tr>
											<td>联系地址：</td>
											<td colspan="2">${guestInfor.contact_address}</td>
										</tr>
										<tr>
											<td>入境日期：</td>
											<td colspan="2">${guestInfor.entry_date}</td>
										</tr>
										<tr>
											<td>预计中国境内逗留天数：</td>
											<td colspan="2">${guestInfor.stay_days} 天</td>
										</tr>
										<tr>
											<td>签发地点：</td>
											<td colspan="2">${guestInfor.issue_place} </td>
										</tr>
									</tbody>
								</table>
							</div>
							<!--申请中国签证结束-->
							<!--参会活动安排开始-->
							<div class="col-sm-offest-4 col-sm-6 col-md-8 isotope-item app-development  guest-info-center">
								<table class="table table-striped table-responsive">
									<caption class="text-center">
										<span class="fa fa-2x">参会活动安排</span>
									</caption>
									<thead>
										<tr>
											<th colspan="3">Info About Activity </th>
										</tr>
									</thead>
									<tbody>
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
																	<p class="ml10"><label><input type="radio" checked="checked" name="routeId24" value="${route.id}" disabled="disabled">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
																</c:when>
																<c:otherwise>
																	<p class="ml10"><label><input type="radio" name="routeId24" value="${route.id}" disabled="disabled">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
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
																	<p class="ml10"><label><input type="radio" checked="checked" name="routeId24" value="${route.id}" disabled="disabled">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
																</c:when>
																<c:otherwise>
																	<p class="ml10"><label><input type="radio" name="routeId24" value="${route.id}" disabled="disabled">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
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
																	<p class="ml10"><label><input type="radio" checked="checked" name="routeId25" value="${route.id}" disabled="disabled">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
																</c:when>
																<c:otherwise>
																	<p class="ml10"><label><input type="radio" name="routeId25" value="${route.id}" disabled="disabled">&nbsp;${route.route_nicName}：${route.route_content}(${route.route_name})-(${route.route_start_time})-限定人数(${route.limit_num})-已报名人数(${route.regist_num})</label></p>
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
							<!--参会活动安排结束-->
							<!--住宿安排开始-->
							<div class="col-sm-offest-4 col-sm-6 col-md-8 isotope-item site-building guest-info-center">
								<table class="table table-striped table-responsive">
									<caption class="text-center">
										<span class="fa fa-2x">住宿安排</span>
									</caption>
									<thead>
										<tr>
											<th colspan="2">Info About Accommodation arrangement</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>入住日期：</td>
											<td>${guestInfor.hotel.checkin_time}</td>
										</tr>
										<tr>
											<td>离店日期：</td>
											<td>${guestInfor.hotel.checkout_time}</td>
										</tr>
										<tr>
											<td>入住房型：</td>
											<td>${guestInfor.hotel.room_type_name}</td>
										</tr>
										<tr>
											<td>同宿人员安排：</td>
											<td>
												<c:choose>
													<c:when test="${guestInfor.hotel.with_roommate == 0}">不与其他人员同宿</c:when>
													<c:when test="${guestInfor.hotel.with_roommate == 1}">大会随机分配同宿人员</c:when>
													<c:when test="${guestInfor.hotel.with_roommate == 2}">指定同宿人员 (姓名：${guestInfor.hotel.roommate_name }；证件号：${guestInfor.hotel.roommate_idNo})</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>是否需要吸烟楼层：</td>
											<td>
												<c:choose>
													<c:when test="${guestInfor.hotel.is_smoking == 0}">否</c:when>
													<c:when test="${guestInfor.hotel.is_smoking == 1}">是</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td>医疗设备辅助：</td>
											<td>需要（呼吸机）</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!--住宿安排结束-->
							<!--行程安排开始-->
							<div class="col-sm-offest-4 col-sm-6 col-md-8 isotope-item site-builder guest-info-center">
								<table class="table table-striped table-responsive">
									<caption class="text-center">
										<span class="fa fa-2x">行程安排</span>
									</caption>
									<thead>
										<tr>
											<th colspan="3">Info About scheduling</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>抵达日期：</td>
											<td colspan="2">${guestInfor.arrival_date}</td>
										</tr>
										<tr>
											<td>抵达时间：</td>
											<td colspan="2">${guestInfor.arrival_time}</td>
										</tr>
										<tr>
											<td>抵达站点：</td>
											<td colspan="2">${guestInfor.arrival_station}</td>
										</tr>
										<tr>
											<td>抵达航班（车次）：</td>
											<td colspan="2">${guestInfor.arrival_shift_no}</td>
										</tr>
										<tr>
											<td>离开日期：</td>
											<td colspan="2">${guestInfor.leave_date}</td>
										</tr>
										<tr>
											<td>离开时间：</td>
											<td colspan="2">${guestInfor.leave_time}</td>
										</tr>
										<tr>
											<td>离开站点：</td>
											<td colspan="2">${guestInfor.leave_station}</td>
										</tr>
										<tr>
											<td>职离开航班（车次）：</td>
											<td colspan="2">${guestInfor.leave_shift_no}</td>
										</tr>

									</tbody>
								</table>
							</div>
							<!--行程安排开始-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 个人基本信息结束 -->
		<div id="edit_info_about_guest" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 720px;">

				<div class="modal-content">
				</div>
				<!-- /.modal-content -->

			</div>

		</div>
			
		<script src="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/js/jquery.js"></script>
		<script src="${contextPath}/CLMF-frontUI-dev/bootstrap-3.3.4-dist/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
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
		<script type="text/javascript">
			$(function(){
				if(getCookie('editCode') == 1){
					alert("保存成功！");
					delCookie('editCode');
				}else if(getCookie('editCode') == 0){
					alert("保存失败！");
					delCookie('editCode');
				}
				$('.filters').find('a[data-filter=".self_info"]').click();
			});
			
			function getCookie(name){
			    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
			    if(arr=document.cookie.match(reg))
			        return (arr[2]);
			    else
			        return null;
			}
			
			function delCookie(name){
			    var exp = new Date();
			    exp.setTime(exp.getTime() - 1);
			    var cval=getCookie(name);
			    if(cval!=null)
			        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
			}
		</script>
	</body>
</html>
