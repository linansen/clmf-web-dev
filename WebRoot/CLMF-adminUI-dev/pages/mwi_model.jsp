<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">

		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<meta name="description" content="">
		<meta name="author" content="">

		<title>mwi后台管理系统模板</title>
		<!-- Bootstrap Core CSS -->
		<link rel="stylesheet" href="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/css/bootstrap.min.css">
		<!-- MetisMenu CSS -->
		<link rel="stylesheet" href="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.css">
		<!-- Custom CSS -->
		<link rel="stylesheet" href="${contextPath}/CLMF-adminUI-dev/dist/css/sb-admin-2.css">
		<!-- Custom Fonts -->
		<link rel="stylesheet" type="text/css" href="${contextPath}/CLMF-adminUI-dev/bower_components/font-awesome/css/font-awesome.min.css">
		
		<link rel="stylesheet" type="text/css" href="${contextPath}/CLMF-adminUI-dev/dist/css/mwi_tables/index.css">

	</head>

	<body>
		<!-- Navigation -->
		<nav class="navbar navbar-fixed-top navbar-inverse " role="navigation" style="margin-bottom: 0; ">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">菜单导航/span>
                    <span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html" style="font-size: 20px;">
					<p>
						<img src="../images/logo.png" style="width: 20px; height: 18px;"> 第八届世界华文传媒论坛会议管理平台
					</p>
				</a>
			</div>

			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="userCenter.html" target="page-wrapper"><i class="fa fa-user fa-fw"></i> 用户中心</a>
						</li>
						<li><a href="changePwd.html" target="page-wrapper"><i class="fa fa-gear fa-fw"></i> 修改密码</a>
						</li>
						<li class="divider"></li>
						<li><a href="${contextPath}/admin_login/logout"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
						</li>
					</ul>
					<!-- /.dropdown-user -->
				</li>

				<!-- /.dropdown -->

			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">

				<div class="sidebar-nav navbar-collapse">

					<ul class="nav" id="side-menu">

						<!--- 会议设置开始--->
						<li>

							<a href="#"><i class="fa fa-file-o fa-fw"></i> 会议设置&nbsp;<span class="fa arrow" style="color: #000000;"></span></span></a>

							<ul class="nav nav-second-level">

								<li>
									<a href="#"><span class="fa fa-check-square-o" style="color: #111111;"></span>&nbsp;会议资料发布<span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">

										<li>
											<a href="${contextPath}/guestFile" target="page-wrapper"><span class="fa fa-file-pdf-o"></span>&nbsp;嘉宾资料</a>
										</li>
										<li>
											<a href="${contextPath}/visitorFile" target="page-wrapper"><span class="fa fa-info-circle" target="page-wrapper"></span>&nbsp;游客资料</a>
										</li>

									</ul>

								</li>
								<li>
									<a href="${contextPath}/publishNews" target="page-wrapper"><span class="fa fa-info-circle"></span>&nbsp;新闻发布</a>
								</li>

							</ul>

							<!-- /.nav-second-level -->
						</li>

						<!--- 活动管理结束--->

						<!---嘉宾管理开始--->

						<li>

							<a href="mwi_index.html">
								<i class="fa fa-user-md  fa-fw"></i> 嘉宾管理
								<span class="fa arrow"></span>
							</a>

							<ul class="nav nav-second-level">

								<li>
									<!-- mwi_guset_basic_info.html -->
									<a href="${contextPath}/guestInfo/guestList" target="page-wrapper"><span class="fa fa-info-circle"></span>&nbsp;嘉宾信息</a>
								</li>

								<li>
									<!-- mwi_guset_check.html -->
									<a href="${contextPath}/guestAudit/auditList" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;嘉宾审核</a>
								</li>

								<li>
									<!-- mwi_info_add_with_Excel.html -->
									<a href="${contextPath}/guestInput/" target="page-wrapper"><span class="fa fa-legal"></span>&nbsp;嘉宾录入</a>
								</li>

								<li>
									<a href="#"><span class="fa fa-inbox"></span>&nbsp;嘉宾互动 <span class="fa arrow"></span></a>

									<ul class="nav nav-third-level">

										<li>
											<!-- mwi_guestInteraction_email.html -->
											<a href="${contextPath}/emailNotice/getList" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;邮件</a>
										</li>

										<li>
											<a href="${contextPath}/messageNotice" target="page-wrapper"><span class="fa fa-file-pdf-o"></span>&nbsp;短信</a>
										</li>

									</ul>
								</li>

							</ul>
						</li>

						<!---嘉宾管理结束--->

						<!--- 接待管理开始--->
						<li>

							<a href="#"><i class="fa fa-file-o fa-fw"></i> 接待管理<span class="fa arrow"></span></a>

							<ul class="nav nav-second-level">

								<li>
									<a href="${contextPath}/reception" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;接待安排</a>
								</li>

								<li>
									<a href="${contextPath}/match" target="page-wrapper"><span class="fa fa-legal"></span>&nbsp;人员匹配</a>
								</li>

								<li>
									<a href="${contextPath}/transfer" target="page-wrapper"><span class="fa fa-archive"></span>&nbsp;接送管理</a>
								</li>

								<li>
									<a href="#"><span class="fa fa-archive"></span>&nbsp;现场报到<span class="fa arrow"></span></a>

									<ul class="nav nav-third-level">

										<li>
											<!-- mwi_guestRegistrationStatus_displayPage.html -->
											<a href="${contextPath}/checkArrive/receptionList" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;嘉宾报到</a>
										</li>

										<li>
											<a href="${contextPath}/makeLicense" target="page-wrapper"><span class="fa fa-legal"></span>&nbsp;制证管理</a>
										</li>

									</ul>
								</li>

							</ul>
							<!-- /.nav-second-level -->
						</li>

						<!--- 接待管理结束--->

						<!--- 酒店管理开始--->
						<li>
							<a href="#"><i class="fa fa-building-o fa-fw"></i> 酒店管理<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">

								<li>
									<a href="mwi_hotel_check.html" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;住宿管理<span class="fa arrow"></span></a>

									<ul class="nav nav-third-level">

										<li>
											<!-- mwi_hotel_check.html -->
											<a href="${contextPath}/hotelAudit/getList" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;酒店审核</a>
										</li>

										<li>
											<!-- mwi_hotel_info_add.html -->
											<a href="${contextPath}/checkInfo/" target="page-wrapper"><span class="fa fa-legal"></span>&nbsp;住宿信息</a>
										</li>

									</ul>

								</li>

								<li>
									<a href="mwi_hotel_info_add.html" target="page-wrapper"><span class="fa fa-ambulance"></span>&nbsp;用餐管理<span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">

										<li>
											<a href="${contextPath}/diningset" target="page-wrapper"><span class="fa fa-archive"></span>&nbsp;权限管理</a>
										</li>

										<li>
											<a href="${contextPath}/dining" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;人数统计</a>
										</li>

									</ul>

								</li>

							</ul>

							<!-- /.nav-second-level -->
						</li>

						<!--- 酒店管理结束--->

						<!--- 活动管理开始--->
						<li>

							<a href="#"><i class="fa fa-file-o fa-fw"></i> 活动管理<span class="fa arrow"></span></a>

							<ul class="nav nav-second-level">

								<li>
									<a href="mwi_tables.html" target="page-wrapper"><span class="fa fa-check-square-o" style="color: #111111;"></span>&nbsp;活动签到<span class="fa arrow" style="color: #000000;"></span></a>

									<ul class="nav nav-third-level">

										<li>
											<a href="${contextPath}/activity_check_manage" target="page-wrapper"><span class="fa fa-check-square-o" style="color: #111111;"></span>&nbsp;权限管理</a>

										</li>

										<li>
											<a href="${contextPath}/activity_check_report" target="page-wrapper"><span class="fa fa-legal" style="color: #111111;"></span>&nbsp;签到统计</a>
										</li>

									</ul>

								</li>

								<li>
									<a href="mmwi_tables.html" target="page-wrapper"><span class="fa fa-legal" style="color: #111111;"></span>&nbsp;活动报名<span class="fa arrow" style="color: #000000;"></span></a>

									<ul class="nav nav-third-level">

										<li>
											<a href="${contextPath}/route" target="page-wrapper"><span class="fa fa-check-square-o" style="color: #111111;"></span>&nbsp;路线设置</a>

										</li>

										<li>
											<a href="${contextPath}/activity_signup" target="page-wrapper"><span class="fa fa-legal" style="color: #111111;"></span>&nbsp;报名管理</a>
										</li>

									</ul>

								</li>

							</ul>

							<!-- /.nav-second-level -->
						</li>

						<!--- 活动管理结束--->

						<!--- 交通管理开始--->
						<li>
							<a href="#"><i class="fa fa-ambulance fa-fw"></i> 交通管理<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">

								<li>
									<a href="#"><span class="fa fa-check-square-o"></span>&nbsp;交通信息<span class="fa arrow"></span></a>

									<ul class="nav nav-third-level">

										<li>
											<!-- mwi_trafficInfo_verticalInfo.html -->
											<a href="${contextPath}/carInfor/getList" target="page-wrapper"><span class="fa fa-archive"></span>&nbsp;车辆信息</a>
										</li>

										<li>
											<!-- mwi_trafficInfo_driverInfo.html -->
											<a href="${contextPath}/driverInfo/getList" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;司机信息</a>
										</li>

									</ul>

								</li>

								<li>
									<a href="#"><span class="fa fa-ambulance"></span>&nbsp;车辆调度<span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">

										<li>
											<!-- mwi_execusiveUse_vehicleSchedule.html -->
											<a href="${contextPath}/vehicle" target="page-wrapper"><span class="fa fa-archive"></span>&nbsp;专属用车</a>
										</li>

										<li>
											<a href="mwi_active_transport.html" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;活动用车</a>
										</li>

										<li>
											<a href="mwi_activity_car.html" target="page-wrapper"><span class="fa fa-archive"></span>&nbsp;任务用车</a>
										</li>

									</ul>

								</li>

								<li>
									<a href="${contextPath}/ride_log" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;乘车记录</a>

								</li>

							</ul>

							<!-- /.nav-second-level -->
						</li>

						<!--- 交通管理结束--->

						<!--- 工作人员管理开始--->
						<li>
							<a href="#"><i class="fa fa-user-md fa-fw"></i> 工作人员<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">

								<li>
									<a href="#"><span class="fa fa-check-square-o"></span>&nbsp;人员信息<span class="fa arrow"></span></a>

									<ul class="nav nav-third-level">

										<li>
											<a href="${contextPath}/staff" target="page-wrapper"><span class="fa fa-archive"></span>&nbsp;工作人员信息</a>
										</li>

										<li>
											<a href="${contextPath}/volunteer" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;志愿者信息</a>
										</li>

									</ul>

								</li>

								<li>
									<a href="#"><span class="fa fa-ambulance"></span>&nbsp;人员住宿<span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">

										<li>
											<a href="${contextPath}/workerStay" target="page-wrapper"><span class="fa fa-archive"></span>&nbsp;工作人员住宿</a>
										</li>

										<li>
											<a href="${contextPath}/volunteerStay" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;志愿者住宿</a>
										</li>
									</ul>

								</li>
								<li>
									<a href="#"><span class="fa fa-ambulance"></span>&nbsp;人员互动<span class="fa arrow"></span></a>
									<ul class="nav nav-third-level">

										<li>
											<a href="${contextPath}/eamilinter" target="page-wrapper"><span class="fa fa-archive"></span>&nbsp;邮件</a>
										</li>

										<li>
											<a href="${contextPath}/messageinter" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;短信</a>
										</li>
										<li>
											<a href="${contextPath}/wechatinter" target="page-wrapper"><span class="fa fa-check-square-o"></span>&nbsp;微信</a>
										</li>
									</ul>

								</li>

							</ul>

							<!-- /.nav-second-level -->
						</li>

						<!--- 工作人员管理结束--->

						<!--统计分析开始-->

						<li>

							<a href="#">
								<i class="fa fa-file-o fa-fw"></i> 参会统计分析&nbsp;
								<span class="fa arrow" style="color: #000000;"></span>
							</a>

							<ul class="nav nav-second-level">

								<li>
									<a href="mwi_data-statistics.html" target="page-wrapper">
										<span class="fa fa-check-square-o" style="color: #111111;"></span>&nbsp;统计分析
									</a>

								</li>

							</ul>

							<!-- /.nav-second-level -->
						</li>

						<!--统计分析结束-->
						<!--权限管理-->
						<li>

							<a href="#">
								<i class="fa fa-file-o fa-fw"></i> 权限管理&nbsp;
								<span class="fa arrow" style="color: #000000;"></span>
							</a>

							<ul class="nav nav-second-level">

								<li>
									<a href="${contextPath}/admin" target="page-wrapper">
										<span class="fa fa-check-square-o" style="color: #111111;"></span>&nbsp;用户管理
									</a>

								</li>
								<li>
									<a href="${contextPath}/role" target="page-wrapper">
										<span class="fa fa-check-square-o" style="color: #111111;"></span>&nbsp;角色管理
									</a>

								</li>

							</ul>

							<!-- /.nav-second-level -->
						</li>
						<!--权限管理-->

					</ul>

				</div>
				<!-- /.sidebar-collapse -->

			</div>
			<!-- /.navbar-static-side -->

		</nav>
		<div id="page-iframe">
			<iframe id="" src="mwi_index.html" name="page-wrapper" width="100%" scrolling="auto" frameborder="0" seamless></iframe>
		</div>
		
		<!-- /#page-wrapper -->

		<!-- jQuery -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/jquery/dist/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/bower_components/metisMenu/dist/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="${contextPath}/CLMF-adminUI-dev/dist/js/sb-admin-2.js"></script>
		
	    	<%-- <script src="${contextPath}/CLMF-adminUI-dev/js/morris-data.js"></script> --%>		

	</body>

</html>