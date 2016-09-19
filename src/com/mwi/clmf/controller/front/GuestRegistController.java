package com.mwi.clmf.controller.front;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.mwi.clmf.model.CountryModel;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.guest.GuestVisaModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.model.hotel.HotelRoomModel;

public class GuestRegistController extends Controller {

	@Clear
	public void index(){
		setAttr("routeList", RouteModel.rDao.routeList());
		setAttr("roomList", HotelRoomModel.hrDao.roomList());
		setAttr("countryList", CountryModel.cDao.countryList());
		render("register.jsp");
	}

	@Clear
	public void register(){
		boolean giSaveSuc = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = sdf.format(new Date(System.currentTimeMillis()));
		GuestInforModel gi = getModel(GuestInforModel.class, "guest");
		gi.set("audit_status", 0);
		giSaveSuc = gi.save();
		Long guestId = gi.getLong("id");
		if(giSaveSuc){
			//保存行程信息
			GuestTripModel gt = getModel(GuestTripModel.class, "gt");
			gt.set("guest_id", guestId);
			gt.set("arrival_shift_no", null==gt.getStr("arrival_shift_no")?null:gt.getStr("arrival_shift_no").toUpperCase());
			gt.set("leave_shift_no", null==gt.getStr("leave_shift_no")?null:gt.getStr("leave_shift_no").toUpperCase());
			gt.set("create_time", now);
			gt.set("arrival_status", "1");
			gt.save();
			
			//保存会外活动信息
			ActivityManagementModel am = getModel(ActivityManagementModel.class, "am");
			am.set("guest_id", guestId);
			am.set("route_audit_status", "0");
			am.save();
			
			//保存住宿信息
			HotelManagementModel hm = getModel(HotelManagementModel.class, "hm");
			hm.set("guest_id", guestId);
			hm.set("status", "0");
			hm.save();
			
			//保存签证信息
			GuestVisaModel gv = getModel(GuestVisaModel.class, "gv");
			gv.set("guest_id", guestId);
			gv.set("create_time", now);
			redirect("/front_index");
			renderJson("status", "注册成功");
			
		}
	}

	@Clear
	public void checkEmail(){
		String email = getPara("email");
		GuestInforModel gi = GuestInforModel.guestDao.getGuestByEmail(email);
		boolean bl = false;
		if(gi == null){
			bl = true;
		}else{
			bl = false;
		}
		renderJson(bl);
	}

	@Clear
	public void checkRoommate(){
		String name = getPara("name");
		String passportNo = getPara("passportNo");
		GuestInforModel gi = GuestInforModel.guestDao.getGuestByPassportNo(name, passportNo);
		boolean bl = false;
		if(gi == null)
			bl = false;
		else
			bl = true;
		renderJson(bl);
	}
	
}









