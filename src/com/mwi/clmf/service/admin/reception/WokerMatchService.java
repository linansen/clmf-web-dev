package com.mwi.clmf.service.admin.reception;

import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.reception.WorkerMatchModel;

public class WokerMatchService {
	public static final WokerMatchService wokerMatchService = new WokerMatchService();
	
	public Page<GuestInforModel> getGuestWithWorker(int pageNumber, int pageSize){
		
		Page<GuestInforModel> guestPageList = GuestInforModel.guestDao.guestPageList(pageNumber, pageSize);
		List<GuestInforModel> guestList = guestPageList.getList();
		
		for(int i=0; i<guestList.size(); i++){
			guestList.get(i).put("workerList", WorkerMatchModel.wmDao.staffMatchList("1", guestList.get(i).getLong("id")));
			guestList.get(i).put("supporterList", WorkerMatchModel.wmDao.staffMatchList("2", guestList.get(i).getLong("id")));
		}
		
		return guestPageList;
	}
}
