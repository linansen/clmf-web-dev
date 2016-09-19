package com.mwi.clmf.controller.admin.guest;

import javax.servlet.http.Cookie;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.guest.GuestVisaModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.service.admin.guest.GuestAuditService;
import com.mwi.clmf.util.Validator;

public class GuestAuditController extends Controller {

	public void auditList(){
		String chineseName = Validator.isNull(getPara("chineseName")) ? null : getPara("chineseName");
		String englishName = Validator.isNull(getPara("englishName")) ? null : getPara("englishName");
		String national = Validator.isNull(getPara("national")) ? null : getPara("national");
		String email = Validator.isNull(getPara("email")) ? null : getPara("email");
		String post = Validator.isNull(getPara("post")) ? null : getPara("post");
		String mobile = Validator.isNull(getPara("mobile")) ? null : getPara("mobile");
		String sex = Validator.isNull(getPara("sex")) ? null : getPara("sex");
		String auditStatus = Validator.isNull(getPara("auditStatus")) ? null : getPara("auditStatus");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		
		Page<GuestInforModel> pageList = GuestAuditService.gaService.guestList(chineseName, englishName, national, null, post, mobile, email, sex, auditStatus, currentPage, currentSize);
		System.out.println("audit controller list:--"+pageList.getList());
		setAttr("pageList", pageList);
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("national", national);
		setAttr("post", post);
		setAttr("mobile", mobile);
		setAttr("email", email);
		setAttr("sex", sex);
		setAttr("auditStatus", auditStatus);
		setAttr("nationalList", GuestInforModel.guestDao.getGuestNational());
		
		render("mwi_guest_check.jsp");
	}
	
	/**
	 * 审核嘉宾
	 */
	public void auditGuest(){
		Long guestId = getParaToLong("guestId");
		Integer status = getParaToInt("status");
		String templateLanguage = getPara("templateLanguage");
		String refuse_reson = getPara("refuse_reson");
		Integer isSentEmail = getParaToInt("isSentEmail");
		boolean bl = GuestAuditService.gaService.auditGuest(guestId, status, templateLanguage, refuse_reson, isSentEmail);
		System.out.println("guest audit:--"+bl);
		redirect("/guestAudit/auditList");
	}
	
	/**
	 * 批量审核
	 */
	public void batchAuditGuest(){
		String guestId = getPara("guestId");
		guestId = guestId.substring(0,guestId.length()-1);
		Integer status = getParaToInt("status");
		String templateLanguage = getPara("templateLanguage");
		String refuse_reson = getPara("refuse_reson");
		Integer isSentEmail = getParaToInt("isSentEmail");
		String[] guest = guestId.split(",");
		boolean bl = false;
		for (int i = 0; i < guest.length; i++) {
			bl = GuestAuditService.gaService.auditGuest(Long.valueOf(guest[i]), status, templateLanguage, refuse_reson, isSentEmail);
		}
		Cookie cookie = new Cookie("auditCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/guestAudit/auditList");
	}
	
	/**
	 * 编辑
	 */
	public void editGuest(){
		// 嘉宾信息
		GuestInforModel gi = getModel(GuestInforModel.class, "guestInfor");
		Long guestId = gi.getLong("id");
		boolean bl = gi.update();
		System.out.println("guest infor：-- "+bl);
		// 签证信息
		boolean gvbl = true;
		if("1".equals(gi.getStr("toVisa"))){
			GuestVisaModel gv = getModel(GuestVisaModel.class, "visa");
			gv.set("guest_id", guestId);
			if(gv.getLong("id") != null){
				gvbl = gv.update();
			}else{
				gvbl = gv.save();
			}
		}
		System.out.println("guest visa : -- "+gvbl);
		// 活动安排
		Long routeId24 = getParaToLong("routeId24");
		Long routeId25 = getParaToLong("routeId25");
		Long[] routeId = new Long[2];
		if(routeId24 != null){
			routeId[0] = routeId24;
		}
		if(routeId25 != null){
			routeId[1] = routeId25;
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
		boolean hobl = true;
		if(hm != null){
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
		GuestTripModel gt = GuestTripModel.guestTripDao.getTripByGuestId(guestId);
		boolean gtbl = true;
		if(gt != null){
			GuestTripModel trip = getModel(GuestTripModel.class, "trip");
			gtbl = trip.set("id", gt.getLong("id")).update();
		}
		System.out.println("guest trip : -- "+gtbl);
		Cookie cookie = new Cookie("resultCode", bl && gvbl && rubl && hobl && gtbl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/guestAudit/auditList");
	}
	
	/**
	 * 批量删除
	 */
	public void delGuest(){
		String guestId = getPara("guestId");
		guestId = guestId.substring(0,guestId.length()-1);
		boolean bl = GuestAuditService.gaService.batchDel(guestId);
		Cookie cookie = new Cookie("responseCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/guestAudit/auditList");
	}
	
}
