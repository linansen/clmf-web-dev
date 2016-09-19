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

		<title>嘉宾互动之邮件发送</title>

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
			<div class="col-lg-offset-2  col-lg-8">
				<h1 class="page-header"></h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.row -->
		<div class="row-body">

			<!-- /.后台公布的邮件 -->
			<div class="col-lg-12">
			
			<form action="${contextPath}/emailNotice/getList" method="post">
			<!-- page -->
			<input type="hidden" class="pageIndex" name="currentPage" value='<c:out value="${pageList.pageNumber}" default="1"/>'>
			<input type="hidden" class="pageSize" name="currentSize" value='<c:out value="${pageList.pageSize}" default="10"/>'>
			<input type="hidden" class="totalPages" name="totalPage" value='<c:out value="${pageList.totalPage}" default="1"/>'>
			<!-- page -->

				<div class="panel panel-primary">

					<div class="panel-heading">
						<p class="text-capitalize"><span class="fa fa-envelope-o fa-rotate-180 fa-2x mr5"></span>邮件布告：</p>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">

						<table class="table table-striped table-bordered table-hover " cellspacing="0" width="80%">
							<caption>
								<div class="pull-left" id="query">
									<span>
										中文姓名：
										<input type="text" name="chineseName" placeholder="请输入中文姓名" value="${chineseName}" />
									</span>
									<span>
										英文姓名：
										<input type="text" name="englishName" placeholder="请输入英文姓名" value="${englishName}" />
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
										登录状态：
										<select name="had_login">
											<c:choose>
												<c:when test="${had_login == 0}">
													<option value="">全部</option>
													<option value="1">已登录</option>
													<option value="0" selected="selected">未登录</option>
												</c:when>
												<c:when test="${had_login == 1}">
													<option value="">全部</option>
													<option value="1" selected="selected">已登录</option>
													<option value="0">未登录</option>
												</c:when>
												<c:otherwise>
													<option value="" selected="selected">全部</option>
													<option value="1">已登录</option>
													<option value="0">未登录</option>
												</c:otherwise>
											</c:choose>
										</select>
									</span>
									<span>
										邀请函发送状态：
										<select name="is_send_invate">
											<c:choose>
												<c:when test="${is_send_invate == 0}">
													<option value="">全部</option>
													<option value="1">已发送</option>
													<option value="0" selected="selected">未发送</option>
												</c:when>
												<c:when test="${is_send_invate == 1}">
													<option value="">全部</option>
													<option value="1" selected="selected">已发送</option>
													<option value="0">未发送</option>
												</c:when>
												<c:otherwise>
													<option value="" selected="selected">全部</option>
													<option value="1">已发送</option>
													<option value="0">未发送</option>
												</c:otherwise>
											</c:choose>
										</select>
									</span>
									<span>
										<button type="submit" class="btn btn-primary">查询<b class="fa fa-search ml5"></b></button>
										<button type="button" class="btn btn-primary" id="ad_query_button">高级查询</button>
									</span>
									<span>
										<label>记录总数：<b class="red-text">${pageList.totalRow}</b>条</label>
									</span>
									<span class=" pull-right">
										<button type="button" onclick="batchSendEmail();" class="btn btn-success" data-toggle="modal" data-target="#email_send">批量推送邮件</button>
									</span>
								</div>
								<div class="pull-left" id="ad_query">
									<span>
										单位职务：
										<input type="text" name="post" placeholder="请输入单位职务" value="${post}" />
									</span>
									<span>
										邮箱地址：
										<input type="text" name="email" placeholder="请输入邮箱地址" value="${email}" />
									</span>
								</div>
								</form>
							</caption>
							<thead>
								<tr>
									<th>选择<input type="checkbox" name="send_email_select" id="checkAll"></th>
									<th>嘉宾姓名</th>
									<th>英文姓名</th>
									<th>电子邮件地址</th>
									<th>国家</th>
									<th>单位</th>
									<th>职务</th>
									<th>推送邮件数</th>
									<th>发送状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageList.list}" var="li">
									<tr>
										<td>
											<input type="checkbox" name="send_email_select" value="${li.id}" data-email="${li.email}" data-name="${li.chinese_name}">
										</td>
										<td>${li.chinese_name}</td>
										<td>${li.english_name}</td>
										<td>${li.email}</td>
										<td>${li.national}</td>
										<td>${li.ch_organ_name}</td>
										<td>${li.post}</td>
										<td>${li.mail_count}</td>
										<td>
											<c:choose>
												<c:when test="${li.is_send_invate == 1}">已发送</c:when>
												<c:otherwise>未发送</c:otherwise>
											</c:choose>
										</td>
										<td>
											<button type="button" onclick="sendEmail('${li.id}','${li.email}','${li.chinese_name}');" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#email_send">推送邮件<span class="fa fa-envelope fa-rotate-180 ml5"></span></button>
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

		<!-- 邮件模态框（Modal） -->
		<div id="email_send" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
						<h4 class="modal-title" id="myModalLabel"><span class="fa fa-envelope-square fa-2x"></span> 邮件信息公布</h4>
					</div>

					<div class="modal-body">
						<form accept-charset="ISO-8859-1" action="${contextPath}/emailNotice/batchSendEmail" method="post" enctype="multipart/form-data">
							<input type="hidden" name="to_user" id="hid_data_id" value="" />
							<table class="table table-hover table-condensed table-responsive">
								<tbody>
									<tr>
										<td>收件人：</td>
										<td colspan="3" id="to_user">
											
										</td>
									</tr>
									<tr>
										<td>邮件标题：</td>
										<td colspan="3">
											<input type="text" placeholder="请输入邮件标题" name="email_title" id="email_title"/>
										</td>
									</tr>
									<tr>
										<td>邮件内容：</td>
										<td colspan="3"><textarea rows="7" cols="70" name="email_content" id="email_content"></textarea></td>
									</tr>
									<tr>
										<td>邮件附件：</td>
										<td>
											<input type="file" class="btn btn-sm btn-default" name="email_file" />
										</td>
										<td>选择邮件模板：</td>
										<td>
											<select name="template" onchange="selectTemp(this);">
												<option value="0">请选择邮件模板</option>
												<c:forEach items="${emailTemplate}" var="et">
													<option value="${et.id}">${et.template_name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="4" class="text-center">
											<input type="submit" value="发送邮件" id="only_send_email" class="btn btn-primary"/>
										</td>
									</tr>

								</tbody>

							</table>
						</form>

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
					alert("发送成功！");
					delCookie('responseCode');
				}else if(getCookie('responseCode') == 0){
					alert("发送失败！");
					delCookie('responseCode');
				}
			});
		
			function batchSendEmail(){
				var str = "";
				$("#to_user").empty();
				$("input[name='send_email_select']:checked").each(function(){
                	str += $(this).val()+",";
                	$("#to_user").append("<button class='btn btn-default btn-sm mt5'>"+$(this).attr("data-email")+"("+$(this).attr("data-name")+")</button>");
	            });
				$("#hid_data_id").val(str);
			}
			
			function sendEmail(id,email,name){
				$("#to_user").empty();
				$("#to_user").append("<button class='btn btn-default btn-sm mt5'>"+email+"("+name+")</button>");
				$("#hid_data_id").val(id + ",");
			}
			
			function selectTemp(ev){
				var val = $(ev).val();
				if(val > 0 ){
					$("#email_title").attr("disabled","disabled");
					$("#email_content").attr("disabled","disabled");
				}else{
					$("#email_title").removeAttr("disabled");
					$("#email_content").removeAttr("disabled");
				}
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