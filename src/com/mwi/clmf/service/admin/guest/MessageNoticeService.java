package com.mwi.clmf.service.admin.guest;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.guest.GuestInforModel;

public class MessageNoticeService {
	
	public static final MessageNoticeService mnService = new MessageNoticeService();
	
	public Page<GuestInforModel> messageNoticeList(Integer currentPage, Integer currentSize){
		return GuestInforModel.guestDao.paginate(currentPage, currentSize, "select * ", "from cf_guest_infor");
	}

}
