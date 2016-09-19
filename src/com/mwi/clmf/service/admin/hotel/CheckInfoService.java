package com.mwi.clmf.service.admin.hotel;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.hotel.HotelManagementModel;

public class CheckInfoService {

	public static final CheckInfoService ciService = new CheckInfoService();

	public Page<HotelManagementModel> pageList(String chineseName,
			String englishName, Integer hotelId, Integer roomId,
			String national, String ch_organ_name, String post, String sex,
			Integer currentPage, Integer currentSize) {
		return HotelManagementModel.hmDao.hotelManagementList(chineseName, englishName, hotelId, roomId, null, national, ch_organ_name, post, sex, currentPage, currentSize, " order by hm.checkin_time desc");
	}
	
	public HotelManagementModel getHotelByGuestId(Long guestId) {
		return HotelManagementModel.hmDao.getHotelByGuestId(guestId);
	}

}
