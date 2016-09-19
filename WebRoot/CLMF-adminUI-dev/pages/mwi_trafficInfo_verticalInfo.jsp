<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>交通管理之车辆信息</title>

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
			<div class="col-lg-offset-2  col-lg-6">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<p class="text-capitalize">
							<span class="fa fa-ambulance fa-2x"> </span><span class="fa fa-info-circle fa-2x mr5"></span>车辆信息
						</p>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table class="table table-condensed  table-hover table-striped table-responsive " cellspacing="2" width="80%">
							<caption>
								<form action="${contextPath}/carInfor/importCarInfo" method="post" enctype="multipart/form-data">
								<div class="pull-left query">
									<span>
										<a href="${contextPath}/carInfor/downLoadTemplate">下载车辆信息模板<span class="fa fa-download ml5"></span></a>
									</span>
										<span>
											导入车辆信息Excel表：
											<input type="file" name="file" style="display: inline;"/>
										</span>
										<span>
											<button type="submit" class="btn btn-success">批量导入<b class="fa fa-plus ml5"></b></button>
										</span>
									<span class="pull-right">
										<button type="button" class="btn btn-success" data-toggle="modal" data-target="#add_info_about_vetical">新增车辆信息<b class="fa fa-plus ml5"></b></button>
										<button type="button" onclick="batchDel();" class="btn btn-danger" data-toggle="modal" data-target="#delCar">批量删除车辆信息</button>
									</span>
								</div>
								</form>
								<form action="${contextPath}/carInfor/getList" method="post">
								<div class="pull-left" id="query">
									<span>
										车辆编号：
										<input type="text" name="car_no" placeholder="请输入车辆编号" value="${car_no}"/>
									</span>
									<span>
										车牌号：
										<input type="text" name="car_num" placeholder="请输入车牌号" value="${car_num}"/>
									</span>
									<span>
										车辆类别：
										<select name="car_category">
											<c:choose>
												<c:when test="${car_category == 1}">
													<option value="">不限</option>
													<option value="1" selected="selected">贵宾专用</option>
													<option value="2">平民专用</option>
													<option value="3">工作人员专用</option>
												</c:when>
												<c:when test="${car_category == 2}">
													<option value="">不限</option>
													<option value="1">贵宾专用</option>
													<option value="2" selected="selected">平民专用</option>
													<option value="3">工作人员专用</option>
												</c:when>
												<c:when test="${car_category == 3}">
													<option value="">不限</option>
													<option value="1">贵宾专用</option>
													<option value="2">平民专用</option>
													<option value="3" selected="selected">工作人员专用</option>
												</c:when>
												<c:otherwise>
													<option value="" selected="selected">不限</option>
													<option value="1">贵宾专用</option>
													<option value="2">平民专用</option>
													<option value="3">工作人员专用</option>
												</c:otherwise>
											</c:choose>
										</select>
									</span>
									<span>
										车型：
										<input type="text" name="car_model" placeholder="请输入车型" value="${car_model}" />
									</span>
									<span>
										座位数量：
										<input type="text" name="seat_num" placeholder="请输入座位数量" value="${seat_num}" />
									</span>
									<span>
										<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
									</span>
									<span>
										<label>记录总数：<b class="red-text">${pageList.totalRow}</b>条</label>
									</span>
								</div>
								</form>
							</caption>
							<thead>
								<tr>
									<th><label>全选<input type="checkbox" class="checkAll"></label></th>
									<th>序号</th>
									<th>车辆编号</th>
									<th>车牌号</th>
									<th>车辆类别</th>
									<th>车型</th>
									<th>座位数量</th>
									<th>司机姓名</th>
									<th>司机驾照类型</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageList.list}" var="li" varStatus="i">
									<tr>
										<td><input type="checkbox" name="delCarBox" value="${li.id}"></td>
										<td>${i.index + 1}</td>
										<td>${li.car_no}</td>
										<td>${li.car_num}</td>
										<td>
											<c:choose>
												<c:when test="${li.car_category == 1}">贵宾专用</c:when>
												<c:when test="${li.car_category == 2}">平民专用</c:when>
												<c:when test="${li.car_category == 3}">工作人员专用</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</td>
										<td>${li.car_model}</td>
										<td>${li.seat_num}</td>
										<td></td>
										<td></td>
										<td class="text-center">
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#edit_info_about_vetical${li.id}">编辑<span class="fa fa-edit ml5"></span></button>
											<button type="button" onclick="javaScript:window.location.href='${contextPath}/carInfor/delete?carId=${li.id}';" class="btn btn-danger" data-toggle="modal" data-target="#delCar">删除<span class="fa fa-remove ml5"></span></button>
											<!---编辑车辆信息---->
											<div id="edit_info_about_vetical${li.id}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-body">
															<form action="${contextPath}/carInfor/update" method="post">
															<input type="hidden" name="carInfor.id" value="${li.id}" />
															<div class="panel panel-primary">
																<div class="panel panel-heading">
																	<h4>
																		<span class="fa fa-edit mr5"></span>车辆信息编辑
																		<div class="pull-right btn-group-sm">
																			<button type="submit" class="btn btn-info btn-sm">保存<span class="fa fa-save"></span></button>
																			<button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
																			</button>
																		</div>
																	</h4>
																</div>
																<div class="panel panel-body">
																	<table class="table table-bordered table-hover table-responsive">
																		<tbody>
																			<tr>
																				<td>车辆编号：</td>
																				<td>
																					<input type="text" name="carInfor.car_no" id="staff_num" placeholder="请输入车辆编号" value="${li.car_no}" />
																				</td>
																			</tr>
																			<tr>
																				<td>车牌号：</td>
																				<td>
																					<input type="text" name="carInfor.car_num" id="staff_name" placeholder="请输入车牌号" value="${li.car_num}" />
																				</td>
																			</tr>
																			<tr>
																				<td>车辆类别：</td>
																				<td>
																					<!-- <input type="text" name="carInfor.car_category" placeholder="请输入车辆类别"> -->
																					<select name="carInfor.car_category">
																						<c:choose>
																							<c:when test="${li.car_category == 1}">
																								<option value="">不限</option>
																								<option value="1" selected="selected">贵宾专用</option>
																								<option value="2">平民专用</option>
																								<option value="3">工作人员专用</option>
																							</c:when>
																							<c:when test="${li.car_category == 2}">
																								<option value="">不限</option>
																								<option value="1">贵宾专用</option>
																								<option value="2" selected="selected">平民专用</option>
																								<option value="3">工作人员专用</option>
																							</c:when>
																							<c:when test="${li.car_category == 3}">
																								<option value="">不限</option>
																								<option value="1">贵宾专用</option>
																								<option value="2">平民专用</option>
																								<option value="3" selected="selected">工作人员专用</option>
																							</c:when>
																							<c:otherwise>
																								<option value="" selected="selected">不限</option>
																								<option value="1">贵宾专用</option>
																								<option value="2">平民专用</option>
																								<option value="3">工作人员专用</option>
																							</c:otherwise>
																						</c:choose>
																					</select>
																				</td>
																			</tr>
																			<tr>
																				<td>车型：</td>
																				<td>
																					<input type="text" name="carInfor.car_model" id="vertical_category" placeholder="请输入车型" value="${li.car_model}" />
																				</td>
										        								</tr>
												         					<tr>
												         						<td>座位数量：</td>
												         						<td>
												         							<input type="number" name="carInfor.seat_num" id="vertical_seat_number" placeholder="请输入座位数量" value="${li.seat_num}" />
												         						</td>
												         					</tr>
										        							</tbody>
										        						</table>
										        					</div>
										        				</div>
										        				</form>
										        			</div>
										        		</div>
										        	</div>
										        </div><!-- /.modal-content -->
										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>

					</div>
					<!-- /.panel-body -->

					<div class="panel-footer ">
						
						<div class="navbar navbar-default navbar-link">
							<div class="pull-left mt25 ml10">
								展示：
								<select name="select_items">
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<option value="100">100</option>
									<option value="500">500</option>
								</select>
								数据
							</div>
							<div class="pull-left mt25 ml20">
								跳到第
								<input type="number" name="select_guest_name" style="width: 70px !important;"/>
								页
								<button class="btn btn-primary btn-sm">go</button>
							</div>
							<div class="pull-left mt30 ml20">
								<a href="#">升序</a>
								<a href="#">降序</a>
							</div>
							<div class="nav nav-tabs nav-tabs-justified pull-right">
								<ul class="paginator nav nav-tabs nav-tabs-justified pull-right">
								</ul>
							</div>

						</div>

					</div>

				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<!-- /#page-wrapper -->
		<!---新增车辆信息---->
		<div id="add_info_about_vetical" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<form action="${contextPath}/carInfor/add" method="post">
						<div class="panel panel-primary">
							<div class="panel panel-heading">
								<h4>
									<span class="fa fa-edit mr5"></span>新增车辆信息
									<div class="pull-right btn-group-sm">
										<button type="submit" class="btn btn-info btn-sm">保存<span class="fa fa-save"></span></button>
										<button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
										</button>
									</div>
								</h4>
							</div>
							<div class="panel panel-body">
								<table class="table table-bordered table-hover table-responsive">
									<tbody>
										<tr>
											<td>车辆编号：</td>
											<td>
												<input type="text" name="carInfor.car_no" id="staff_num" placeholder="请输入车辆编号" value="" />
											</td>
										</tr>
										<tr>
											<td>车牌号：</td>
											<td>
												<input type="text" name="carInfor.car_num" id="staff_name" placeholder="请输入车牌号" value="" />
											</td>
										</tr>
										<tr>
											<td>车辆类别：</td>
											<td>
												<!-- <input type="text" name="carInfor.car_category" placeholder="请输入车辆类别"> -->
												<select name="carInfor.car_category">
													<option value="" selected="selected">不限</option>
													<option value="1">贵宾专用</option>
													<option value="2">平民专用</option>
													<option value="3">工作人员专用</option>
												</select>
											</td>
										</tr>
										<tr>
											<td>车型：</td>
											<td>
												<input type="text" name="carInfor.car_model" id="vertical_category" placeholder="请输入车型" value="" />
											</td>
	        								</tr>
			         					<tr>
			         						<td>座位数量：</td>
			         						<td>
			         							<input type="number" name="carInfor.seat_num" id="vertical_seat_number" placeholder="请输入座位数量" value="" />
			         						</td>
			         					</tr>
	        							</tbody>
	        						</table>
	        					</div>
	        				</div>
	        				</form>
	        			</div>
	        		</div>
	        	</div>
	        </div><!-- /.modal-content -->
										        
         <div class="modal fade" id="delCar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${contextPath}/carInfor/batchDel" method="post">
					<input type="hidden" name="carId" value="" id="hid_carId" />
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							删除车辆信息
						</h4>
					</div>
					<div class="modal-body text-center">
						<div class="text-center text-info">
							确定要删除这条车辆信息吗？
						</div>
						<div class="text-center mt20">
							<button type="submit" class="btn btn-danger mr10">确定</button>
							<button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
    	
  		<!-- jQuery -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/jquery/dist/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
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
				if(getCookie('importCode') == 1){
					alert("导入成功！");
					delCookie('importCode');
				}else if(getCookie('importCode') == 0){
					alert("导入失败！");
					delCookie('importCode');
				}else if(getCookie('editCode') == 1){
					alert("修改成功！");
					delCookie('editCode');
				}else if(getCookie('editCode') == 0){
					alert("修改失败！");
					delCookie('editCode');
				}else if(getCookie('addCode') == 1){
					alert("添加成功！");
					delCookie('addCode');
				}else if(getCookie('addCode') == 0){
					alert("添加失败！");
					delCookie('addCode');
				}else if(getCookie('delCode') == 1){
					alert("删除成功！");
					delCookie('delCode');
				}else if(getCookie('delCode') == 0){
					alert("删除失败！");
					delCookie('delCode');
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
			
			function batchDel(){
				var str = "";
				$("input[name='delCarBox']:checked").each(function(){
                	str += $(this).val()+",";
	            });
				$("#hid_carId").val(str);
			}
			
		</script>
	</body>
	
</html>