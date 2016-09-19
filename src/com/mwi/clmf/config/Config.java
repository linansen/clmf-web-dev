package com.mwi.clmf.config;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.redis.RedisPlugin;
import com.jfinal.render.ViewType;
import com.mwi.clmf.controller.admin.IndexController;
import com.mwi.clmf.controller.admin.activity.ActivityCheckManagementController;
import com.mwi.clmf.controller.admin.activity.ActivityCheckReportController;
import com.mwi.clmf.controller.admin.activity.ActivityManagementController;
import com.mwi.clmf.controller.admin.activity.RouteController;
import com.mwi.clmf.controller.admin.adminUser.AdminController;
import com.mwi.clmf.controller.admin.adminUser.AdminLoginController;
import com.mwi.clmf.controller.admin.adminUser.RoleController;
import com.mwi.clmf.controller.admin.guest.EmailNoticeController;
import com.mwi.clmf.controller.admin.guest.GuestAuditController;
import com.mwi.clmf.controller.admin.guest.GuestInfoController;
import com.mwi.clmf.controller.admin.guest.GuestInputController;
import com.mwi.clmf.controller.admin.guest.GuestTypeController;
import com.mwi.clmf.controller.admin.guest.MessageNoticeController;
import com.mwi.clmf.controller.admin.hotel.CheckInfoController;
import com.mwi.clmf.controller.admin.hotel.DiningSetController;
import com.mwi.clmf.controller.admin.hotel.DiningStandController;
import com.mwi.clmf.controller.admin.hotel.HotelAuditController;
import com.mwi.clmf.controller.admin.meeting.GuestFileController;
import com.mwi.clmf.controller.admin.meeting.PublishNewsController;
import com.mwi.clmf.controller.admin.meeting.VisitorFileController;
import com.mwi.clmf.controller.admin.reception.GuestCheckArriveController;
import com.mwi.clmf.controller.admin.reception.GuestTripManageController;
import com.mwi.clmf.controller.admin.reception.MakeLicenseController;
import com.mwi.clmf.controller.admin.reception.ReceptionController;
import com.mwi.clmf.controller.admin.reception.WorkerMatchController;
import com.mwi.clmf.controller.admin.staff.EmailInteractionController;
import com.mwi.clmf.controller.admin.staff.MessageInteractionController;
import com.mwi.clmf.controller.admin.staff.VolunteerController;
import com.mwi.clmf.controller.admin.staff.VolunteerStayController;
import com.mwi.clmf.controller.admin.staff.WechatInteractionController;
import com.mwi.clmf.controller.admin.staff.WorkerController;
import com.mwi.clmf.controller.admin.staff.WorkerStayController;
import com.mwi.clmf.controller.admin.transport.CarInforController;
import com.mwi.clmf.controller.admin.transport.DriverInforController;
import com.mwi.clmf.controller.admin.transport.RideLogController;
import com.mwi.clmf.controller.admin.transport.VehicleActivityController;
import com.mwi.clmf.controller.admin.transport.VehicleGuestController;
import com.mwi.clmf.controller.admin.transport.VehicleTaskController;
import com.mwi.clmf.controller.front.ContactController;
import com.mwi.clmf.controller.front.FrontIndexController;
import com.mwi.clmf.controller.front.FrontLoginController;
import com.mwi.clmf.controller.front.GuestController;
import com.mwi.clmf.controller.front.GuestRegistController;
import com.mwi.clmf.controller.front.InviteMsgController;
import com.mwi.clmf.interceptor.AdminInterceptor;
import com.mwi.clmf.model.ChackCardModel;
import com.mwi.clmf.model.ContactPersonModel;
import com.mwi.clmf.model.ContactRequestModel;
import com.mwi.clmf.model.CountryModel;
import com.mwi.clmf.model.EmailSendLogModel;
import com.mwi.clmf.model.EmailTemplateModel;
import com.mwi.clmf.model.InvateMsgModel;
import com.mwi.clmf.model.SendSmsLogModel;
import com.mwi.clmf.model.activity.ActivityCheckModel;
import com.mwi.clmf.model.activity.ActivityCheckReportModel;
import com.mwi.clmf.model.activity.ActivityCheckRuleStandardModel;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.adminUser.PrivilegeModel;
import com.mwi.clmf.model.adminUser.RoleModel;
import com.mwi.clmf.model.adminUser.RolePrivilegeModel;
import com.mwi.clmf.model.adminUser.UserModel;
import com.mwi.clmf.model.guest.GuestDiningModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.guest.GuestTypeModel;
import com.mwi.clmf.model.guest.GuestVisaModel;
import com.mwi.clmf.model.hotel.DinningStandModel;
import com.mwi.clmf.model.hotel.HotelInforModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.model.hotel.HotelRoomModel;
import com.mwi.clmf.model.meeting.GuestFileModel;
import com.mwi.clmf.model.meeting.NewCategoryModel;
import com.mwi.clmf.model.meeting.NewsModel;
import com.mwi.clmf.model.meeting.VisitorFileModel;
import com.mwi.clmf.model.reception.ReceptionModel;
import com.mwi.clmf.model.reception.ReceptionStadardModel;
import com.mwi.clmf.model.reception.WorkerMatchModel;
import com.mwi.clmf.model.staff.WorkeDiningModel;
import com.mwi.clmf.model.staff.WorkerGroupModel;
import com.mwi.clmf.model.staff.WorkerInforModel;
import com.mwi.clmf.model.staff.WorkerStayModel;
import com.mwi.clmf.model.transport.CarInforModel;
import com.mwi.clmf.model.transport.DriverInforModel;
import com.mwi.clmf.model.transport.RideLogModel;
import com.mwi.clmf.model.transport.TrafficManagementModel;


public class Config extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		loadPropertyFile("dataBase.properties");
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setViewType(ViewType.JSP);
	}

	@Override
	public void configHandler(Handlers me) {
		me.add(new ContextPathHandler("contextPath"));
	}

	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new AdminInterceptor());
	}

	@Override
	public void configPlugin(Plugins me) {
		RedisPlugin emailList = new RedisPlugin("emailList", "127.0.0.1");
		me.add(emailList);
		
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl").trim(),getProperty("user").trim(), getProperty("password").trim());
		me.add(c3p0Plugin);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
		
		// guest
		arp.addMapping("cf_guest_infor", GuestInforModel.class);
		arp.addMapping("cf_guest_trip", GuestTripModel.class);
		arp.addMapping("cf_guest_type", GuestTypeModel.class);
		arp.addMapping("cf_guest_visa", GuestVisaModel.class);
		arp.addMapping("cf_chack_card", ChackCardModel.class);


		
		//ride log
		arp.addMapping("cf_ride_log", RideLogModel.class);
		arp.addMapping("cf_worker_infor", WorkerInforModel.class);
		arp.addMapping("cf_worker_stay", WorkerStayModel.class);

		
		//activity
		arp.addMapping("cf_activity_check_report", ActivityCheckReportModel.class);
		arp.addMapping("cf_activity_check_management", ActivityCheckModel.class);
		arp.addMapping("cf_route", RouteModel.class);
		arp.addMapping("cf_activity_management", ActivityManagementModel.class);
		arp.addMapping("cf_activity_check_rule_standard", ActivityCheckRuleStandardModel.class);
		
		//Hotel Management
		arp.addMapping("cf_hotel_management", HotelManagementModel.class);
		arp.addMapping("cf_hotel_room", HotelRoomModel.class);
		arp.addMapping("cf_hotel", HotelInforModel.class);
		arp.addMapping("cf_invate_msg", InvateMsgModel.class);
		
		
		arp.addMapping("cf_worker_infor", WorkeDiningModel.class);
		arp.addMapping("cf_guest_infor", GuestDiningModel.class);
		arp.addMapping("cf_dining_stand", DinningStandModel.class);
		arp.addMapping("cf_group", WorkerGroupModel.class);
		
		
		//reception
		arp.addMapping("cf_reception_standard", ReceptionStadardModel.class);
		arp.addMapping("cf_reception_standard_management", ReceptionModel.class);
		arp.addMapping("cf_match", WorkerMatchModel.class);
		
		//transport
		arp.addMapping("cf_car_infor", CarInforModel.class);
		arp.addMapping("cf_driver_infor", DriverInforModel.class);
		arp.addMapping("cf_traffic_management", TrafficManagementModel.class);
		
		//email sendList
		arp.addMapping("cf_email_sendlog", EmailSendLogModel.class);
		arp.addMapping("cf_email_template", EmailTemplateModel.class);
		
		
		//guest setting
		arp.addMapping("cf_file", GuestFileModel.class);

		
		arp.addMapping("cf_news_category", NewCategoryModel.class);
		arp.addMapping("cf_news", NewsModel.class);

		arp.addMapping("cf_visitor_file", VisitorFileModel.class);
		
		//country
		arp.addMapping("cf_country", CountryModel.class);
		
		//user
		arp.addMapping("cf_user", UserModel.class);
		arp.addMapping("cf_user_role", RoleModel.class);
		arp.addMapping("cf_user_privilege", PrivilegeModel.class);
		arp.addMapping("cf_user_role_privilege", RolePrivilegeModel.class);
		
		//contact person
		arp.addMapping("cf_contact_person", ContactPersonModel.class);
		arp.addMapping("cf_contact_request", ContactRequestModel.class);
		
		//sms send log
		arp.addMapping("cf_sms_log", SendSmsLogModel.class);

	}

	@Override
	public void configRoute(Routes me) {
		/********************************* 后台 **********************************/
		me.add("/", IndexController.class,"/CLMF-adminUI-dev");
		// guest 嘉宾管理
		me.add("/guestInfo", GuestInfoController.class,"/CLMF-adminUI-dev/pages");
		me.add("/guestAudit", GuestAuditController.class,"/CLMF-adminUI-dev/pages");
		me.add("/guestInput", GuestInputController.class,"/CLMF-adminUI-dev/pages");
		me.add("/emailNotice", EmailNoticeController.class, "/CLMF-adminUI-dev/pages");
		me.add("/messageNotice", MessageNoticeController.class, "/CLMF-adminUI-dev/pages");
		me.add("/guestType", GuestTypeController.class, "/CLMF-adminUI-dev/pages");
		
		
		
		me.add("/dining", DiningStandController.class,"/CLMF-adminUI-dev/pages");
		me.add("/diningset", DiningSetController.class,"/CLMF-adminUI-dev/pages");
		me.add("/ride_log", RideLogController.class, "/CLMF-adminUI-dev/pages");
		
		// 活动
		me.add("/activity_check_report", ActivityCheckReportController.class, "/CLMF-adminUI-dev/pages");
		me.add("/activity_check_manage", ActivityCheckManagementController.class, "/CLMF-adminUI-dev/pages");
		me.add("/route", RouteController.class, "/CLMF-adminUI-dev/pages");
		me.add("/activity_signup",ActivityManagementController.class, "/CLMF-adminUI-dev/pages");
		
		
		
		
		// 接待管理
		me.add("/reception", ReceptionController.class, "/CLMF-adminUI-dev/pages");
		// 人员匹配
		me.add("/match", WorkerMatchController.class, "/CLMF-adminUI-dev/pages");
		// 接送管理
		me.add("/transfer", GuestTripManageController.class, "/CLMF-adminUI-dev/pages");
		// 嘉宾报道
		me.add("/checkArrive", GuestCheckArriveController.class,"/CLMF-adminUI-dev/pages");
		//制证管理
		me.add("/makeLicense", MakeLicenseController.class,"/CLMF-adminUI-dev/pages");
		
		// 酒店管理
		me.add("/hotelAudit", HotelAuditController.class, "/CLMF-adminUI-dev/pages");
		me.add("/checkInfo", CheckInfoController.class, "/CLMF-adminUI-dev/pages");
		
		//staff
		me.add("/staff", WorkerController.class, "/CLMF-adminUI-dev/pages");
		me.add("/volunteer", VolunteerController.class, "/CLMF-adminUI-dev/pages");
		me.add("/workerStay", WorkerStayController.class, "/CLMF-adminUI-dev/pages");
		me.add("/volunteerStay", VolunteerStayController.class, "/CLMF-adminUI-dev/pages");
		me.add("/eamilinter", EmailInteractionController.class, "/CLMF-adminUI-dev/pages");
		me.add("/messageinter", MessageInteractionController.class, "/CLMF-adminUI-dev/pages");
		me.add("/wechatinter", WechatInteractionController.class, "/CLMF-adminUI-dev/pages");
		
		
		
		//交通管理
		me.add("/carInfor", CarInforController.class, "/CLMF-adminUI-dev/pages");
		me.add("/driverInfo", DriverInforController.class, "/CLMF-adminUI-dev/pages");
		me.add("/vehicleGuest", VehicleGuestController.class, "/CLMF-adminUI-dev/pages");
		me.add("/vehicleActivity", VehicleActivityController.class, "/CLMF-adminUI-dev/pages");
		me.add("/vehicleTask", VehicleTaskController.class, "/CLMF-adminUI-dev/pages");
		
		//会议设置
		me.add("/guestFile", GuestFileController.class, "/CLMF-adminUI-dev/pages");
		me.add("/visitorFile", VisitorFileController.class, "/CLMF-adminUI-dev/pages");
		me.add("/publishNews", PublishNewsController.class, "/CLMF-adminUI-dev/pages");
		
		//管理员管理
		me.add("/admin_login", AdminLoginController.class, "/CLMF-adminUI-dev/pages");
		me.add("/admin", AdminController.class, "/CLMF-adminUI-dev/pages");
		me.add("/role", RoleController.class, "/CLMF-adminUI-dev/pages");
		
		
		/********************************* 前台 **********************************/
		
		me.add("/front_index", FrontIndexController.class, "/CLMF-frontUI-dev/pages");
		me.add("/guest_infor",GuestController.class, "/CLMF-frontUI-dev/pages");
		me.add("/guest_login", FrontLoginController.class, "/CLMF-frontUI-dev/pages");
		me.add("/guest_register", GuestRegistController.class, "/CLMF-frontUI-dev/pages");
		me.add("/invite", InviteMsgController.class, "/CLMF-frontUI-dev/pages");
		me.add("/contact", ContactController.class, "/CLMF-frontUI-dev/pages");
		
	}
}
