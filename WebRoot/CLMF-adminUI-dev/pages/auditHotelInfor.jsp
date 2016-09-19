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
<title>嘉宾个人酒店信息审核</title>
</head>

<body>
	<div class="modal-content">
		<div class="modal-body" style="padding: 0px;">
			<form action="${contextPath}/hotelAudit/hotelAudit" method="post">
			<input type="hidden" name="hotel.id" value="${hotel.hm_id}" />
			<input type="hidden" name="hotel.guest_id" value="${hotel.guest_id}" />
			<div class="panel panel-primary">
				<div class="panel-heading" style="height: 50px;">
					<div class="pull-left">
						<h5>
							<span class="fa fa-check-square-o mr5"></span>嘉宾个人酒店信息审核
						</h5>
					</div>
					<div class="pull-right btn-group-sm ">
						<button type="submit" class="btn btn-success btn-sm"><div class="fa fa-save mr5"></div>
							保存
						</button>
						<button type="button" class="btn btn-success btn-sm" data-dismiss="modal">
							<span class="fa fa-power-off mr5"></span>关闭
						</button>
					</div>
				</div>
				<div class="panel-body row-body">
					<table class="table table-striped  table-hover table-responsive">
						<caption style="color: red; text-align: center;">
							剩余房数:高级豪华房:21间,高级套房:18间,高级大床房:200间</caption>
						<tbody>
							<tr>
								<td width="20%" class="text-right">嘉宾姓名：</td>
								<td class="text-left"><input type="text" name="" placeholder="" disabled="disabled" value="${hotel.chinese_name}"/></td>
								<td width="30%" class="text-right">英文姓名：</td>
								<td class="text-left"><input type="text" name="" placeholder="" disabled="disabled" value="${hotel.english_name}" /></td>
							</tr>
							<tr>
								<td class="text-right">性别：</td>
								<td class="text-left">
									<c:choose>
										<c:when test="${hotel.sex == 1}">
											<label><input type="radio" name="" value="1" checked="checked" disabled="disabled" />男</label> 
											<label><input type="radio" name="" value="2" disabled="disabled" />女</label>
										</c:when>
										<c:when test="${hotel.sex == 2}">
											<label><input type="radio" name="" value="1" disabled="disabled" />男</label> 
											<label><input type="radio" name="" value="2" checked="checked" disabled="disabled" />女</label>
										</c:when>
										<c:otherwise>
											<label><input type="radio" name="" value="1" disabled="disabled" />男</label> 
											<label><input type="radio" name="" value="2" disabled="disabled" />女</label>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-right">国籍：</td>
								<td class="text-left">
									<input class="tdWidth" type="text" name="" value="${hotel.national}" disabled="disabled" />
								</td>
							</tr>
							<tr>
								<td class="text-right">单位：</td>
								<td class="text-left">
									<input class="tdWidth" type="text" name="" disabled="disabled" value="${hotel.ch_organ_name}" />
								</td>
								<td class="text-right">职务：</td>
								<td class="text-left">
									<input class="tdWidth" type="text" name="" disabled="disabled" value="${hotel.post}" />
								</td>
							</tr>
							<tr>
								<td class="text-right">身份证/护照号：</td>
								<td class="text-left" colspan="3">
									<input type="text" placeholder="" value="${hotel.passport_no}" style="width: 200px !important;" disabled="disabled">
								</td>
							</tr>
							<tr>
								<td class="text-right">酒店名称：</td>
								<td class="text-left">
									<select onchange="changeHotel(this);">
										<option value="0">不限</option>
										<c:forEach items="${hotelList}" var="hl">
											<c:choose>
												<c:when test="${hl.id == hotel.hotel_id}">
													<option value="${hl.id}" selected="selected">${hl.hotel_name}</option>
												</c:when>
												<c:otherwise>
													<option value="${hl.id}">${hl.hotel_name}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</td>
								<td class="text-right">酒店地址：</td>
								<td class="text-left">
									<input class="tdWidth" id="hotel_addr" type="text" name="" value="${hotel.hotel_addr}" />
								</td>
							</tr>
							<tr>
								<td class="text-right">房间类型：</td>
								<td class="text-left">
									<select id="roomId" name="hotel.room_id">
										<c:forEach items="${roomList}" var="room">
											<c:if test="${room.hotel_id == hotel.hotel_id}">
											<c:choose>
												<c:when test="${room.id == hotel.room_id}">
													<option value="${room.id}" selected="selected">${room.room_type_name}</option>
												</c:when>
												<c:otherwise>
													<option value="${room.id}">${room.room_type_name}</option>
												</c:otherwise>
											</c:choose>
											</c:if>
										</c:forEach>
									</select>
								</td>
								<td class="text-right">房号：</td>
								<td class="text-left">
									<input class="tdWidth" type="text" name="hotel.room_num" value="${hotel.room_num}" />
								</td>
							</tr>
							<tr>
								<td class="text-right">入住时间：</td>
								<td class="text-left"><input class="tdWidth" type="text" name="hotel.checkin_time" value="${hotel.checkin_time}" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="text-right">同宿人员安排：</td>
								<td class="chose-accomadates text-left text-left">
									<c:choose>
										<c:when test="${hotel.with_roommate == 0}">
											<label><input type="radio" name="hotel.with_roommate" checked="checked" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
											<label><input type="radio" name="hotel.with_roommate" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
											<label><input type="radio" name="hotel.with_roommate" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
										</c:when>
										<c:when test="${hotel.with_roommate == 1}">
											<label><input type="radio" name="hotel.with_roommate" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
											<label><input type="radio" name="hotel.with_roommate" checked="checked" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
											<label><input type="radio" name="hotel.with_roommate" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
										</c:when>
										<c:when test="${hotel.with_roommate == 2}">
											<label><input type="radio" name="hotel.with_roommate" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
											<label><input type="radio" name="hotel.with_roommate" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
											<label><input type="radio" name="hotel.with_roommate" checked="checked" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
										</c:when>
										<c:otherwise>
											<label><input type="radio" name="hotel.with_roommate" value="0" id="no_accomodation_about_guest" />不与其他人员同宿</label>
											<label><input type="radio" name="hotel.with_roommate" value="1" id="random_accomodation_about_guest" />大会随机分配同宿人员</label>
											<label><input type="radio" name="hotel.with_roommate" value="2" id="only_accomodation_about_guest" />指定同宿人员</label>
										</c:otherwise>
									</c:choose>
								<td class="text-right">是否需要无烟楼层：</td>
								<td class="text-left">
									<c:choose>
										<c:when test="${hotel.is_smoking == 0}">
											<input type="radio" name="hotel.is_smoking" value="1"/>吸烟楼层 </label>
											<input type="radio" name="hotel.is_smoking" value="0" checked="checked"/>不吸烟楼层</label>
										</c:when>
										<c:when test="${hotel.is_smoking == 1}">
											<input type="radio" name="hotel.is_smoking" value="1" checked="checked"/>吸烟楼层 </label>
											<input type="radio" name="hotel.is_smoking" value="0"/>不吸烟楼层</label>
										</c:when>
										<c:otherwise>
											<input type="radio" name="hotel.is_smoking" value="1"/>吸烟楼层 </label>
											<input type="radio" name="hotel.is_smoking" value="0"/>不吸烟楼层</label>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr style="display: none;">
								<td colspan="4">
									<table width="100%" class="table table-bordered">
										<thead>
											<tr>
												<th colspan="4">同宿人员信息</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td width="20%" class="text-right">中文姓名：</td>
												<td class="text-left">
													<input type="text" name="hotel.roommate_name" placeholder="" value="${hotel.roommate_name}" />
												</td>
												<td width="30%" class="text-right">英文姓名：</td>
												<td class="text-left">
													<input type="text" name="" placeholder="" value="" />
												</td>
											</tr>
											<tr>
												<td class="text-right">性别：</td>
												<td class="text-left">
													<input type="radio" name="" value="男" checked="checked" />男&nbsp; 
													<input type="radio" name="" value="女" />女&nbsp;</td>
												<td class="text-right">国籍：</td>
												<td class="text-left">
													<input class="tdWidth" type="text" name="" value="" />
												</td>
											</tr>
											<tr>
												<td class="text-right">单位：</td>
												<td class="text-left">
													<input class="tdWidth" type="text" name="" />
												</td>
												<td class="text-right">职务：</td>
												<td class="text-left">
													<input class="tdWidth" type="text" name="" />
												</td>
											</tr>
											<tr>
												<td class="text-right"><span class="red-text">*</span>身份证/护照号：</td>
												<td class="text-left" colspan="2">
													<input type="text" name="hotel.roommate_idNo" placeholder="请输入身份证/护照号" value="${hotel.roommate_idNo}" style="width: 200px !important;">
												</td>
												<td><label><input type="checkbox" name="is_audit_roommate" value="1">是否同时审核同宿人员</label></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<table
						class="table table-striped table-bordered table-responsive table-hover">
						<tbody>
							<tr>
								<td width="20%" class="text-right">审核是否通过：</td>
								<td class="text-left">
									<label><input type="radio" name="is_audit" value="1" checked="checked"/>是</label>
									<label><input type="radio" name="is_audit" value="2" class="ml10" />否</label>
								</td>
								<td class="text-right">是否微信推送：</td>
								<td class="text-left">
									<label><input type="radio" name="is_wechat" value="1" checked="checked" />是</label>
									<label><input type="radio" name="is_wechat" value="0" class="ml10" />否</label>
								</td>
							</tr>
							<tr>
								<td class="text-right">是否邮件通知：</td>
								<td class="text-left">
									<label><input type="radio" name="is_email" value="1" checked="checked"/>是</label>
									<label><input type="radio" name="is_email" value="0" class="ml10" />否</label>
								</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<!--<table class="table table-striped table-bordered table-hover " cellspacing="2" width="80%">
										  <caption style="color: red; text-align: center;">
										                   	    剩余房数:高级豪华房:21间,高级套房:18间,高级大床房:200间
										  </caption>
											<thead>
												<tr>
													<th>序号</th>
													<th>嘉宾姓名</th>
													<th>性别</th>
													<th>国籍</th>
													<th>单位</th>
													<th>职务</th>
													<th>房间类型</th>
													<th>房号</th>
													<th>入住时间</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>林岸森</td>
													<td>男</td>
													<td>中国</td>
													<td>新华社</td>
													<td>新华社新闻部部长</td>
													<td>豪华大床房</td>
													<td>GY3270</td>
													<td>2015-8-20</td>
												</tr>
											</tbody>
										</table>
					              		<table class="table table-striped table-bordered table-responsive table-hover">
											<tbody>
												<tr>
													<td width="20%" class="text-right">审核是否通过：</td>
													<td class="text-left">
														<label><input type="radio" name="guest_hotel_check" value="" />是</label>
														<label><input type="radio" name="guest_hotel_check" value="" class="ml10"/>否</label>
													</td>
												</tr>
												<tr>
													<td class="text-right">
														是否微信推送：
													</td>
													<td class="text-left">
														<label><input type="radio" name="guest_send_weichat" value="guest_send_weichat_yes" />是</label>
														<label><input type="radio" name="guest_send_weichat" value="guest_send_weichat_no" class="ml10"/>否</label>
													</td>
												</tr>
												<tr>
													<td class="text-right">
														是否短信通知：
													</td>
													<td class="text-left">
														<label><input type="radio" name="austom_send_message" value="guest_send_message_yes" />是</label>
														<label><input type="radio" name="austom_send_message" value="guest_send_message_no" class="ml10"/>否</label>
													</td>
												</tr>
											</tbody>
					              		</table>-->
				</div>
			</div>
			</form>
		</div>

	</div>
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
			$('.chose-accomadates').on('click',function(){
				var checkVal = $(this).find('input[type=radio]:checked').val();
				var nextArea = $(this).parent().next();
				checkVal == 2 ? nextArea.show() : nextArea.hide();
			});
			
			function changeHotel(ev){
				var hotelId = $(ev).val();
				if(hotelId == 0){
					$("#hotel_addr").val("");
					$("#roomId").empty();
				}else{
					$.post("${contextPath}/guestInfo/getHotel",{hotelId:hotelId},function(data){
						$("#hotel_addr").val(data.hotel_addr);
						var room = data.list;
						$("#roomId").empty();
						for ( var i = 0; i < room.length; i++) {
							$("#roomId").append("<option value='"+room[i].id+"'>"+room[i].room_type_name+"</option>");
						}
					});
				}
			}
		</script>
</body>

</html>