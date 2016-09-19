<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<title>我的好友</title>
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

				<table class="table table-striped table-responsive table-bordered table-hover ">
					<caption>
						<div class="text-right mb10">
							<span>
								<button type="button" onclick="batchRecommend();" class="btn btn-success" data-toggle="modal" data-target="#TaContactor">批量推荐联系人</button>
							</span>
						</div>
						<div id="query">
							<form action="${contextPath}/contact/myFriends" method="post">
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
									<input type="text" placeholder="单位"	onblur="" name="ch_organ_name" value="${ch_organ_name}"/>
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
							</form>
						</div>
					</caption>
					<thead>
						<tr>
							<th>
								<label>全选
									<input type="checkbox" id="checkAll" class="checkAll">
								</label>
							</th>
							<th>序号</th>
							<th>中文姓名</th>
							<th>英文姓名</th>
							<th>性别</th>
							<th>单位</th>
							<th>职务</th>
							<th>联系方式</th>
							<th>微信号</th>
							<th>邮箱地址</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="li" varStatus="i">
							<tr>
								<td>
									<input type="checkbox" name="checkContact" value="${li.guest_id}" />
								</td>
								<td>${i.index + 1}</td>
								<td>${li.chinese_name}</td>
								<td>${li.english_name}</td>
								<td>
									<c:choose>
										<c:when test="${li.sex == 1}">男</c:when>
										<c:when test="${li.sex == 2}">女</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</td>
								<td>${li.ch_organ_name}</td>
								<td>${li.post}</td>
								<td>${li.mobile}</td>
								<td>${li.wechat_username}</td>
								<td>${li.email}</td>
								<td>
									<button type="button" onclick="javaScript:window.location.href='${contextPath}/contact/delContactPerson?cpId=${li.cp_id}';" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delContactor">删除联系人</button>
									<button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#TaContactor${li.cp_id}">向Ta推荐联系人</button>
									<div class="modal fade" id="TaContactor${li.cp_id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:10%;">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h5>
													<span class="fa fa-user-md"></span>&nbsp;你的好友$
												</h5>
												</div>
												<div class="modal-body row-body">
													<form action="${contextPath}/contact/recommend" method="post" id="form_${li.cp_id}">
														<input type="hidden" name="to_user" value="${li.guest_id}" />
														<table class="table table-striped table-condensed  table-hover table-bordered">
															<thead>
																<tr>
																	<th>
																		<label>全选
																			<input type="checkbox" class="checkAll">
																		</label>
																	</th>
																	<th>序号</th>
																	<th>姓名</th>
																	<th>性别</th>
																	<th>单位</th>
																	<th>职务</th>
																</tr>
															</thead>
															<tbody>
																<c:set var="index" value="1"></c:set>
																<c:forEach items="${list}" var="ll">
																	<c:choose>
																		<c:when test="${ll.guest_id ne li.guest_id}">
																			<tr>
																				<td>
																					<input type="checkbox" name="from_user" value="${ll.guest_id}"/>
																				</td>
																				<td>${index}</td>
																				<td>${ll.chinese_name}</td>
																				<td>
																					<c:choose>
																						<c:when test="${ll.sex == 1}">男</c:when>
																						<c:when test="${ll.sex == 2}">女</c:when>
																						<c:otherwise></c:otherwise>
																					</c:choose>
																				</td>
																				<td>${ll.ch_organ_name}</td>
																				<td>${ll.post}</td>
																			</tr>
																			<c:set var="index" value="${index + 1}"></c:set>
																		</c:when>
																	</c:choose>
																</c:forEach>
																<tr>
																	<td>
																		推荐信息：
																	</td>
																	<td colspan="5">
																		<textarea cols="50" rows="5" name="content"></textarea>
																	</td>
																</tr>
																<tr>
																	<td colspan="6" class="text-center">
																		<button type="button" onclick="recommend('${li.cp_id}');" class="btn btn-primary">确定推荐</button>
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
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--我的联系人结束-->
		</div>
		<!--会议日程结束-->
		<!--向Ta推荐联系人 -->
		<div class="modal fade" id="TaContactor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:10%;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="border-radius:6px 6px 0 0 ;">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h5>
						<span class="fa fa-user-md"></span>&nbsp;你的好友
					</h5>
					</div>
					<div class="modal-body row-body">
						<form action="${contextPath}/contact/batchRecommend" method="post" id="form_recommend_contact">
							<input type="hidden" name="to_user" value="" id="hid_to_user" />
							<table class="table table-striped table-condensed  table-hover table-bordered">
								<thead>
									<tr>
										<th>
											<label>全选
												<input type="checkbox" class="checkAll">
											</label>
										</th>
										<th>序号</th>
										<th>姓名</th>
										<th>性别</th>
										<th>单位</th>
										<th>职务</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="index" value="1"></c:set>
									<c:forEach items="${list}" var="ll" varStatus="i">
										<tr>
											<td>
												<input type="checkbox" name="from_user" value="${ll.guest_id}"/>
											</td>
											<td>${i.index + 1}</td>
											<td>${ll.chinese_name}</td>
											<td>
												<c:choose>
													<c:when test="${ll.sex == 1}">男</c:when>
													<c:when test="${ll.sex == 2}">女</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</td>
											<td>${ll.ch_organ_name}</td>
											<td>${ll.post}</td>
										</tr>
									</c:forEach>
									<tr>
										<td>
											推荐信息：
										</td>
										<td colspan="5">
											<textarea cols="50" rows="5" name="content"></textarea>
										</td>
									</tr>
									<tr>
										<td colspan="6" class="text-center">
											<button type="button" onclick="batchRecommendSubmit();" class="btn btn-primary">确定推荐</button>
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
		
		<div class="modal fade" id="delContactor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top:15%;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
													 删除好友
						</h4>
					</div>
					<div class="modal-body text-center">
						<div class="text-center text-info">
							确定要删除该好友吗？
						</div>
						<div class="text-center mt20">
							<button class="btn btn-danger mr10">确定</button>
							<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">取消</button>
						</div>
					</div>
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
		
		<script type="text/javascript">
			function recommend(cpId){
				var param = $("#form_"+cpId).serialize();
				$.post("${contextPath}/contact/recommend",param,function(data){
					if(data){
						alert("推荐成功！消息已发出。");
						$(".close").click();
					}else{
						alert("推荐失败！");
						$(".close").click();
					}
				});
			}
			
			function batchRecommend(){
				var str = "";
				$("input[name='checkContact']:checked").each(function(){
                	str += $(this).val()+",";
	            });
				$("#hid_to_user").val(str);
			}
			
			function batchRecommendSubmit(){
				var param = $("#form_recommend_contact").serialize();
				$.post("${contextPath}/contact/batchRecommend",param,function(data){
					if(data){
						alert("推荐成功！消息已发出。");
						$(".close").click();
					}else{
						alert("推荐失败！");
						$(".close").click();
					}
				});
			}
			
		</script>
		
	</body>

</html>