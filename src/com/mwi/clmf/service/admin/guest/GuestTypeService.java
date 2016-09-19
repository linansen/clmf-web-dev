package com.mwi.clmf.service.admin.guest;

import java.util.List;

import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTypeModel;


public class GuestTypeService {
	
	public static final GuestTypeService guestTypeService = new GuestTypeService();
	
	public List<GuestTypeModel> getGuestTypeList(){
		return GuestTypeModel.guestTypeDao.getGuestTypeList();
	}
	
	public void setGuestType(Long guestId, Long guestTypeId){
		GuestInforModel.guestDao.findById(guestId).set("guest_type", guestTypeId).update();
	}
	
	public void batchSetGuestType(String[] guestIdArr, String guestTypeId){
		for(int i=0; i<guestIdArr.length; i++){
			GuestInforModel.guestDao.findById(guestIdArr[i]).set("guest_type", guestTypeId).update();
		}
	}
	
}
