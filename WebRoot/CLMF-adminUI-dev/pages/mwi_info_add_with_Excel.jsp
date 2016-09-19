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

		<title>嘉宾资料</title>

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

		<!-- Navigation -->

		<div class="row-header">
			<div class="col-lg-12">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">

			<div class="col-lg-12">

				<div class="panel panel-primary">

					<div class="panel-heading">
						<h4><span class="fa fa-info-circle mr5"></span>嘉宾信息录入</h4>
					</div>
					<div class="panel-title ml20 mt10">
						<label><input type="radio" name="info_add" value="excel_info_add" id="excel_info_add" checked="checked">Excel录入</label>
						<label><input type="radio" name="info_add" value="ordinal_info_add" id="ordinal_info_add">普通录入</label>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body" id="excel_info">
						<table class="table table-responsive table-hover">
							<caption>
								<div class="pull-left query">
									<span>
										<a href="${contextPath}/guestInput/downloadTemplate">下载嘉宾信息模板<span class="fa fa-download ml5"></span></a>
									</span>
									<form action="${contextPath}/guestInput/guestImport" method="post" enctype="multipart/form-data">
									<span>
										导入参会嘉宾的Excel表:
										<input type="file" name="file" style="display: inline;"/>
									</span>
									<span>
										<button type="submit" class="btn btn-success">批量导入<b class="fa fa-plus ml5"></b></button>
									</span>
									</form>
								</div>
								<div>
									<h4>导入信息浏览</h4>
								</div>
							</caption>
							<thead>

								<tr>
									<th>序号</th>
									<th>嘉宾姓名</th>
									<th>英文姓名</th>
									<th>国籍</th>
									<th>身份证号/护照号</th>
									<th>单位职务</th>
									<th>性别</th>
									<th>抵达日期</th>
								</tr>

							</thead>
							<tbody>
								<c:forEach items="${guestList}" var="li" varStatus="i">
									<tr>
										<td>${i.index + 1}</td>
										<td>${li.chinese_name}</td>
										<td>${li.english_name}</td>
										<td>${li.national}</td>
										<td>${li.passport_no}</td>
										<td>${li.post}</td>
										<td>
											<c:choose>
												<c:when test="${li.sex == 1}">男</c:when>
												<c:when test="${li.sex == 2}">女</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</td>
										<td>${li.guestTrip.arrival_date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<form action="${contextPath}/guestInput/guestInput" method="post">
					<div class="panel-body" id="basic_info" style="display: none;">
						<div class="panel panel-default width49 fl mr20">
							<div class="panel-heading">
								<h4>嘉宾资料</h4>
							</div>
							<div class="panel-body">
								<table class="table table-responsive table-hover table-striped">
									<tbody>
										<!--姓名开始--->
										<tr>
											<td class="text-right">中文姓名：</td>
											<td>
												<input type="text" name="guestInfo.chinese_name" placeholder="" value=""/>
											</td>
											<!--中文用户名开始--->
											<td class="text-right">英文姓名：</td>
											<td>
												<input type="text" name="guestInfo.english_name" placeholder="" value=""/>
											</td>
										<!--中文用户名结束--->
										</tr>
										<tr>
										<!--性别开始-->
											<td class="text-right">性别：</td>
											<td>
												<input type="radio" name="guestInfo.sex" value="男" checked="checked" />男
												<input type="radio" name="guestInfo.sex" value="女" />女
											</td>
										<!--性别结束-->
										<!--护照身份证开始--->
											<td class="text-right">护照/身份证：</td>
											<td>
												<input type="text" name="guestInfo.passport_no" placeholder="" value=""/>
											</td>
										<!--护照身份证结束--->
										</tr>
										<tr>
											<!--国家地区开始--->
											<td class="text-right">国家地区：</td>
											<td>
												<input type="text" name="guestInfo.national" placeholder="" value=""/>
											</td>
										<!--国家地区结束--->
										<!--机构名称开始--->
											<td class="text-right">单位中文名称：</td>
											<td>
												<input type="text" name="guestInfo.ch_organ_name" placeholder="" value=""/>
											</td>
										<!---机构名称结束--->
										</tr>
										<tr>
										<!--机构中文名称开始--->
											<td class="text-right">单位英文名称：</td>
											<td>
												<input type="text" name="guestInfo.en_organ_name" placeholder="" value=""/>
											</td>
										<!---机构中文名称结束--->
											<td class="text-right">职务：</td>
											<td>
												<input type="text" name="guestInfo.post" placeholder="" value=""/>
											</td>
										</tr>
										<tr>
										<!--联系电话开始--->
											<td class="text-right">联系电话：</td>
											<td>
												<input type="text" name="guestInfo.phone" placeholder="" value=""/>
											</td>
											<!--联络手机电话开始--->
											<td class="text-right">联系手机电话：</td>
											<td>
												<input type="text" name="guestInfo.mobile" placeholder="" value=""/>
											</td>
										<!---联络手机电话结束--->
										</tr>
										<tr>
											<td class="text-right">大陆手机号：</td>
											<td>
												<input type="text" name="guestInfo.phoneInMainLand" placeholder="" value=""/>
											</td>
											<td class="text-right">微信号：</td>
											<td>
												<input type="text" name="guestInfo.wechat_username" placeholder="" value=""/>
											</td>
										</tr>
										<tr>
										<!--电子邮箱开始--->
											<td class="text-right">电子邮箱：</td>
											<td>
												<input type="email" name="guestInfo.email" placeholder="" value=""/>
											</td>
										<!---电子邮件结束--->
										<!--地址开始--->
											<td class="text-right">地址：</td>
											<td>
												<input type="email" name="guestInfo.address" placeholder="" value=""/>
											</td>
										<!---地址结束--->
										<!---联系电话结束--->
										</tr>
										<tr>
										<!--邮编开始--->
											<td class="text-right">邮编：</td>
											<td>
												<input type="number" name="guestInfo.zip_code" placeholder="" value=""/>
											</td>
											<!--联络人开始--->
											<td class="text-right">传真：</td>
											<td>
												<input type="text" name="guestInfo.fax" placeholder="" value=""/>
											</td>
										<!---联络人结束--->
										</tr>
										<tr>
											<td class="text-right">联络人：</td>
											<td>
												<input type="text" name="guestInfo.cp_name" placeholder="" value=""/>
											</td>
											<td></td>
											<td></td>
										</tr>
										<tr>
										<!--联络人电话开始--->
											<td class="text-right">联络人电话：</td>
											<td>
												<input type="text" name="guestInfo.cp_phone" placeholder="" value=""/>
											</td>
										<!---联络人电话结束--->
										<!--联络人邮件开始--->
											<td class="text-right">联络人电子邮箱：</td>
											<td>
												<input type="email" name="guestInfo.cp_email" placeholder="" value=""/>
											</td>
										<!---联络人邮件结束--->
										</tr>
										<!---邮编结束--->
									</tbody>
								</table>
						</div>
						<div class="panel-heading">
							<h5 class="text-capitalize">嘉宾路线选择</h5>
						</div>
						<div class="panel-body">
							<table class="table table-responsive table-hover table-striped">
								<c:forEach items="${routeList}" var="route">
									<tr>
										<td class="text-left">
											<label><input type="checkbox" name="routeId" class="mr5" value="${route.id}">${route.route_nicName}：${route.route_content}(${route.route_name})</label>
										</td>
										<td>
											<p class="small pull-right text-info">考察时间:${route.route_start_time} - ${route.route_end_time}<!-- （30日贵阳散团） --></p>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
						
					<div class="panel panel-default width49 fr">
						<div class="panel-heading">
							<h5 class="text-capitalize">嘉宾住宿安排</h5>
						</div>
						<div class="panel-body">
							<table class="table table-responsive table-hover table-striped">
								<tbody>
									<tr>
										<td class="text-right" width="20%">入住日期:</td>
										<td><input type="datetime" name="hotel.checkin_time" placeholder="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
										<td class="text-right" width="20%">离店日期：</td>
										<td><input type="datetime" name="hotel.checkout_time" placeholder="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
									</tr>
									<tr>
										<td  class="text-right">酒店名称：</td>
										<td>
											<select onchange="selectHotel(this);">
												<option value="0">不限</option>
												<c:forEach items="${hotelList}" var="hotel">
													<option value="${hotel.id}">${hotel.hotel_name}</option>
												</c:forEach>
											</select>
										</td>
										<td class="text-right">酒店地址：</td>
										<td><input type="datetime" name="" id="hotel_addr" placeholder="" class="" disabled="disabled"></td>
									</tr>
									<tr>
										<td class="text-right">是否需要无烟楼层：</td>
										<td>
											<label><input type="radio" name="hotel.is_smoking" value="1" />吸烟楼层</label>
											<label><input type="radio" name="hotel.is_smoking" value="0" />不吸烟楼层</label>
										</td>
										<td class="text-right">入住房号：</td>
										<td><input type="text" name="hotel.room_num" class="" value=""></td>
									</tr>
									<tr>
										<td class="text-right">入住房型：</td>
										<td id="room_type">
											
										</td>
										<td class="text-right">同宿人员安排：</td>
										<td class="chose-accomadates">
											<label><input type="radio" name="hotel.with_roommate" value="0"/>不与其他人员同宿</label>
											<label><input type="radio" name="hotel.with_roommate" value="2"/>指定同宿人员</label>
											<label><input type="radio" name="hotel.with_roommate" value="1"/>大会随机分配同宿人员</label>
										</td>
									</tr>
									<tr style="display: none;">
										<td colspan="4">
											<table  width="100%">

												<tr>
													<td width="20%">
														姓名：
													</td>
													<td>
														<label><input type="text" name="hotel.roommate_name" value="" /></label>
													</td>
													<td>
														身份证/护照号码：
													</td>
													<td>
														<label><input type="text" id="rm_idNo" name="hotel.roommate_idNo" value="" /></label>
													</td>
												</tr>
												<tr>
													<td>同宿人员电子邮件：</td>
													<td>
														<label><input type="email" name="hotel.roommate_email" value="" /></label>
													</td>
													<td></td>
													<td></td>

												</tr>
												<tr>
													<td colspan="4" class="text-center">
														<!-- <button type="button" class="btn btn-primary" onclick=""><span class="fa fa-envelope-square"></span>发邮件</button> -->
														<button type="button" onclick="checkRoommate();" class="btn btn-primary">验证嘉宾</button>
													</td>
												</tr>

											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel panel-default width49 fr">
						<div class="panel-heading">
							<h5 class="text-capitalize">嘉宾行程安排</h5>
						</div>
						<div class="panel-body">
							<table class="table table-responsive table-hover table-striped">
								<tbody>
									<tr>
										<td class="text-right">抵达日期：</td>
										<td><input type="datetime" name="guestTrip.arrival_date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
										<td class="text-right">抵达时间：</td>
										<td><input type="datetime" name="guestTrip.arrival_time" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"></td>
									</tr>
									<tr>
										<td class="text-right">抵达站点：</td>
										<td><input type="text" name="guestTrip.arrival_station"></td>
										<td class="text-right">抵达航班（车次）号：</td>
										<td><input type="text" name="guestTrip.arrival_shift_no" value=""></td>
									</tr>
									<tr>
										<td class="text-right">离开日期：</td>
										<td><input type="datetime" name="guestTrip.leave_date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
										<td class="text-right">离开时间：</td>
										<td><input type="datetime" name="guestTrip.leave_time" onfocus="WdatePicker({dateFmt:'HH:mm:00',readOnly:true})"></td>
									</tr>
									<tr>
										<td class="text-right">离开站点：</td>
										<td><input type="text" name="guestTrip.leave_station"></td>
										<td class="text-right">离开航班（车次）号：</td>
										<td><input type="text" name="guestTrip.leave_shift_no"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel panel-default width49 fr">
						<div class="panel-heading">
							<span class="fr">
								<button class="btn btn-primary btn-lg">保存<span class="fa fa-save ml5"></span></button>
							</span>
							<span class="clearfix"></span>
						</div>
					</div>
				</div>
				</form>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->

			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

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
		
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/paginator/paginator.min.js"></script>

		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/page/page.js"></script>
		
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/mwi_tables/valid.js"></script>
		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
		<script type="text/javascript">
			$(function(){
				if(getCookie('responseCode') == 1){
					alert("录入成功！");
					delCookie('responseCode');
				}else if(getCookie('responseCode') == 0){
					alert("录入失败！");
					delCookie('responseCode');
				}else if(getCookie('auditCode') == 1){
					alert("审核成功！");
					delCookie('auditCode');
				}else if(getCookie('auditCode') == 0){
					alert("审核失败！");
					delCookie('auditCode');
				}
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
			
			function selectHotel(ev) {
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
							$("#room_type").append("<label><input type='radio' name='hotel.room_id' value='"+room[i].id+"'/>"+room[i].room_type_name+"</label>");
						}
					});
				}
			}
			
			function checkRoommate(){
				var rm_idNo = $("#rm_idNo").val();
				if(rm_idNo.length > 0){
					$.post("${contextPath}/guestInput/checkRoommate",{passportNo:rm_idNo},function(data){
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