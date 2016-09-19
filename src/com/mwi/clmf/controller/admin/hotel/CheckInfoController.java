package com.mwi.clmf.controller.admin.hotel;

import javax.servlet.http.Cookie;

import com.jfinal.core.Controller;
import com.mwi.clmf.model.CountryModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.hotel.HotelInforModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.model.hotel.HotelRoomModel;
import com.mwi.clmf.service.admin.hotel.CheckInfoService;
import com.mwi.clmf.util.Validator;

public class CheckInfoController extends Controller {
	
	/**
	 * 住宿信息，入住管理分页列表
	 */
	public void index(){
		/*String chineseName = Validator.isNull(getPara("chineseName")) ? null : getPara("chineseName");
		String englishName = Validator.isNull(getPara("englishName")) ? null : getPara("englishName");
		Integer hotelId = getParaToInt("hotelId") == null ? 0 : getParaToInt("hotelId");
		Integer roomId = getParaToInt("roomId") == null ? 0 : getParaToInt("roomId");
		String national = Validator.isNull(getPara("national")) ? null : getPara("national");
		String ch_organ_name = Validator.isNull(getPara("ch_organ_name")) ? null : getPara("ch_organ_name");
		String post = Validator.isNull(getPara("post")) ? null : getPara("post");
		String sex = Validator.isNull(getPara("sex")) ? null : getPara("sex");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		
		setAttr("pageList", CheckInfoService.ciService.pageList(chineseName, englishName, hotelId, roomId, national, ch_organ_name, post, sex, currentPage, currentSize));
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("hotelId", hotelId);
		setAttr("roomId", roomId);
		setAttr("national", national);
		setAttr("ch_organ_name", ch_organ_name);
		setAttr("post", post);
		setAttr("sex", sex);
		setAttr("hotelList", HotelInforModel.hiDao.hotelList());
		setAttr("roomList", HotelRoomModel.hrDao.roomList());
		setAttr("countryList", CountryModel.cDao.countryList());*/
		render("mwi_hotel_info_add.jsp");
	}
	
	/**
	 * 新增住宿信息
	 */
	public void add(){
		Long guestId = getParaToLong("guestId");
		Long roomId = getParaToLong("roomId");
		
	}
	
	public void checkGuest(){
		GuestInforModel gi = GuestInforModel.guestDao.getGuestByPassportNo(getPara("passportNo"));
		Long guestId = null;
		if(gi != null)
			guestId = gi.getLong("id");
		renderJson(guestId);
	}
	
	
	public void toEdit(){
		Long guestId = getParaToLong("guestId");
		setAttr("hotel", CheckInfoService.ciService.getHotelByGuestId(guestId));
		setAttr("hotelList", HotelInforModel.hiDao.hotelList());
		setAttr("roomList", HotelRoomModel.hrDao.roomList());
		render("");
	}
	
	/**
	 * 编辑住宿信息
	 */
	public void edit(){
		boolean bl = getModel(HotelManagementModel.class, "hotel").update();
		Cookie cookie = new Cookie("responseMsg",bl ? "保存成功！" : "保存失败！");
		getResponse().addCookie(cookie);
		redirect("/checkInfo/");
	}
	
	/**
	 * Excel导入住宿信息
	 */
	public void checkInImport(){
		
	}
	
}
