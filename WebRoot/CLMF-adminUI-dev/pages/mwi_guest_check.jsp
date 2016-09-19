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

		<title>嘉宾审核</title>
		
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
			
			<form action="${contextPath}/guestAudit/auditList" method="post">
			<!-- page -->
			<input type="hidden" class="pageIndex" name="currentPage" value='<c:out value="${pageList.pageNumber}" default="1"/>'>
			<input type="hidden" class="pageSize" name="currentSize" value='<c:out value="${pageList.pageSize}" default="10"/>'>
			<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${pageList.totalPage}" default="1"/>'>
			<!-- page -->

				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-info-circle fa-2x"></span>&nbsp;嘉宾基本信息管理</p>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">
						<table class="table table-striped table-bordered table-hover " cellspacing="0" width="80%">
							<caption>
								<div class="pull-left" id="query">
									<span>
										嘉宾姓名：
										<input type="text" name="chineseName" placeholder="请输入嘉宾姓名" value="${chineseName}"/>
									</span>
									<span>
										英文姓名：
										<input type="text" name="englishName" placeholder="请输入英文姓名" value="${englishName}"/>
									</span>
									<span>
										国籍：
										<select name="national">
											<option value="">请输选择国籍</option>
											<c:forEach items="${nationalList}" var="na">
												<c:choose>
													<c:when test="${na.national == national}">
														<option value="${na.national}" selected="selected">${na.national}</option>
													</c:when>
													<c:otherwise>
														<option value="${na.national}">${na.national}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</span>
									<span>
										审核状态：
										<select name="auditStatus">
											<option value="">全部</option>
											<c:choose>
												<c:when test="${auditStatus == 0}">
													<option value="0" selected="selected">待审核</option>
													<option value="1">已通过</option>
													<option value="2">拒绝参会</option>
													<option value="3">拒绝登录</option>
												</c:when>
												<c:when test="${auditStatus == 1}">
													<option value="0">待审核</option>
													<option value="1" selected="selected">已通过</option>
													<option value="2">拒绝参会</option>
													<option value="3">拒绝登录</option>
												</c:when>
												<c:when test="${auditStatus == 2}">
													<option value="0">待审核</option>
													<option value="1">已通过</option>
													<option value="2" selected="selected">拒绝参会</option>
													<option value="3">拒绝登录</option>
												</c:when>
												<c:when test="${auditStatus == 3}">
													<option value="0">待审核</option>
													<option value="1">已通过</option>
													<option value="2">拒绝参会</option>
													<option value="3" selected="selected">拒绝登录</option>
												</c:when>
												<c:otherwise>
													<option value="0">待审核</option>
													<option value="1">已通过</option>
													<option value="2">拒绝参会</option>
													<option value="3">拒绝登录</option>
												</c:otherwise>
											</c:choose>
										</select>
									</span>
									<span>
										<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
									</span>
									<span>
										<button type="button" class="btn btn-primary" id="ad_query_button">高级查询</button>
									</span>
									<span>
										<label>记录总数：<b class="red-text">${pageList.totalRow}</b>条</label>
									</span>
									<span class="pull-right">
										<button type="button" onclick="batchAudit();" class="btn btn-success" data-toggle="modal" data-target="#check_info_some_guest">嘉宾批量审核<b class="fa fa-check ml5"></b></button>
										<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete_some_guest">批量删除<b class="fa fa-check ml5"></b></button>
									</span>
								</div>
								<div class="pull-left" id="ad_query">
									<span>
										单位职务：
										<input type="text" name="post" placeholder="请输入单位职务" value="${post}"/>
									</span>
									<span>
										手机号码：
										<input type="text" name="mobile" placeholder="请输入手机号码" value="${mobile}"/>
									</span>
									<span>
										性别：
										<select name="sex">
											<c:choose>
												<c:when test="${sex == 1}">
													<option value="">不限</option>
													<option value="1" selected="selected">男</option>
													<option value="2">女</option>
												</c:when>
												<c:when test="${sex == 2}">
													<option value="">不限</option>
													<option value="1">男</option>
													<option value="2" selected="selected">女</option>
												</c:when>
												<c:otherwise>
													<option value="" selected="selected">不限</option>
													<option value="1">男</option>
													<option value="2">女</option>
												</c:otherwise>
											</c:choose>
										</select>
									</span>
									<span>
										电子邮件:
										<input type="text" name="email" placeholder="请输入电子邮件" value="${email}"/>
									</span>
								</div>
							</caption>
							<thead>
								<tr>
									<th><label>全选<input type="checkbox" name="checkbox" id="checkAll"></label></th>
									<th>序号</th>
									<th>嘉宾姓名</th>
									<th>英文姓名</th>
									<th>国籍</th>
									<th>身份证号/passport</th>
									<th>单位职务</th>
									<th>性别</th>
									<th>审核状态</th>
									<th>更多操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageList.list}" var="li" varStatus="i">
									<tr>
										<td>
											<input type="checkbox" name="checkbox_data" value="${li.id}" data-email="${li.email}" data-name="${li.chineseName}">
										</td>
										<td>${i.index + 1}</td>
										<td>${li.chineseName}</td>
										<td>${li.englishName}</td>
										<td>${li.national}</td>
										<td>${li.passportNo}</td>
										<td>${li.post}</td>
										<td>
											<c:choose>
												<c:when test="${li.sex == 1}">男</c:when>
												<c:otherwise>女</c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${li.audit_status == 0}">待审核</c:when>
												<c:when test="${li.audit_status == 1}">已通过</c:when>
												<c:when test="${li.audit_status == 2}">拒绝参会</c:when>
												<c:when test="${li.audit_status == 3}">拒绝登录</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</td>
										<td>
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#check_info_about_guest" onclick="javaScript:$('#btn_guestInfor').text('${li.email}(${li.chineseName})');$('#hid_guestId').val('${li.id}');">审核<span class="fa fa-check"></span></button>
											<a href="${contextPath}/guestInfo/toEditGuest?guestId=${li.id}&flag=2" class="btn btn-default ml10" data-toggle="modal" data-target="#edit_info_about_guest">编辑<span class="fa fa-edit ml5"></span></a>
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
								<select class="pageSizeSelect" name="select_items">
									<c:choose>
										<c:when test="${pageList.pageSize == 10}"><option selected="selected" value="10">10</option></c:when>
										<c:otherwise><option value="10">10</option></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageList.pageSize == 20}"><option selected="selected" value="20">20</option></c:when>
										<c:otherwise><option value="20">20</option></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageList.pageSize == 50}"><option selected="selected" value="50">50</option></c:when>
										<c:otherwise><option value="50">50</option></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageList.pageSize == 100}"><option selected="selected" value="100">100</option></c:when>
										<c:otherwise><option value="100">100</option></c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pageList.pageSize == 500}"><option selected="selected" value="500">500</option></c:when>
										<c:otherwise><option value="500">500</option></c:otherwise>
									</c:choose>
								</select>
								数据
							</div>
							<div class="pull-left mt25 ml20">
								跳到第
								<input type="number" name="select_guest_name" style="width: 70px !important;" value="${pageList.pageNumber}"/>
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
				</form>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<!-- /#page-wrapper -->

		<!---编辑嘉宾信息 ---->

		<div id="edit_info_about_guest" class="modal fade modalRefresh" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

				</div>
				<!-- /.modal-content -->

			</div>

		</div>
		
		<div id="check_info_about_guest" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">
					<form action="${contextPath}/guestAudit/auditGuest" method="post">
					<input type="hidden" name="guestId" value="" id="hid_guestId" />
					<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
						<h5 class="modal-title pull-left white-text" id="myModalLabel">嘉宾审核</h5>
						<div class="pull-right btn-group-sm">
							<button type="submit" class="btn btn-danger">确定<span class="fa fa-chain"></span>
							</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
							</button>
						</div>
					</div>

					<div class="modal-body">
						<table class="table table-condensed table-responsive table-hover">
							<caption>
	
							</caption>
							<tbody>
								<tr>
									<td width="20%">嘉宾:</td>
									<td>
										<button type="button" class="btn btn-default btn-sm mt5" id="btn_guestInfor"></button>
									</td>
								</tr>
								<tr>
									<td>是否审核通过：</td>
									<td class="guest-check-pass">
										<label><input type="radio" name="status" value="1" checked="checked"/>通过</label>
										<label><input type="radio" name="status" value="2"/>拒绝,可以补充资料</label>
										<label><input type="radio" name="status" value="3"/>拒绝,禁止登录</label>
									</td>
								</tr>
								<tr class="refuse_reason" style="display: none;">
									<td>拒绝理由</td>
									<td>
										<textarea rows="4" cols="70" name="refuse_reson" placeholder="请输入拒绝理由"></textarea>
									</td>
								</tr>
								<tr>
									<td>是否发送邮件：</td>
									<td class="check-if-email">
										<label><input type="radio" name="isSentEmail" value="0"/>否</label>
										<label><input type="radio" name="isSentEmail" value="1" checked="checked" />是</label>
									</td>
								</tr>
								<tr class="email-language">
									<td>邮件模板语言:</td>
									<td>
										<label><input type="radio" name="templateLanguage" value="0" />英语</label>
										<label><input type="radio" name="templateLanguage" value="1" checked="checked" />中文</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					</form>
				</div>
				<!-- /.modal-content -->

			</div>

		</div>
		<div id="check_info_some_guest" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">
					<form action="${contextPath}/guestAudit/batchAuditGuest" method="post">
					<input type="hidden" name="guestId" value="" id="hid_batch_guestId" />
					<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
						<h5 class="modal-title pull-left white-text" id="myModalLabel">嘉宾审核</h5>
						<div class="pull-right btn-group-sm">
							<button type="submit" class="btn btn-danger">确定<span class="fa fa-chain"></span></button>
							<button type="button" class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span></button>
						</div>
					</div>

					<div class="modal-body">
						<table class="table table-condensed table-responsive table-hover">
							<caption>
	
							</caption>
							<tbody>
								<tr>
									<td width="20%">嘉宾:</td>
									<td id="td_batch_audit">
										
									</td>
								</tr>
								<tr>
									<td>是否审核通过：</td>
									<td class="guest-check-pass">
										<label><input type="radio" name="status" value="1" checked="checked"/>通过</label>
										<label><input type="radio" name="status" value="2"/>拒绝,可以补充资料</label>
										<label><input type="radio" name="status" value="3"/>拒绝,禁止登录</label>
									</td>
								</tr>
								<tr class="refuse_reason" style="display: none;">
									<td>拒绝理由</td>
									<td>
										<textarea rows="4" cols="70" name="refuse_reson" placeholder="请输入拒绝理由">
										</textarea>
									</td>
								</tr>
								<tr>
									<td>是否发送邮件：</td>
									<td class="check-if-email">
										<label><input type="radio" name="isSentEmail" value="0"/>否</label>
										<label><input type="radio" name="isSentEmail" value="1" checked="checked" />是</label>
									</td>
								</tr>
								<tr class="email-language">
									<td>邮件模板语言:</td>
									<td>
										<label><input type="radio" name="templateLanguage" value="0" />英语</label>
										<label><input type="radio" name="templateLanguage" value="1" checked="checked" />中文</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					</form>
				</div>
				<!-- /.modal-content -->

			</div>

		</div>
		<div id="delete_some_guest" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
						<h5 class="modal-title pull-left white-text" id="myModalLabel">批量删除</h5>
						<div class="pull-right btn-group-sm">
							<a href='javaScript:;' onclick="batchDel();" class="btn btn-danger">确定<span class="fa fa-remove"></span></a>
							<button class="btn btn-warning" data-dismiss="modal">取消<span class="fa fa-power-off"></span></button>
						</div>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h5 class="panel-title diningManageToll">确定要删除嘉宾吗？</h5>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
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
				if(getCookie('responseCode') == 1){
					alert("删除成功！");
					delCookie('responseCode');
				}else if(getCookie('responseCode') == 0){
					alert("删除失败！");
					delCookie('responseCode');
				}else if(getCookie('auditCode') == 1){
					alert("审核成功！");
					delCookie('auditCode');
				}else if(getCookie('auditCode') == 0){
					alert("审核失败！");
					delCookie('auditCode');
				}else if(getCookie('resultCode') == 1){
					alert("保存成功！");
					delCookie('resultCode');
				}else if(getCookie('resultCode') == 0){
					alert("保存失败！");
					delCookie('resultCode');
				}
			});
		
			function batchDel(){
				var str = "";
				$("input[name='checkbox_data']:checked").each(function(){
                	str += $(this).val()+",";
	            });
				if(str.length > 0){
					window.location.href = "${contextPath}/guestAudit/delGuest?guestId="+str;
				}else{
					alert("请选择删除项！");
				}
			}
			
			function batchAudit(){
				var str = "";
				$("input[name='checkbox_data']:checked").each(function(){
					str += $(this).val()+",";
                	$("#td_batch_audit").append("<button class='btn btn-default btn-sm mt5'>"+$(this).attr("data-email")+"("+$(this).attr("data-name")+")</button>");
	            });
				$("#hid_batch_guestId").val(str);
			}
			
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