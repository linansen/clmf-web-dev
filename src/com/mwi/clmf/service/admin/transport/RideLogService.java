package com.mwi.clmf.service.admin.transport;

import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.staff.WorkerInforModel;
import com.mwi.clmf.model.transport.RideLogModel;

public class RideLogService {
	public static final RideLogService rideLogService = new RideLogService();
	
	public Page<RideLogModel> getRideLogList(int pageNumber, int pageSize, String rideDate, Long routeId, Integer ridSeq, String guestName){
		Page<RideLogModel> pageList = RideLogModel.rlDao.getRideLog(pageNumber, pageSize, rideDate, routeId, ridSeq, guestName);
		List<RideLogModel> logList = pageList.getList();
		for (RideLogModel rideLogModel : logList) {
			rideLogModel.put("worker", WorkerInforModel.wiDao.getWorkerByGuestId(rideLogModel.getLong("guest_id"), "1"));
			rideLogModel.put("surpporter", WorkerInforModel.wiDao.getWorkerByGuestId(rideLogModel.getLong("guest_id"), "2"));
		}
		return pageList;
	}
}
