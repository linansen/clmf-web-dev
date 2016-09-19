<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>嘉宾报到页面</title>

		<!-- Bootstrap Core CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

		<!-- MetisMenu CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css" rel="stylesheet">

		<!-- Custom Fonts -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<div class="row-header">
			<div class="col-lg-offset-2 col-lg-6">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">

			<div class="col-lg-12">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-info-circle fa-2x mr5"></span>嘉宾报到状态显示

							<span class="pull-right">
								<button type="button" class="btn btn-warning mr10" id="edit_btn" onclick="javaScript:$('#hid_btn').click();">保存修改<span class="fa fa-save ml5"></span></button>
                           	    <button type="button" class="btn btn-success mr10" id="activation_btn" data-toggle="modal" data-target="#activation_btn_modal">证件激活<span class="fa fa-heart ml5"></span></button>
                           	    <button type="button" class="btn btn-danger mr10" id="guestRegistration_btn" data-toggle="modal" data-target="#guestRegistration_btn_modal">确认报到<span class="fa fa-check ml5"></span></button>
                           	    <button class="btn btn-info mr10 back">返回<span class="fa fa-mail-reply ml5"></span></button>
                           </span>
						</p>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">
						<form action="${contextPath}/checkArrive/updReceptionGuestInfo" id="guest_form">
						<button type="submit" style="display: none;" id="hid_btn"></button>
						<div class="panel panel-default width49 fl mr20">
							<div class="panel-heading">
								<h5 class="text-capitalize">嘉宾详细资料</h5>
							</div>
							<div class="panel-body">
								<input type="hidden" name="guestInfor.id" value="${guestInfor.id}" />
								<table class="table table-responsive table-hover table-striped">
									<tbody>
										<tr>
											<td class="text-right">激活状态：</td>
											<td>
												<c:choose>
													<c:when test="${guestInfor.card.card_status == 0}">未激活</c:when>
													<c:otherwise>已激活</c:otherwise>
												</c:choose>
											</td>
											<td class="text-right">报到状态：</td>
											<td>
												<c:choose>
													<c:when test="${guestTrip.arrival_status == 0}">已报到</c:when>
													<c:when test="${guestTrip.arrival_status == 1}">未抵达</c:when>
													<c:otherwise>已抵达</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<!--姓名开始--->
										<tr>
											<td class="text-right">姓名：</td>
											<td>
												<input type="text" name="guestInfor.username" placeholder="" value="${guestInfor.username}"/>
											</td>
											<!--中文用户名开始--->
											<td class="text-right">中文名：</td>
											<td>
												<input type="text" name="guestInfor.chinese_name" placeholder="" value="${guestInfor.chinese_name}"/>
											</td>
										<!--中文用户名结束--->
										</tr>
										<tr>
										<!--性别开始-->
											<td class="text-right">性别：</td>
											<td>
												<c:choose>
													<c:when test="${guestInfor.sex == 1}">
														<input type="radio" name="guestInfor.sex" value="1" checked="checked" />男
														<input type="radio" name="guestInfor.sex" value="2" />女
													</c:when>
													<c:when test="${guestInfor.sex == 2}">
														<input type="radio" name="guestInfor.sex" value="1" />男
														<input type="radio" name="guestInfor.sex" value="2" checked="checked"/>女
													</c:when>
													<c:otherwise>
														<input type="radio" name="guestInfor.sex" value="1" />男
														<input type="radio" name="guestInfor.sex" value="2" />女
													</c:otherwise>
												</c:choose>
											</td>
										<!--性别结束-->
										<!--护照身份证开始--->
											<td class="text-right">护照/身份证：</td>
											<td>
												<input type="text" name="guestInfor.passport_no" placeholder="" value="${guestInfor.passport_no}"/>
											</td>
										<!--护照身份证结束--->
										</tr>
										<tr>
											<!--国家地区开始--->
											<td class="text-right">国家地区：</td>
											<td>
												<input type="text" name="guestInfor.national" placeholder="" value="${guestInfor.national}"/>
											</td>
										<!--国家地区结束--->
										<!--机构名称开始--->
											<td class="text-right">机构英文名称：</td>
											<td>
												<input type="text" name="guestInfor.en_organ_name" placeholder="" value="${guestInfor.en_organ_name}"/>
											</td>
										<!---机构名称结束--->
										</tr>
										<tr>
										<!--机构中文名称开始--->
											<td class="text-right">机构中文名称：</td>
											<td>
												<input type="text" name="guestInfor.ch_organ_name" placeholder="" value="${guestInfor.ch_organ_name}"/>
											</td>
										<!---机构中文名称结束--->
											<td class="text-right">职务：</td>
											<td>
												<input type="text" name="guestInfor.post" placeholder="" value="${guestInfor.post}"/>
											</td>
										</tr>
										<tr>
										<!--联系电话开始--->
											<td class="text-right">联系电话：</td>
											<td>
												<input type="text" name="guestInfor.phone" placeholder="" value="${guestInfor.phone}"/>
											</td>
											<!--联络手机电话开始--->
											<td class="text-right">联系手机电话：</td>
											<td>
												<input type="text" name="guestInfor.mobile" placeholder="" value="${guestInfor.mobile}"/>
											</td>
										<!---联络手机电话结束--->
										</tr>
										<tr>
										<!--电子邮箱开始--->
											<td class="text-right">电子邮箱：</td>
											<td>
												<input type="text" name="guestInfor.email" placeholder="" value="${guestInfor.email}"/>
											</td>
										<!---电子邮件结束--->
										<!--地址开始--->
											<td class="text-right">地址：</td>
											<td>
												<input type="text" name="guestInfor.address" placeholder="" value="${guestInfor.address}"/>
											</td>
										<!---地址结束--->
										<!---联系电话结束--->
										</tr>
										<tr>
										<!--邮编开始--->
											<td class="text-right">邮编：</td>
											<td>
												<input type="text" name="guestInfor.zip_code" placeholder="" value="${guestInfor.zip_code}"/>
											</td>
											<!--联络人开始--->
											<td class="text-right">联络人：</td>
											<td>
												<input type="text" name="guestInfor.cp_name" placeholder="" value="${guestInfor.cp_name}"/>
											</td>
										<!---联络人结束--->
										</tr>
										<tr>
										<!--联络人电话开始--->
											<td class="text-right">联络人电话：</td>
											<td>
												<input type="text" name="guestInfor.cp_phone" placeholder="" value="${guestInfor.cp_phone}"/>
											</td>
										<!---联络人电话结束--->
										<!--联络人邮件开始--->
											<td class="text-right">联络人电子邮箱：</td>
											<td>
												<input type="text" name="guestInfor.cp_email" placeholder="" value="${guestInfor.cp_email}"/>
											</td>
										<!---联络人邮件结束--->
										</tr>
										<!---邮编结束--->
										<tr>
											<td class="text-right">国籍：</td>
											<td><input type="text"></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
						</div>
						<div class="panel-heading">
							<h5 class="text-capitalize">嘉宾路线选择</h5>
						</div>
						<div class="panel-body">
							<c:forEach items="${route}" var="ru">
								${ru.route_nicName}:${ru.route_content}(${ru.route_name})&nbsp; &nbsp;&nbsp;&nbsp;
								<p class="small text-info ">考察时间${ru.route_start_time}-${ru.route_end_time}<!-- （30日贵阳散团） --></p>
							</c:forEach>
						</div>
					</div>
					<%-- <c:if test="${hotel != null}"> --%>
					<div class="panel panel-default width49 fr">
						<div class="panel-heading">
							<h5 class="text-capitalize">嘉宾住宿安排</h5>
						</div>
						<div class="panel-body">
							<input type="hidden" name="hotel.id" value="${hotel.id}" />
							<table class="table table-responsive table-hover table-striped">
								<tbody>
									<tr>
										<td class="text-right">入住日期:</td>
										<td><input type="datetime" name="hotel.checkin_time" placeholder="" value="${hotel.checkin_time}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
										<td class="text-right">离店日期：</td>
										<td><input type="datetime" name="hotel.checkout_time" placeholder="" value="${hotel.checkout_time}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
									</tr>
									<tr>
										<td class="text-right">入住房型：</td>
										<td>豪华套房</td>
										<td class="text-right">同宿人员安排：</td>
										<td>
											<c:choose>
												<c:when test="${hotel.with_roommate == 0}">不与其他人员同宿</c:when>
												<c:when test="${hotel.with_roommate == 1}">随便</c:when>
												<c:otherwise>指定室友</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td class="text-right">是否需要无烟楼层：</td>
										<td>
											<c:choose>
												<c:when test="${hotel.is_smoking == 0}">不吸烟楼层</c:when>
												<c:otherwise>吸烟楼层</c:otherwise>
											</c:choose>
										</td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<%-- </c:if> --%>
					<div class="panel panel-default width49 fr">
						<div class="panel-heading">
							<h5 class="text-capitalize">嘉宾行程安排</h5>
						</div>
						<div class="panel-body">
							<input type="hidden" name="guestTrip.id" value="${guestTrip.id}" />
							<table class="table table-responsive table-hover table-striped">
								<tbody>
									<tr>
										<td class="text-right">抵达日期：</td>
										<td><input type="datetime" name="guestTrip.arrival_date" placeholder="" value="${guestTrip.arrival_date}"></td>
										<td class="text-right">抵达时间：</td>
										<td>${guestTrip.arrival_time}</td>
									</tr>
									<tr>
										<td class="text-right">抵达站点：</td>
										<td>${guestTrip.arrival_station}</td>
										<td class="text-right">抵达航班（车次）号：</td>
										<td><input type="text" name="guestTrip.arrival_shift_no" placeholder="" value="${guestTrip.arrival_shift_no}" disabled="disabled"></td>
									</tr>
									<tr>
										<td class="text-right">离开日期：</td>
										<td><input type="datetime" name="guestTrip.leave_date" placeholder="" disabled="disabled" value="${guestTrip.leave_date}"></td>
										<td class="text-right">离开时间：</td>
										<td>${guestTrip.leave_time}</td>
									</tr>
									<tr>
										<td class="text-right">离开站点：</td>
										<td>${guestTrip.leave_station}</td>
										<td class="text-right">离开航班（车次）号：</td>
										<td><input type="text" name="guestTrip.leave_shift_no" placeholder="" value="${guestTrip.leave_shift_no}"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					</form>
				</div>
					<!-- /.panel-body -->

				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div id="activation_btn_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
						<h5 class="modal-title pull-left white-text" id="myModalLabel">证件激活</h5>
						<div class="pull-right btn-group-sm">
							<a href='${contextPath}/reception/activateCard?guestId=${guestInfor.id}' class="btn btn-danger">确定<span class="fa fa-remove"></span></a>
							<button class="btn btn-warning" data-dismiss="modal">取消<span class="fa fa-power-off"></span></button>
						</div>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h5 class="panel-title diningManageToll">请将证件靠近读卡器进行激活...</h5>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		<div id="guestRegistration_btn_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
						<h5 class="modal-title pull-left white-text" id="myModalLabel">确认报道</h5>
						<div class="pull-right btn-group-sm">
							<a href='${contextPath}/checkArrive/updateStatus?guestId=${guestInfor.id}' class="btn btn-danger">确定<span class="fa fa-remove"></span></a>
							<button class="btn btn-warning" data-dismiss="modal">取消<span class="fa fa-power-off"></span></button>
						</div>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h5 class="panel-title diningManageToll">确定要确认报到吗？</h5>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>

		<!-- /#page-wrapper -->

		<!-- jQuery -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/jquery/dist/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/My97DatePicker/WdatePicker.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/sb-admin-2.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/index.js"></script>

		<!-- Page-Level Demo Scripts - Tables - Use for reference -->

	</body>

</html>