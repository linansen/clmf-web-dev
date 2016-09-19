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

		<title>交通管理之司机信息</title>

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
							<span class="fa fa-ambulance fa-2x"> </span><span class="fa fa-info-circle fa-2x mr5"></span>司机信息
						</p>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table class="table table-condensed  table-hover table-striped table-responsive " cellspacing="2" width="80%">
							<caption>
								<form action="${contextPath}/driverInfo/importDriver" method="post" enctype="multipart/form-data">
								<div class="pull-left query">
									<span>
										<a href="${contextPath}/driverInfo/downloadTemplate">下载司机信息模板<span class="fa fa-download ml5"></span></a>
									</span>
									<span>
										导入司机信息Excel表：
										<input type="file" name="file" style="display: inline;"/>
									</span>
									<span>
										<button type="submit" class="btn btn-success">批量导入<b class="fa fa-plus ml5"></b></button>
									</span>
									<span class="pull-right">
										<button type="button" class="btn btn-success" data-toggle="modal" data-target="#add_info_about_staff">新增司机信息<b class="fa fa-plus ml5"></b></button>
										<button type="button" onclick="batchDel();" class="btn btn-danger" data-toggle="modal" data-target="#delDriver">批量删除司机信息</button>
									</span>
								</div>
								</form>
								<form action="${contextPath}/driverInfo/getList" method="post">
								<div class="pull-left" id="query">
									<span>
										司机编号：
										<input type="text" name="driver_no" placeholder="请输入司机编号" class="check-null" value="${driver_no}" />
									</span>
									<span>
										司机姓名：
										<input type="text" name="driver_name" placeholder="请输入司机姓名" value="${driver_name}"/>
									</span>
									<span>
										联系电话：
										<input type="text" name="phone_num" placeholder="请输入联系电话" value="${phone_num}"/>
									</span>
									<span>
										身份证号：
										<input type="text" name="id_num" placeholder="请输入身份证号" value="${id_num}"/>
									</span>
									<span>
										驾照类型：	
										<%-- <input type="text" name="driving_type" placeholder="请输入身份证号" value="${driving_type}"/> --%>
										<select name="driving_type">
											<c:choose>
												<c:when test="${driving_type == 1}">
													<option value="">不限</option>
													<option value="1" selected="selected">A型</option>
													<option value="2">B型</option>
													<option value="3">C型</option>
													<option value="4">D型</option>
												</c:when>
												<c:when test="${driving_type == 2}">
													<option value="">不限</option>
													<option value="1">A型</option>
													<option value="2" selected="selected">B型</option>
													<option value="3">C型</option>
													<option value="4">D型</option>
												</c:when>
												<c:when test="${driving_type == 3}">
													<option value="">不限</option>
													<option value="1">A型</option>
													<option value="2">B型</option>
													<option value="3" selected="selected">C型</option>
													<option value="4">D型</option>
												</c:when>
												<c:when test="${driving_type == 4}">
													<option value="">不限</option>
													<option value="1">A型</option>
													<option value="2">B型</option>
													<option value="3">C型</option>
													<option value="4" selected="selected">D型</option>
												</c:when>
												<c:otherwise>
													<option value="" selected="selected">不限</option>
													<option value="1">A型</option>
													<option value="2">B型</option>
													<option value="3">C型</option>
													<option value="4">D型</option>
												</c:otherwise>
											</c:choose>
										</select>
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
									<th>司机编号</th>
									<th>司机姓名</th>
									<th>司机性别</th>
									<th>身份证号</th>
									<th>手机号码</th>
									<th>驾照类型</th>
									<th>车辆编号</th>
									<th>车辆类型</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageList.list}" var="li" varStatus="i">
									<tr>
										<td><input type="checkbox" name="delDriverBox" value="${li.id}"></td>
										<td>${i.index + 1}</td>
										<td>${li.driver_no}</td>
										<td>${li.driver_name}</td>
										<td>
											<c:choose>
												<c:when test="${li.sex == 1}">男</c:when>
												<c:when test="${li.sex == 2}">女</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</td>
										<td>${li.id_num}</td>
										<td>${li.phone_num}</td>
										<td>
											<c:choose>
												<c:when test="${li.driving_type == 1}">A型</c:when>
												<c:when test="${li.driving_type == 2}">B型</c:when>
												<c:when test="${li.driving_type == 3}">C型</c:when>
												<c:when test="${li.driving_type == 4}">D型</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</td>
										<td></td>
										<td></td>
										<td class="text-center">
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#edit_info_about_staff${li.id}">编辑<span class="fa fa-edit"></span></button>
											<button type="button" onclick="javaScript:window.location.href='${contextPath}/driverInfo/delete?driverId=${li.id}';" class="btn btn-danger" data-toggle="modal" data-target="#delDriver">删除${li.id}<span class="fa fa-remove ml5"></span></button>
											<div id="edit_info_about_staff${li.id}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<form action="${contextPath}/driverInfo/update" method="post">
														<input type="hidden" name="driverInfor.id" value="${li.id}" />
														<div class="modal-body">
															<div class="panel panel-primary">
																<div class="panel panel-heading">
																	<h4><span class="fa fa-edit"></span>&nbsp;司机信息编辑
											
												         	          <div class="pull-right btn-group-sm ">
												
												            	         <button type="button" onclick="javaScript:window.location.href='${contextPath}/driverInfo/delete?driverId=${li.id}';" class="btn btn-danger btn-sm">删除<span class="fa fa-chain"></span></button>
												
												            	         <button type="submit" class="btn btn-success btn-sm">保存<span class="fa fa-save"></span></button>
												
												            	         <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
												
												                      </div>
												
												                    </h4>
																</div>
																<div class="panel panel-body">
																	<table class="table table-bordered table-hover table-responsive">
																		<tbody>
																			<tr>
																				<td>司机编号：</td>
																				<td>
																					<input type="text" name="driverInfor.driver_no" id="driver_number" placeholder="" value="${li.driver_no}">
																				</td>
																			</tr>
																			<tr>
																				<td>司机姓名：</td>
																				<td>
																					<input type="text" name="driverInfor.driver_name" id="driver_name" placeholder="" value="${li.driver_name}">
																				</td>
																			</tr>
																			<tr>
																				<td>性别：</td>
																				<td>
																					<c:choose>
																						<c:when test="${li.sex == 1}">
																							<input type="radio" name="driverInfor.sex" checked="checked" id="driver_sex" placeholder="" value="1">男&nbsp;
																							<input type="radio" name="driverInfor.sex" id="driver_sex" placeholder="" value="2">女&nbsp;
																						</c:when>
																						<c:when test="${li.sex == 2}">
																							<input type="radio" name="driverInfor.sex" id="driver_sex" placeholder="" value="1">男&nbsp;
																							<input type="radio" name="driverInfor.sex" checked="checked" id="driver_sex" placeholder="" value="2">女&nbsp;
																						</c:when>
																						<c:otherwise>
																							<input type="radio" name="driverInfor.sex" id="driver_sex" placeholder="" value="1">男&nbsp;
																							<input type="radio" name="driverInfor.sex" id="driver_sex" placeholder="" value="2">女&nbsp;
																						</c:otherwise>
																					</c:choose>
																				</td>
																			</tr>
																			<tr>
																				<td>身份证号：</td>
																				<td>
																					<input type="text" name="driverInfor.id_num" id="driver_passport" placeholder="" value="${li.id_num}">
																				</td>
																			</tr>
											
																			<tr>
																				<td>手机号码：</td>
																				<td>
																					<input type="tel" name="driverInfor.phone_num" id="driver_phone" placeholder="" value="${li.phone_num}">
																				</td>
																			</tr>
											
																			<tr>
																				<td>驾照类型</td>
																				<td>
																					<%-- <input type="text" name="driverInfor.driver_type" id="driver_license_type" placeholder="" value="${ }"/> --%>
																					<select name="driverInfor.driving_type">
																						<c:choose>
																							<c:when test="${li.driving_type == 1}">
																								<option value="">不限</option>
																								<option value="1" selected="selected">A型</option>
																								<option value="2">B型</option>
																								<option value="3">C型</option>
																								<option value="4">D型</option>
																							</c:when>
																							<c:when test="${li.driving_type == 2}">
																								<option value="">不限</option>
																								<option value="1">A型</option>
																								<option value="2" selected="selected">B型</option>
																								<option value="3">C型</option>
																								<option value="4">D型</option>
																							</c:when>
																							<c:when test="${li.driving_type == 3}">
																								<option value="">不限</option>
																								<option value="1">A型</option>
																								<option value="2">B型</option>
																								<option value="3" selected="selected">C型</option>
																								<option value="4">D型</option>
																							</c:when>
																							<c:when test="${li.driving_type == 4}">
																								<option value="">不限</option>
																								<option value="1">A型</option>
																								<option value="2">B型</option>
																								<option value="3">C型</option>
																								<option value="4" selected="selected">D型</option>
																							</c:when>
																							<c:otherwise>
																								<option value="" selected="selected">不限</option>
																								<option value="1">A型</option>
																								<option value="2">B型</option>
																								<option value="3">C型</option>
																								<option value="4">D型</option>
																							</c:otherwise>
																						</c:choose>
																					</select>
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
												</div>
											</div>
										</div>
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
			</form>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<!-- /#page-wrapper -->

		<!---新增嘉宾信息  ---->
		<div id="add_info_about_staff" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${contextPath}/driverInfo/add" method="post">
					<input type="hidden" name="driverInfor.id" value="" />
					<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel panel-heading">
								<h4><span class="fa fa-edit"></span>&nbsp;司机信息新增

			         	          <div class="pull-right btn-group-sm ">
			            	         <button type="submit" class="btn btn-success btn-sm">保存<span class="fa fa-save"></span></button>
			
			            	         <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
			
			                      </div>
			
			                    </h4>
							</div>
							<div class="panel panel-body">
								<table class="table table-bordered table-hover table-responsive">

									<tbody>
										<tr>
											<td>司机编号：</td>
											<td>
												<input type="text" name="driverInfor.driver_no" id="driver_number" placeholder="" value="">
											</td>
										</tr>
										<tr>
											<td>司机姓名：</td>
											<td>
												<input type="text" name="driverInfor.driver_name" id="driver_name" placeholder="" value="">
											</td>
										</tr>
										<tr>
											<td>性别：</td>
											<td>
												<input type="radio" name="driverInfor.sex" id="driver_sex" placeholder="" value="1">男&nbsp;
												<input type="radio" name="driverInfor.sex" id="driver_sex" placeholder="" value="2">女&nbsp;
											</td>
										</tr>
										<tr>
											<td>身份证号：</td>
											<td>
												<input type="text" name="driverInfor.id_num" id="driver_passport" placeholder="" value="">
											</td>
										</tr>

										<tr>
											<td>手机号码：</td>
											<td>
												<input type="tel" name="driverInfor.phone_num" id="driver_phone" placeholder="" value="">
											</td>
										</tr>

										<tr>
											<td>驾照类型</td>
											<td>
												<select name="driverInfor.driving_type">
													<option value="1">A型</option>
													<option value="2">B型</option>
													<option value="3">C型</option>
													<option value="4">D型</option>
												</select>
											</td>
										</tr>

									</tbody>

								</table>

							</div>
						</div>

					</div>

				</div>
				</form>
				<!-- /.modal-content -->

			</div>

		</div>
		<div class="modal fade" id="delDriver" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
				<form action="${contextPath}/driverInfo/batchDel">
					<input type="hidden" name="driverId" value="" id="hid_driverId" />
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							删除司机信息
						</h4>
					</div>
					<div class="modal-body text-center">
						<div class="text-center text-info">
							确定要删除这条司机信息吗？
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
				$("input[name='delDriverBox']:checked").each(function(){
                	str += $(this).val()+",";
	            });
				$("#hid_driverId").val(str);
			}
		</script>
	</body>

</html>