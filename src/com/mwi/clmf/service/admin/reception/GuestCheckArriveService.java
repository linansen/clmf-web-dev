package com.mwi.clmf.service.admin.reception;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.ChackCardModel;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;

public class GuestCheckArriveService {
	
	public static final GuestCheckArriveService rmService = new GuestCheckArriveService();
	
	// 条件查询接待嘉宾信息分页列表
	public Page<GuestInforModel> receptionList(String chineseName,
			String englishName, String passportNo, String arrivalDate,
			String arrivalTime, String arrivalStation, String national,
			String post, String mobile, String email, String sex,
			int currentPage, int currentSize) {
		return GuestInforModel.guestDao.getList(chineseName, englishName,
				passportNo, arrivalDate, arrivalTime, arrivalStation, national,
				post, mobile, email, sex, null, currentPage, currentSize);
	}
	
	// 接待嘉宾详细信息
	public Map<String, Object> receptionGuestInfor(Long guestId){
		Map<String, Object> map = new HashMap<String, Object>();
		//嘉宾信息
		GuestInforModel guestInfor = GuestInforModel.guestDao.findById(guestId);
		guestInfor.put("card", ChackCardModel.chackCardDao.findById(guestInfor.getLong("card_id")));
		map.put("guestInfor", guestInfor);
		
		//嘉宾路线选择
		map.put("hotel", HotelManagementModel.hmDao.getHotelByGuestId(guestId));
		
		//嘉宾住宿安排
		map.put("route", RouteModel.rDao.getRouteByGuestId(guestId));
		
		//嘉宾行程安排
		map.put("guestTrip", GuestTripModel.guestTripDao.getTripByGuestId(guestId));
		
		return map;
	}
	
	// 接待嘉宾信息修改
	public boolean updReceptionGuestInfo(GuestInforModel gi, GuestTripModel gt, HotelManagementModel hm){
		boolean bl1 = gi.update();
		boolean bl2 = gt.update();
		boolean bl3 = hm.update();
		System.out.println("bl1:--"+bl1+"--bl2:--"+bl2+"--bl3:--"+bl3);
		return bl1 && bl2 && bl3;
	}
	
	// 证件激活
	public boolean activateCard(Long guestId){
		return ChackCardModel.chackCardDao.updateStatus("1", guestId);
	}
	
	// 确认报到
	public boolean updateStatus(Long guestId){
		return GuestTripModel.guestTripDao.updateStatus("0", guestId);
	}
	
}
