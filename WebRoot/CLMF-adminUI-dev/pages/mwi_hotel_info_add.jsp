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

		<title>住宿信息</title>

		<!-- Bootstrap Core CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
				
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
		<!-- Custom CSS -->
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css" rel="stylesheet">
		<!-- Custom Fonts -->
		<link href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		<link href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<div class="row-header">
			<div class="col-lg-offset-2  col-lg-6">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">
			<div class="col-lg-12">
			
			<form action="${contextPath}/checkInfo/" method="post">
				<div class="panel panel-primary">
					
					<div class="panel-heading">
						<p class="text-capitalize">
							<span class="fa fa-info-circle fa-2x mr5"></span>住宿信息录入
						</p>
					</div>
					<div class="panel-body">
						<div class="panel panel-default">
							<div class="panel-body">
								<table class="table table-condensed  table-hover table-striped table-responsive " cellspacing="2" width="80%">
									<caption>
										<div class="pull-left query">
											<span>
												<a href="#">下载嘉宾住宿信息模板<span class="fa fa-download ml5"></span></a>
											</span>
											<span>
												导入嘉宾住宿信息Excel表:
												<input type="file" name="excel_info_about_guests" style="display: inline;"/>
											</span>
											<span>
												<button type="submit" class="btn btn-primary">批量导入<b class="fa fa-plus ml5"></b></button>
											</span>
											<span class="pull-right">
												<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit_info_about_staff_accomdation">新增住宿信息<b class="fa fa-plus ml5"></b></button>
											</span>
										</div>
									</caption>
									<thead>
										<tr>
											<th>序号</th>
											<th>嘉宾姓名</th>
											<th>英文姓名</th>
											<th>国籍</th>
											<th>性别</th>
											<th>单位职务</th>
											<th>酒店名称</th>
											<th>房型</th>
											<th>房号</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pageList.list}" var="li" varStatus="i">
											<tr>
												<td>${i.index + 1}</td>
												<td>${li.chinese_name}</td>
												<td>${li.english_name}</td>
												<td>${li.national}</td>
												<td>${li.sex}</td>
												<td>${li.post}</td>
												<td>${li.hotel_name}</td>
												<td>${li.room_type_name}</td>
												<td>${li.room_num}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
					<!-- /.panel-body -->
						</div>
						</form>
					</div>
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<!-- /#page-wrapper -->

		 <!---
            编辑嘉宾信息     	
       ---->
		<div id="edit_info_about_staff_accomdation" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<form action="${contextPath}/checkInfo/add" method="post">
						<div class="panel panel-primary">
							<div class="panel panel-heading">
								<h4>
									<span class="fa fa-edit mr5"></span>嘉宾住宿信息编辑
			         	          	<div class="pull-right btn-group-sm ">
				            	         <button type="submit" class="btn btn-success btn-sm">保存<span class="fa fa-save ml5"></span></button>
				            	         <button type="button" class="btn btn-success btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off ml5"></span></button>
			                      	</div>
			                    </h4>
							</div>
							<div class="panel panel-body">
								<table class="table table-hover table-striped table-responsive">
									<tbody>
                                        <tr>
                                        	<td width="20%" class="text-right">嘉宾姓名：</td>
                                        	<td class="text-left" width="27%"><input type="text" name="guest_name" placeholder="嘉宾姓名" value="${li.chinese_name}" style="width:100%"/></td>
                                        	<td width="26%" class="text-right">英文姓名：</td>
                                        	<td class="text-left" width="27%"><input type="text" name="guest_name" placeholder="英文姓名" value="${li.english_name}" style="width:100%"/></td>
                                        </tr>
                                        <tr>
                                        	<td class="text-right">性别：</td>
                                        	<td class="text-left">
                                        		<label class="mr10"><input type="radio" name="guest_sex" value="男" checked="checked"/>男</label>
                                        	    <label><input type="radio" name="guest_sex" value="女"/>女</label>
                                        	</td>
                                        	<td class="text-right">国籍：</td>
                                        	<td class="text-left">
                                        		<select>
                                        			<option>所有国家</option>
                                        		</select>
                                        	</td>
                                        </tr>
                                        <tr>
                                        	<td class="text-right">单位：</td>
                                        	<td class="text-left">
                                        		<input type="text" name="guest_unit" style="width:100%"/>
                                        	</td>
                                        	<td class="text-right">职务：</td>
                                        	<td class="text-left">
                                        		<input type="text" name="guest_job" style="width:100%"/>
                                        	</td>
                                        </tr>
                                        <tr>
                                        	<td class="text-right">身份证/护照号：</td>
                                        	<td  class="text-left" colspan="3"><input type="text" onblur="checkGuest(this);" placeholder="请输入身份证/护照号" value="" style="width: 200px !important;"></td>
                                        </tr>
                                        <tr>
                                        	<td class="text-right">酒店名称：</td>
                                        	<td class="text-left">
                                        		<select>
													<option>不限</option>
													<option>香格里拉</option>
													<option>人民酒店</option>
													<option>重庆鸡公煲</option>
												</select>
                                        	</td>
                                        	<td class="text-right">酒店地址：</td>
                                        	<td class="text-left"><input class="tdWidth"  type="text" name="guest_job" value="世界各地都有" style="width:100%"/></td>
                                        </tr>
										<tr>
											<td class="text-right">房间类型：</td>
											<td class="text-left">
												<label><input type="radio" name="roomType" checked="checked">单间</label>
												<label><input type="radio" name="roomType">大床房</label>
											</td>
											<td class="text-right">房号：</td>
											<td class="text-left">
												<input type="text"  name="live_room_num" value="GY3286"  style="width:100%" />
											</td>
										</tr>
                                        <tr>
                                        	<td class="text-right">入住时间：</td>
                                        	<td class="text-left">
                                        		<input type="text" value="" style="width:100%" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
                                        	</td>
                                        	<td class="text-right">离店时间：</td>
                                        	<td class="text-left">
                                        		<input type="text" value="" style="width:100%" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
                                        	</td>
                                        </tr>
										<tr>
											<td class="text-right">同宿人员安排：</td>
											<td class="chose-accomadates text-left text-left">
												<label><input type="radio" name="living_same_accomadation_type" value="2"/>指定同宿人员</label>
												<label><input type="radio" name="living_same_accomadation_type" checked="checked" value="1"/>不与其他人员同宿</label>
												<label><input type="radio" name="living_same_accomadation_type" value="0"/>大会随机分配同宿人员</label>
											</td>
											<td class="text-right">是否需要无烟楼层：</td>
											<td class="text-left">
												<label><input type="radio" name="living_room_about_smoking" value="smoking"  checked="checked" />吸烟楼层 </label>
												<label><input type="radio" name="living_room_about_smoking" value="no_smoking"  />不吸烟楼层</label>
											</td>
										</tr>
										<tr style="display: none;">
											<td colspan="4">
												<table  width="100%">
													<tr>
														<td width="25%" class="text-right">
															姓名：
														</td>
														<td class="text-left" width="27%">
															<label><input type="text" name="accomadation_name_with_guest" value=""  style="width:100%" /></label>
														</td>
														<td class="text-right" width="26%">同宿人员邮箱：</td>
														<td class="text-left" width="27%">
															<label><input type="text" name="accomadation_email" style="width:100%" ></label>
														</td>
													</tr>
													<tr>
														<td class="text-right">
															身份证/护照号码：
														</td>
														<td class="text-left" colspan="3">
															<label><input type="text" onblur="checkGuest(this);" placeholder="请输入身份证/护照号" value="" style="width: 200px !important;"></label>
														</td>
													</tr>
													<tr>
														<td colspan="4" class="text-center">
															<button type="button" class="btn btn-primary" onclick=""><span class="fa fa-envelope-square"></span>验证同宿人员</button>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						</form>
					</div>
				<!-- /.modal-content -->
				</div>
			</div>
		</div>

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
					alert("删除成功！");
					delCookie('responseCode');
				}else if(getCookie('responseCode') == 0){
					alert("删除失败！");
					delCookie('responseCode');
				}else if(getCookie('resultCode') == 1){
					alert("保存成功！");
					delCookie('resultCode');
				}else if(getCookie('resultCode') == 0){
					alert("保存失败！");
					delCookie('resultCode');
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
			
			function checkGuest(ev){
				var val = $(ev).val();
				if(val.length > 0){
					$.post("${contextPath}/checkInfo/checkGuest",{passportNo:val},function(data){
						if(data){
							
						}else{
							alert("不存在此嘉宾！");
						}
					});
				}
			}
			
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
		</script>
	</body>

</html>