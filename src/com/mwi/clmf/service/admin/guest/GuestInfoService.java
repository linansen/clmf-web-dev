package com.mwi.clmf.service.admin.guest;

import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.guest.GuestVisaModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;

public class GuestInfoService {

	public static final GuestInfoService gmService = new GuestInfoService();

	public Page<GuestInforModel> guestList(String chineseName,
			String englishName, String national, String passportNo,
			String post, String mobile, String email, String sex,
			int currentPage, int currentSize) {
		Page<GuestInforModel> pageList = GuestInforModel.guestDao.getList(chineseName, englishName,
				passportNo, null, null, null, national, post, mobile, email,
				sex, null, currentPage, currentSize);
		List<GuestInforModel> list = pageList.getList();
		if(list.size() > 0){
			for (GuestInforModel li : list) {
				li.put("guestVisa", GuestVisaModel.guestVisaDao.getGuestVisa(li.getLong("id")));
				li.put("guestActivity", ActivityManagementModel.amDao.getList(li.getLong("id")));
				li.put("hotel",HotelManagementModel.hmDao.getHotelByGuestId(li.getLong("id")));
				li.put("guestTrip", GuestTripModel.guestTripDao.getTripByGuestId(li.getLong("id")));
			}
		}
		return pageList;
	}
	
	public GuestInforModel getGuest(Long guestId){
		GuestInforModel gi = GuestInforModel.guestDao.getGuestInfor(guestId);
		gi.put("activity", RouteModel.rDao.getRouteByGuestId(guestId));
		gi.put("hotel", HotelManagementModel.hmDao.getHotelByGuestId(guestId));
		System.out.println("service guestInfor:--"+gi);
		return gi;
	}
	
	public boolean delGuest(Long guestId){
		return GuestInforModel.guestDao.updateStatus(guestId, "4");
	}
	
	public Page<GuestInforModel> getGuestListById(int pageNumber, int pageSize, String[] idsArr){
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<idsArr.length; i++){
			sb.append(idsArr[i]);
			sb.append(",");
		}
		sb.deleteCharAt(sb.lastIndexOf(","));
		
		Page<GuestInforModel> guestList = GuestInforModel.guestDao.getGuestListById(pageNumber, pageSize, sb.toString());
		
		return guestList;
		
	}
	
	public GuestInforModel getGuestByPassportNo(String passportNo){
		return GuestInforModel.guestDao.getGuestByPassportNo(passportNo);
	}
	

}
