package com.mwi.clmf.controller.admin.reception;

import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.service.admin.reception.GuestCheckArriveService;
import com.mwi.clmf.util.Validator;

/**
 * 接待管理
 * @author zx
 *
 */
public class GuestCheckArriveController extends Controller {
	
	public void index() {
		render("mwi_guestRegistrationStatus_displayPage.jsp");
	}
	
	/**
	 * 接待管理--嘉宾报到--嘉宾信息分页列表搜索
	 */
	public void receptionList(){
		String chineseName = Validator.isNull(getPara("chineseName")) ? null : getPara("chineseName");
		String englishName = Validator.isNull(getPara("englishName")) ? null : getPara("englishName");
		String passportNo = Validator.isNull(getPara("passportNo")) ? null : getPara("passportNo");
		String arrivalDate = Validator.isNull(getPara("arrivalDate")) ? null : getPara("arrivalDate");
		String arrivalTime = Validator.isNull(getPara("arrivalTime")) ? null : getPara("arrivalTime");
		String arrivalStation = Validator.isNull(getPara("arrivalStation")) ? null : getPara("arrivalStation");
		String national = Validator.isNull(getPara("national")) ? null : getPara("national");
		String post = Validator.isNull(getPara("post")) ? null : getPara("post");
		String mobile = Validator.isNull(getPara("mobile")) ? null : getPara("mobile");
		String email = Validator.isNull(getPara("email")) ? null : getPara("email");
		String sex = Validator.isNull(getPara("sex")) ? null : getPara("sex");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		
		Page<GuestInforModel> pageList = GuestCheckArriveService.rmService.receptionList(chineseName, englishName, passportNo, arrivalDate, arrivalTime, arrivalStation, national, post, mobile, email, sex, currentPage, currentSize);
		System.out.println("list szie:--"+pageList.getList().size());
		setAttr("pageList", pageList);
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("passportNo", passportNo);
		setAttr("arrivalDate", arrivalDate);
		setAttr("arrivalTime", arrivalTime);
		setAttr("arrivalStation", arrivalStation);
		setAttr("national", national);
		setAttr("post", post);
		setAttr("mobile", mobile);
		setAttr("email", email);
		setAttr("sex", sex);
		render("mwi_guestRegistrationStatus_displayPage.jsp");
	}
	
	/**
	 * 接待管理--嘉宾报到--通过设备获取嘉宾详细信息
	 */
	public void getGuestApi(){
		
		render("mwi_guestRegistration_page.jsp");
	}
	
	/**
	 * 接待管理--嘉宾报到--嘉宾详细信息查询
	 */
	public void receptionGuestInfor(){
		Long guestId = getParaToLong("guestId");
		Map<String, Object> map = GuestCheckArriveService.rmService.receptionGuestInfor(guestId);
		setAttr("guestInfor", map.get("guestInfor"));
		setAttr("hotel", map.get("hotel"));
		setAttr("route", map.get("route"));
		setAttr("guestTrip", map.get("guestTrip"));
		render("mwi_guestRegistration_page.jsp");
	}
	
	/**
	 * 嘉宾报到--详细信息保存修改
	 */
	public void updReceptionGuestInfo(){
		GuestInforModel gi = getModel(GuestInforModel.class, "guestInfor");
		GuestCheckArriveService.rmService.updReceptionGuestInfo(gi, getModel(GuestTripModel.class, "guestTrip"), getModel(HotelManagementModel.class, "hotel"));
		redirect("/checkArrive/receptionGuestInfor?guestId="+gi.getLong("id"));
	}
	
	/**
	 * 嘉宾报到--确认报到
	 */
	public void updateStatus(){
		Long guestId = getParaToLong("guestId");
		GuestCheckArriveService.rmService.updateStatus(guestId);
		redirect("/checkArrive/receptionGuestInfor?guestId="+guestId);
		
	}
	
	/**
	 * 嘉宾报到--证件激活
	 */
	public void activateCard(){
		GuestCheckArriveService.rmService.activateCard(getParaToLong("guestId"));
		redirect("/checkArrive/receptionGuestInfor?guestId="+getParaToLong("guestId"));
	}
	
}
