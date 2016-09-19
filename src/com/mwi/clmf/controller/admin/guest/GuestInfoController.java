package com.mwi.clmf.controller.admin.guest;

import javax.servlet.http.Cookie;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.CountryModel;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.guest.GuestVisaModel;
import com.mwi.clmf.model.hotel.HotelInforModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.model.hotel.HotelRoomModel;
import com.mwi.clmf.service.admin.guest.GuestInfoService;
import com.mwi.clmf.util.Validator;
/**
 * 嘉宾管理
 * @author zx
 *
 */
public class GuestInfoController extends Controller {
	
	public void index(){
		render("mwi_guestRegistrationStatus_displayPage.jsp");
	}
	
	/**
	 * 保存嘉宾信息
	 *
	public void save(){
		boolean saveSuc = false;
		int responseCode = -1;
		String responseMsg = "保存嘉宾信息失败";
		
		String username = getPara("username");
		String password = getPara("password");
		String englishName = getPara("englishName");
		String chineseName = getPara("chineseName");
		String post = getPara("post");
		String sex = getPara("sex");
		String passportNo = getPara("passportNo");
		String national = getPara("national");
		String enOrganName = getPara("enOrganName");
		String chOrganName = getPara("chOrganName");
		String contactNum = getPara("contactNum");
		String phoneNum = getPara("phoneNum");
		String email = getPara("email");
		String address = getPara("address");
		String zipCode = getPara("zipCode");
		String contactPerson = getPara("contactPerson");
		String cpTelephone = getPara("cpTelephone");
		String cpEmail = getPara("cpEmail");
		String auditStatus = getPara("auditStatus");
		
		saveSuc = new GuestInforModel().set("username", username).set("password", password)
									   .set("english_name", englishName).set("chinese_name", chineseName)
									   .set("post", post).set("sex", sex)
									   .set("passport_no", passportNo).set("national", national)
									   .set("en_organ_name", enOrganName).set("ch_organ_name", chOrganName)
									   .set("contact_num", contactNum).set("phone_num", phoneNum)
									   .set("email", email).set("address", address)
									   .set("zip_code", zipCode).set("contact_person", contactPerson)
									   .set("cp_telephone", cpTelephone).set("cp_email", cpEmail)
									   .set("audit_status", auditStatus).save();
		if(saveSuc){
			responseCode = 1;
			responseMsg = "保存嘉宾信息成功";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("responseCode", responseCode);
		map.put("responseMsg", responseMsg);
		renderJson("result", map);
	}*/
	
	/**
	 * 嘉宾管理--嘉宾信息--分页列表
	 */
	public void guestList(){
		String chineseName = Validator.isNull(getPara("chineseName")) ? null : getPara("chineseName");
		String englishName = Validator.isNull(getPara("englishName")) ? null : getPara("englishName");
		String national = Validator.isNull(getPara("national")) ? null : getPara("national");
		String passportNo = Validator.isNull(getPara("passportNo")) ? null : getPara("passportNo");
		String post = Validator.isNull(getPara("post")) ? null : getPara("post");
		String mobile = Validator.isNull(getPara("mobile")) ? null : getPara("mobile");
		String email = Validator.isNull(getPara("email")) ? null : getPara("email");
		String sex = Validator.isNull(getPara("sex")) ? null : getPara("sex");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		
		Page<GuestInforModel> pageList = GuestInfoService.gmService.guestList(chineseName, englishName, national, passportNo, post, mobile, email, sex, currentPage, currentSize);
		System.out.println("controller list:--"+pageList.getList());
		setAttr("pageList", pageList);
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("passportNo", passportNo);
		setAttr("national", national);
		setAttr("post", post);
		setAttr("mobile", mobile);
		setAttr("email", email);
		setAttr("sex", sex);
		setAttr("nationalList", GuestInforModel.guestDao.getGuestNational());
		
		render("mwi_guest_basic_info.jsp");
	}
	
	/**
	 * 嘉宾信息--查看详情
	 */
	public void getGuest(){
		Long guestId = getParaToLong("guestId");
		setAttr("guestInfor", GuestInfoService.gmService.getGuest(guestId));
		setAttr("routeList", RouteModel.rDao.routeList());
		render("guestDetail.jsp");
	}
	
	public void getHotel(){
		Long hotelId = getParaToLong("hotelId");
		HotelInforModel hotel = HotelInforModel.hiDao.findById(hotelId);
		hotel.put("list", HotelRoomModel.hrDao.getRoom(hotelId));
		renderJson(hotel);
	}
	
	/**
	 * 嘉宾信息--查看编辑
	 */
	public void toEditGuest(){
		Long guestId = getParaToLong("guestId");
		setAttr("guestInfor", GuestInfoService.gmService.getGuest(guestId));
		setAttr("routeList", RouteModel.rDao.routeList());
		setAttr("hotelList", HotelInforModel.hiDao.hotelList());
		setAttr("roomList", HotelRoomModel.hrDao.roomList());
		setAttr("countryList", CountryModel.cDao.countryList());
		setAttr("flag", getParaToInt("flag"));
		render("editGuestDetail.jsp");
	}
	
	/**
	 * 嘉宾信息--编辑
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
		redirect("/guestInfo/guestList");
	}
	
	/**
	 * 嘉宾管理--嘉宾信息--删除
	 */
	public void delGuest(){
		Long guestId = getParaToLong("guestId");
		boolean bl = GuestInfoService.gmService.delGuest(guestId);
		Cookie cookie = new Cookie("responseCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/guestInfo/guestList");
	}
	
	/**
	 * 根据身份证查询嘉宾
	 */
	public void getGuestByPassportNo(){
		String passportNo = getPara("passportNo");
		if(!Validator.isNull(passportNo)){
			GuestInforModel gi = GuestInfoService.gmService.getGuestByPassportNo(passportNo);
			renderJson("result", gi);
		}else{
			renderJson("result", null);
		}
	}
	

}
