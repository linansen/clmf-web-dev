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

		<title>嘉宾基本信息</title>

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
			
			<form action="${contextPath}/guestInfo/guestList" method="post" name="guest_form">
			<!-- page -->
			<input type="hidden" class="pageIndex" name="currentPage" value='<c:out value="${pageList.pageNumber}" default="1"/>'>
			<input type="hidden" class="pageSize" name="currentSize" value='<c:out value="${pageList.pageSize}" default="10"/>'>
			<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${pageList.totalPage}" default="1"/>'>
			<!-- page -->

				<div class="panel panel-primary">
					

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-info-circle fa-2x mr5"></span>嘉宾基本信息</p>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">

						<table class="table table-striped table-bordered table-hover" cellspacing="0" width="80%">
							
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
										单位职务：
										<input type="text" name="post" placeholder="请输入单位职务" value="${post}"/>
									</span>
									<span>
										<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
										<button type="button" class="btn btn-primary" id="ad_query_button">高级查询</button>
									</span>
									<span>
										<label>记录总数：<b class="red-text">${pageList.totalRow}</b>条</label>
									</span>
								</div>
								<div class="pull-left" id="ad_query">
									<span>
										身份证/护照号：
										<input type="text" name="passportNo" placeholder="请输入嘉宾身份证号" value="${passportNo}"/>
									</span>
									<span>
										手机号码：
										<input type="text" name="mobile" placeholder="请输入手机号码" value="${mobile}"/>
									</span>
									<span>
										电子邮件：
										<input type="text" name="email" placeholder="请输入电子邮件" value="${email}"/>
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
									<th>更多操作</th>
								</tr>

							</thead>
							<tbody>
								<c:forEach items="${pageList.list}" var="li" varStatus="i">
									<tr>
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
										<td>${li.arrivalDate}</td>
										<td>
											<a href="${contextPath}/guestInfo/getGuest?guestId=${li.id}" class="btn btn-default" data-toggle="modal" data-target="#detail_info_about_guest">查看详情<span class="fa fa-search ml5"></span></a>
											<a href="${contextPath}/guestInfo/toEditGuest?guestId=${li.id}&flag=1" class="btn btn-default ml10" data-toggle="modal" data-target="#edit_info_about_guest">编辑<span class="fa fa-edit ml5"></span></a>
											<button type="button" class="btn btn-default ml10" onclick="$('#guestId_modal').val(${li.id});" data-toggle="modal" data-target="#delGuest">删除<span class="fa fa-remove ml5"></span></button>
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
								<button type="button" class="btn btn-primary btn-sm">go</button>
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
		<div id="detail_info_about_guest" class="modal fade modalRefresh" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		
		
		<div id="edit_info_about_guest" class="modal fade modalRefresh" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

				</div>
				<!-- /.modal-content -->

			</div>

		</div>
		<div class="modal fade" id="delGuest" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
													删除嘉宾
						</h4>
					</div>
					<div class="modal-body text-center">
						<input type="hidden" id="guestId_modal" value="">
						<div class="text-center text-info">
							确定要删除该嘉宾吗？
						</div>
						<div class="text-center mt20">
							<button class="btn btn-danger mr10" onclick="window.location.href='${contextPath}/guestInfo/delGuest?guestId='+$('#guestId_modal').val();">确定</button>
							<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>
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
		</script>
	</body>

</html>