<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<title>发送邀约历史</title>
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
				<table class="table table-striped table-responsive table-hover ">
					<caption>
						<div id="query">
							<form action="${contextPath}/invite/sendedInvite" method="post">
								<span>
									姓名：
									<input type="text" placeholder="邀约人姓名" name="invateGuestName" value="${invateGuestName }"/>
								</span>
								<span>
									单位：
									<input type="text" placeholder="邀约人单位"	onblur="" name="invateGuestOrgan" value="${invateGuestOrgan }"/>
								</span>
								<span>
									职务：
									<input type="text" placeholder="邀约人职务" name="invateGuestPost" value="${invateGuestPost }"/>
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
							<th>发出邀约时间</th>
							<th>是否接受邀约</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sentInviteHistory.list}" var="sihl" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>${sihl.chinese_name}</td>
								<td>${sihl.ch_organ_name}</td>
								<td>${sihl.post}</td>
								<td>${sihl.title}</td>
								<td class="staff text-center" width="15%" style="position: absolute;">
									<div class="hiddenText">${sihl.content}</div>
									<div class="table-tooltip">
										<span>${sihl.content}</span>
									</div>
								</td>
								<td>${sihl.send_time}</td>
								<c:choose>
									<c:when test="${sihl.reply_status == 0}"><td>拒绝</td></c:when>
									<c:when test="${sihl.reply_status == 1}"><td>接受</td></c:when>
									<c:otherwise><td>未回复</td></c:otherwise>
								</c:choose>
								<td>
									<c:choose>
										<c:when test="${sihl.success_status == 2}">
											<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal${sihl.inviteId}">取消邀约</button>	
										</c:when>
										<c:when test="${sihl.success_status == 0}">
											<button type="button" class="btn btn-sm btn-primary" disabled="disabled" data-toggle="modal" data-target="#myModal">已拒绝</button>	
										</c:when>
										<c:when test="${sihl.success_status == 1}">
											<button type="button" class="btn btn-sm btn-primary" disabled="disabled" data-toggle="modal" data-target="#myModal">已同意</button>	
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-sm btn-primary" disabled="disabled" data-toggle="modal" data-target="#myModal">已取消</button>
										</c:otherwise>
									</c:choose>
									<!--会议日程结束-->
									<div class="modal fade" id="myModal${sihl.inviteId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="myModalLabel">
																				  取消邀约
													</h4>
												</div>
												<div class="modal-body text-center">
													<div class="text-center text-info">
														确定要取消对嘉宾的邀约吗？
													</div>
													<div class="text-center mt20">
														<button onclick="cacelInvate('${sihl.inviteId}')" class="btn btn-danger mr10">确定</button>
														<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
													</div>
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
			
			function cacelInvate(id){
				$.post(getProjectName()+"/invite/cancelInvite/"+id, function(data){
					if(data.status == 1){
	 					window.location.href = getProjectName()+"/invite/sendedInvite";
					}
				});
				
			}
		</script>

		<script type="text/javascript" src="${contextPath}/CLMF-frontUI-dev/js/valid.js"></script>
	</body>

</html>