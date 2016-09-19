package com.mwi.clmf.controller.admin.hotel;

import javax.servlet.http.Cookie;

import com.jfinal.core.Controller;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.hotel.HotelInforModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.model.hotel.HotelRoomModel;
import com.mwi.clmf.service.admin.hotel.HotelAuditService;
import com.mwi.clmf.util.Validator;

public class HotelAuditController extends Controller {

	public void index(){
		
	}
	
	/**
	 * 嘉宾入住酒店信息审核列表
	 */
	public void getList(){
		String chineseName = Validator.isNull(getPara("chineseName")) ? null : getPara("chineseName");
		String englishName = Validator.isNull(getPara("englishName")) ? null : getPara("englishName");
		Integer hotelId = getParaToInt("hotelId") == null ? 0 : getParaToInt("hotelId");
		Integer roomId = getParaToInt("roomId") == null ? 0 : getParaToInt("roomId");
		String auditStatus = Validator.isNull(getPara("auditStatus")) ? null : getPara("auditStatus");
		String national = Validator.isNull(getPara("national")) ? null : getPara("national");
		String ch_organ_name = Validator.isNull(getPara("ch_organ_name")) ? null : getPara("ch_organ_name");
		String post = Validator.isNull(getPara("post")) ? null : getPara("post");
		String sex = Validator.isNull(getPara("sex")) ? null : getPara("sex");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		
		setAttr("pageList", HotelAuditService.haService.hotelAuditList(chineseName, englishName, hotelId, roomId, auditStatus, national, ch_organ_name, post, sex, currentPage, currentSize));
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("hotelId", hotelId);
		setAttr("roomId", roomId);
		setAttr("auditStatus", auditStatus);
		setAttr("national", national);
		setAttr("ch_organ_name", ch_organ_name);
		setAttr("post", post);
		setAttr("sex", sex);
		setAttr("hotelList", HotelInforModel.hiDao.hotelList());
		setAttr("roomList", HotelRoomModel.hrDao.roomList());
		setAttr("nationalList", GuestInforModel.guestDao.getGuestNational());
		render("mwi_hotel_check.jsp");
	}
	
	public void toHotelAudit(){
		Long guestId = getParaToLong("guestId");
		setAttr("hotel", HotelAuditService.haService.getHotelInfo(guestId));
		setAttr("hotelList", HotelInforModel.hiDao.hotelList());
		setAttr("roomList", HotelRoomModel.hrDao.roomList());
		render("auditHotelInfor.jsp");
	}
	
	/**
	 * 嘉宾入住酒店信息审核
	 */
	public void hotelAudit(){
		HotelManagementModel hm = getModel(HotelManagementModel.class, "hotel");
		Integer is_audit = getParaToInt("is_audit");
		Integer is_wechat = getParaToInt("is_wechat");
		Integer is_email = getParaToInt("is_email");
		boolean bl = hm.set("status", is_audit).update();
		System.out.println("update hotel:-- "+bl);
		HotelAuditService.haService.hotelAudit(Long.valueOf(hm.getStr("guest_id")), is_audit, is_wechat, is_email);
		redirect("/hotelAudit/getList");
	}
	
	/**
	 * 嘉宾酒店信息管理住宿详情
	 */
	public void editGuestHotelInfo(){
		Long guestId = getParaToLong("guestId");
		setAttr("hotelManagement", HotelAuditService.haService.getHotelInfo(guestId));
		setAttr("hotelList", HotelInforModel.hiDao.hotelList());
		setAttr("roomList", HotelRoomModel.hrDao.roomList());
		render("");
	}
	
	/**
	 * 删除住宿信息
	 */
	public void delete(){
		boolean bl = HotelAuditService.haService.deleteHotelManagement(getParaToLong("hmId"));
		Cookie cookie = new Cookie("responseCode",bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/hotelAudit/getList");
	}
	
	
}
