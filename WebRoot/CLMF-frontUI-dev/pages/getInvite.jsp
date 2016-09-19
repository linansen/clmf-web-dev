<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<title>收到的邀约</title>
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
			<!--收到邀约历史开始-->
			<div class="col-md-12  row-body guest-comunicate-center">

				<table class="table table-striped table-responsive table-hover ">
					<caption>
						<div id="query">
							<form action="${contextPath}/invite/getInvite" method="post">
								<span>
									姓名：
									<input type="text" placeholder="邀约人姓名" value="${invateGuestName}" name="invateGuestName"/>
								</span>
								<span>
									单位：
									<input type="text" placeholder="邀约人单位" value="${invateGuestOrgan}" name="invateGuestOrgan"/>
								</span>
								<span>
									职务：
									<input type="text" placeholder="邀约人职务" value="${invateGuestPost}" name="invateGuestPost"/>
								</span>
								<span>
									<button type="submit" class="btn btn-primary">
										查询<b class="fa fa-search ml5"></b>
									</button>
								</span>
							</form>
						</div>
					</caption>
					<thead>
						<tr>
							<th>序号</th>
							<th>邀约人</th>
							<th>邀约人单位</th>
							<th>邀约人职务</th>
							<th>邀约主题</th>
							<th width="15%">邀约内容</th>
							<th>收到邀约时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${getInviteHistory.list}" var="giil" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>${giil.chinese_name}&nbsp;</td>
								<td>${giil.ch_organ_name}</td>
								<td>${giil.post}</td>
								<td>${giil.title}</td>
								<td class="staff text-center" width="15%" style="position: absolute;">
									<div class="hiddenText">${giil.content}</div>
									<div class="table-tooltip">
										<span>${giil.content}</span>
									</div>
								</td>
								<td>${giil.send_time}</td>
								<td>
									<c:choose>
										<c:when test="${giil.reply_status ==2}">
											<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal${giil.inviteId}">回复邀约</button>
										</c:when>
										<c:when test="${giil.reply_status == 1}">
											<button type="button" class="btn btn-sm btn-primary" disabled="disabled" data-toggle="modal" data-target="#myModal${giil.inviteId}">已接受</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-sm btn-primary" disabled="disabled" data-toggle="modal" data-target="#myModal${giil.inviteId}">已拒绝</button>
										</c:otherwise>
									</c:choose>
									<div class="modal fade" id="myModal${giil.inviteId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
										<div class="modal-dialog">
											<form action="">
											<div class="modal-content">
												<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="myModalLabel">
																				  回复邀约
												</h4>
												</div>
												<div class="modal-body">
													<table class="table table-striped table-condensed  table-hover table-bordered">
														<tr>
															<td>是否接受邀约：</td>
															<td>
																<label>
																	<input type="radio" name="isAccept" checked="checked" value="1" />接受邀约</label>
																<label>
																	<input type="radio" name="isAccept" value="0" />拒绝邀约</label>
															</td>
														</tr>
														<tr>
															<td>请输入说明：</td>
															<td><textarea name="replyMsg" rows="4" cols="40"></textarea></td>
														</tr>
														<tr>
															<td colspan="2" class="text-center">
																<button type="button" onclick="replyInvite('${giil.inviteId}')" class="btn btn-primary mr10">确定</button>
																<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
															</td>
														</tr>
													</table>
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
			<!--收到邀约历史结束-->
		</div>
		<!--会议日程结束-->
		<!-- 模态框（Modal） -->
		
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
			function getProjectName(){
				var pathName = window.document.location.pathname;
				var projectName = pathName.substring(0,pathName.substr(1).indexOf('/')+1);
				return projectName;
			}
			
			function replyInvite(id){
				var isAccept = "";
				var array = new Array();
				array = document.getElementsByName("isAccept");
				for(var i=0; i<array.length; i++){
					if(array[i].checked){
						isAccept = array[i].value;
					}
				}
				alert(isAccept);
				var replyMsg = $("textarea[name='replyMsg']").val();
				$.post(getProjectName()+"/invite/replyInvite/"+id, {isAccept : isAccept, replyMsg : replyMsg}, function(data){
					if(data.status == 1){
	 					window.location.href = getProjectName()+"/invite/getInvite";
					}
				});
				
			}
		
		</script>
		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/valid.js"></script>
	</body>

</html>