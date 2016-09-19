<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<title>@我的</title>
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
			<!--发出邀约历史开始-->
			<div class="col-md-12  row-body guest-comunicate-center ">
				<table class="table table-striped table-responsive table-hover mt10">
					<thead>
						<tr>
							<th>序号</th>
							<th>中文姓名</th>
							<th>英文姓名</th>
							<th>单位</th>
							<th>职务</th>
							<th width="25%">验证内容</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${contactMe}" var="li" varStatus="i">
							<tr>
								<td>${i.index + 1}</td>
								<td>${li.chinese_name}</td>
								<td>${li.english_name}</td>
								<td>${li.ch_organ_name}</td>
								<td>${li.post}</td>
								<td class="staff text-center" width="25%" style="position: absolute;">
									<div class="hiddenText">${li.content}</div>
									<div class="table-tooltip">
										<span>${li.content}</span>
									</div>
								</td>
								<td>
									<c:choose>
										<c:when test="${li.reply_status == 2}">
											<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal${li.cr_id}">回复</button>
										</c:when>
										<c:when test="${li.reply_status == 1}">已接受请求</c:when>
										<c:when test="${li.reply_status == 0}">已拒绝请求</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
									<div class="modal fade" id="myModal${li.cr_id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="myModalLabel">
																				 回复请求
													</h4>
												</div>
												<div class="modal-body text-center">
													<form action="${contextPath}/contact/replyRequest" method="post">
													<input type="hidden" name="cr_id" value="${li.cr_id}" />
													<table class="table table-striped table-condensed  table-hover table-bordered">
														<tr>
															<td>是否接受请求：</td>
															<td>
																<label>
																	<input type="radio" name="invitation" checked="checked" value="1"/>接受并加为好友</label>
																<label>
																	<input type="radio" name="invitation" value="0"/>拒绝请求</label>
															</td>
														</tr>
														<tr>
															<td>请输入说明：</td>
															<td><textarea rows="4" cols="40" name="content"></textarea></td>
														</tr>
														<tr>
															<td colspan="2" class="text-center">
																<button type="submit" class="btn btn-primary mr10">确定</button>
																<button type="button" class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
															</td>
														</tr>
													</table>
													</form>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal -->
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--发出邀约历史结束-->
		</div>
		<!--会议日程结束-->
		

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
		
		<script type="text/javascript">
			$(function(){
				if(getCookie('resultCode') == 1){
					alert("回复成功！");
					delCookie('resultCode');
				}else if(getCookie('resultCode') == 0){
					alert("回复失败！");
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