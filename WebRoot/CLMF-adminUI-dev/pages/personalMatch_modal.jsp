<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>嘉宾详细信息编辑</title>
	</head>

	<body>
		<div class="modal-content">
			<form action="${contextPath}/match/matchWorker" method="post">
				<div class="modal-header" style="background-color: rgba(30,40,80,0.8); height: 50px;">
					<h5 class="modal-title pull-left white-text" id="myModalLabel">工作人员选择</h5>
					<div class="pull-right btn-group-sm">
						<button type="button" class="btn btn-danger saveChosen">保存<span class="fa fa-chain"></span>
						</button>
						<button type="button" class="btn btn-warning" data-dismiss="modal">关闭<span class="fa fa-power-off"></span>
						</button>
						<input type="hidden" name="guestIds" value="" />
						<input type="hidden" name="workerIds" value="" />
						<input type="hidden" name="supporterIds" value="" />
					</div>
				</div>
			</form>
			<div class="modal-body">
				<div class="col-lg-6">
					<div class="add-guest-kind">
						<div>
							<span>
								选择工作人员：
							</span>
							<span class="name_btn" id="choseStaff"></span>
							<span class="ml20">
								<button type="button" class="btn btn-primary add_staff_btn">添加工作人员</button>
							</span>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="add-guest-kind">
						<div>
							<span>
								选择志愿者：
							</span>
							<span class="name_btn" id="choseSuppoter">
								
							</span>
							<span class="ml20">
								<button type="button" class="btn btn-primary add_voluteer_btn">添加志愿者</button>
							</span>
						</div>
					</div>
				</div>
				<iframe src="${contextPath}/match/toMatchIframe" name="matchIframe" style="width: 100%; min-height: 710px;" scrolling="auto" frameborder="0" seamless></iframe>
			</div>
		</div>
	</body>
</html>
