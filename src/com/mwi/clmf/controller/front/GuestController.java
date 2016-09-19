package com.mwi.clmf.controller.front;

import javax.servlet.http.Cookie;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.mwi.clmf.interceptor.FrontInterceptor;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.guest.GuestVisaModel;
import com.mwi.clmf.model.hotel.HotelInforModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.model.hotel.HotelRoomModel;
import com.mwi.clmf.model.meeting.GuestFileModel;
import com.mwi.clmf.service.admin.guest.GuestInfoService;
import com.mwi.clmf.util.Validator;

public class GuestController extends Controller {
	@Clear
	@Before(FrontInterceptor.class)
	public void index(){
		render("guest_index.jsp");
	}
	
	@Clear
	@Before(FrontInterceptor.class)
	public void detail(){
		Long guestId = getSessionAttr("guestId");
		setAttr("guestInfor", GuestInfoService.gmService.getGuest(guestId));
		setAttr("routeList", RouteModel.rDao.routeList());
		render("guestDetail.jsp");
	}
	
	@Clear
	@Before(FrontInterceptor.class)
	public void communicate(){
		render("guestComunicate.jsp");
	}
	
	@Clear
	@Before(FrontInterceptor.class)
	public void meetingSchedule(){
		render("meetSchedule.jsp");
	}

	@Clear
	@Before(FrontInterceptor.class)
	public void download(){
		System.out.println(GuestFileModel.fuDao.guestFileList());
		setAttr("guestFileList", GuestFileModel.fuDao.guestFileList());
		render("download.jsp");
	}
	

	@Clear
	@Before(FrontInterceptor.class)
	public void cancelMeeting(){
		render("cancelMeet.jsp");
	}
	
	@Clear
	@Before(FrontInterceptor.class)
	public void submitCancelMeeting(){
		Long guestId = getSessionAttr("guestId");
		new GuestInforModel().findById(guestId).set("toJoinM", "0").set("audit_status", "5").set("cancel_reason", getPara("cancel_reason")).update();
		redirect("/front_index");
	}
	

	@Clear
	@Before(FrontInterceptor.class)
	public void editGuestDetail(){
		Long guestId = getSessionAttr("guestId");
		setAttr("guestInfor", GuestInfoService.gmService.getGuest(guestId));
		setAttr("routeList", RouteModel.rDao.routeList());
		setAttr("hotelList", HotelInforModel.hiDao.hotelList());
		setAttr("roomList", HotelRoomModel.hrDao.roomList());
		render("editGuestDetail.jsp");
	}

	@Clear
	@Before(FrontInterceptor.class)
	public void submitEditGuestDetail(){
		// 嘉宾信息
		GuestInforModel gi = getModel(GuestInforModel.class, "guestInfor");
		Long guestId = gi.getLong("id");
		boolean bl = gi.update();
		System.out.println("guest infor：-- "+bl);
		// 签证信息
		GuestVisaModel gv = getModel(GuestVisaModel.class, "visa");
		gv.set("guest_id", guestId);
		boolean gvbl = false;
		if(gv.getLong("id") != null){
			gvbl = gv.update();
		}else{
			gvbl = gv.save();
		}
		System.out.println("guest visa : -- "+gvbl);
		// 活动安排
		Long routeId23 = getParaToLong("routeId23");
		Long routeId24 = getParaToLong("routeId24");
		Long routeId25 = getParaToLong("routeId25");
		Long[] routeId = new Long[3];
		if(routeId23 != null){
			routeId[0] = routeId23;
		}
		if(routeId24 != null){
			routeId[1] = routeId24;
		}
		if(routeId25 != null){
			routeId[2] = routeId25;
		}
		boolean rubl = true;
		ActivityManagementModel.amDao.delActivityByGuestId(guestId);
		if(routeId != null){
			for (int i = 0; i < routeId.length; i++) {
				if(routeId[i] != null){
					ActivityManagementModel am = new ActivityManagementModel();
					rubl = am.set("route_id", routeId[i]).set("guest_id", guestId).set("route_audit_status", "1").save();
				}
			}
			System.out.println("route : -- "+rubl);
		}
		// 住宿安排
		HotelManagementModel hm = HotelManagementModel.hmDao.getHotel(guestId);
		String checkin_time = Validator.isNull(getPara("checkin_time")) ? null : getPara("checkin_time");
		String checkout_time = Validator.isNull(getPara("checkout_time")) ? null : getPara("checkout_time");
		String with_roommate = getPara("with_roommate");
		String roommate_name = "";
		String roommate_idNo = "";
		String roommate_email = "";
		if("2".equals(with_roommate)){
			roommate_name = getPara("roommate_name");
			roommate_idNo = getPara("roommate_idNo");
			roommate_email = getPara("roommate_email");
		}
		String is_smoking = getPara("is_smoking");
		Long room_id = getParaToLong("room_id");
		boolean hobl = false;
		if(hm != null){
			hobl = hm.set("checkin_time", checkin_time)
				     .set("checkout_time", checkout_time)
				     .set("with_roommate", with_roommate)
				     .set("room_id", room_id)
				     .set("is_smoking", is_smoking)
				     .set("roommate_name", roommate_name)
				     .set("roommate_idNo", roommate_idNo)
				     .set("roommate_email", roommate_email).update();
		}
		System.out.println("hotel infor : -- "+hobl);
		// 行程安排
		GuestTripModel trip = getModel(GuestTripModel.class, "trip");
		GuestTripModel gt = GuestTripModel.guestTripDao.getTripByGuestId(guestId);
		boolean gtbl = trip.set("id", gt.getLong("id")).update();
		System.out.println("guest trip : -- "+gtbl);
		Cookie cookie1 = new Cookie("editCode", bl && gvbl && rubl && hobl && gtbl ? "1" : "0");
		getResponse().addCookie(cookie1);
		redirect("/guest_infor/detail");
	}

	@Clear
	@Before(FrontInterceptor.class)
	public void resetPassword(){
		Long guestId = getSessionAttr("guestId");
		String originalPsw = getPara("originalPsw");
		String newPsw = getPara("newPsw");
		GuestInforModel gi = new GuestInforModel().findById(guestId);
		if(originalPsw.equals(gi.get("password"))){
			gi.set("password", newPsw);
		}
		redirect("/guest_login/logout");
	}
	
}
