<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>

		<meta charset="utf-8">
		<title>寻找好友</title>
		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Favicon -->
		<link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">

		<!-- Font Awesome CSS -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/font-awesome-4.3.0/css/font-awesome.css" />
		<!-- Plugins -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/animations.css">
		<!-- Worthy core CSS file -->
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/style.css">
		<link rel="stylesheet" href="${contextPath}/CLMF-frontUI-dev/css/cotmer.css">
	</head>
	<body>
		<!--会议日程开始-->
		<div class="row ml10 mr10">
			<!--我的联系人开始-->
			<div class="col-md-12  row-body guest-comunicate-center ">
				<form action="${contextPath}/contact/findFriends" method="post">
					<!-- page -->
					<input type="hidden" class="pageIndex" name="currentPage" value="${pageList.pageNumber}">
					<input type="hidden" class="pageSize" name="currentSize" value="10">
					<input type="hidden" class="totalPages" name="totalPage" value="${pageList.totalPage}">
					<!-- page -->
					<table class="table table-striped table-responsive table-bordered table-hover ">
						<caption>
							<div id="query">
								<span>
									中文姓名：
									<input type="text" placeholder="中文姓名" name="chinese_name" value="${chinese_name}"/>
								</span>
								<span>
									英文姓名：
									<input type="text" placeholder="英文姓名" name="english_name" value="${english_name}"/>
								</span>
								<span>
									单位：
									<input type="text" placeholder="单位" onblur="" name="ch_organ_name" value="${ch_organ_name}"/>
								</span>
								<span>
									职务：
									<input type="text" placeholder="职务" name="post" value="${post}"/>
								</span>
								<span>
									<button type="submit" class="btn btn-primary">
										查询<b class="fa fa-search ml5"></b>
									</button>
								</span>
							</div>
						</caption>
						<thead>
							<tr>
								<th><label>全选
									<input type="checkbox" class="checkAll"></label>
								</th>
								<th>序号</th>
								<th>姓名</th>
								<th>单位</th>
								<th>职务</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageList.list}" var="li" varStatus="i">
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>${i.index + 1}</td>
									<td>${li.chinese_name}</td>
									<td>${li.ch_organ_name}</td>
									<td>${li.post}</td>
									<td>
										<c:choose>
											<c:when test="${li.request_status == 0}">未请求</c:when>
											<c:when test="${li.request_status == 1}">等待回复中</c:when>
											<c:when test="${li.request_status == 2}">已经成为好友</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${li.request_status == 0}">
												<button type="button" onclick="javaScript:$('#hid_to_user').val('${li.id}');" class="btn btn-sm btn-success" data-toggle="modal" data-target="#request">请求为联系人</button>
											</c:when>
											<c:when test="${li.request_status == 1}">
												<button type="button" onclick="javaScript:$('#hid_cancel_to_user').val('${li.id}');" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#cancelReq">取消好友请求</button>
											</c:when>
											<c:when test="${li.request_status == 2}"></c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
				</form>

			</div>
			<!--寻找联系人结束-->
		</div>
		<!--会议日程结束-->
		<div class="modal fade" id="cancelReq" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
				<form action="${contextPath}/contact/cancelRequest" method="post">
					<input type="hidden" name="to_user" value="" id="hid_cancel_to_user" />
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
													取消请求
						</h4>
					</div>
					<div class="modal-body text-center">
						<div class="text-center text-info">
							确定要取消该好友请求吗？
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
		<div class="modal fade" id="request" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${contextPath}/contact/sendRequest" method="post">
					<input type="hidden" name="to_user" value="" id="hid_to_user" />
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
													发送好友请求
						</h4>
					</div>
					<div class="modal-body text-center">
						<div>
							<span class="text-info" style="vertical-align: top;">
								请输入验证信息：
							</span>
							<span>
								<textarea rows="5" cols="50" name="content"></textarea>
							</span>
						</div>
						<div class="text-center mt30">
							<span>
								<button type="submit" class="btn btn-primary">确定发送</button>
							</span>
						</div>
					</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
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
		
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/plugins/paginator/paginator.min.js"></script>
		
		<script src="${contextPath}/CLMF-frontUI-dev/js/page/page.js"></script>
		
		<script type="text/javascript">
			$(function(){
				if(getCookie('sendCode') == 1){
					alert("发送成功！");
					delCookie('sendCode');
				}else if(getCookie('sendCode') == 0){
					alert("发送失败！");
					delCookie('sendCode');
				}else if(getCookie('cancelCode') == 0){
					alert("取消成功！");
					delCookie('cancelCode');
				}else if(getCookie('cancelCode') == 0){
					alert("取消失败！");
					delCookie('cancelCode');
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
