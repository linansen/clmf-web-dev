package com.mwi.clmf.model.reception;

import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.staff.WorkerInforModel;

public class GuestTripManageService {
	public static final GuestTripManageService guestTripManagerService = new GuestTripManageService();
	
	public Page<GuestTripModel> guestTripList(int pageNumber, int pageSize){
		Page<GuestTripModel> gtp = GuestTripModel.guestTripDao.getGuestListWithTrip(pageNumber, pageSize);
		List<GuestTripModel> gtl = gtp.getList();
		for(int i=0; i<gtl.size(); i++){
			gtl.get(i).put("workerList",WorkerInforModel.wiDao.getWorkerByGuestId(gtl.get(i).getLong("guestId"), "1"));
			gtl.get(i).put("workerList",WorkerInforModel.wiDao.getWorkerByGuestId(gtl.get(i).getLong("guestId"), "2"));
			gtl.get(i).put("receptionStandard",ReceptionStadardModel.rsDao.getStandardByGuestId(gtl.get(i).getLong("guestId")));
		}
		return gtp;
	}
	
	
}








