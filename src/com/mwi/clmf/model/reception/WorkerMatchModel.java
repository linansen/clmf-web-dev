package com.mwi.clmf.model.reception;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;


@SuppressWarnings("serial")
public class WorkerMatchModel extends Model<WorkerMatchModel>{
	
	public static final WorkerMatchModel wmDao = new WorkerMatchModel();
	//String rideDate, Long routeId, Integer ridSeq, String guestName
	
	
	public List<WorkerMatchModel> staffMatchList(String workerType, Long guestId){
		
		return wmDao.find("SELECT m.guest_id, m. worker_id, wi.* FROM cf_match m, cf_worker_infor wi WHERE wi.id = m.worker_id AND wi.worker_type = ? AND m.guest_id = ?", workerType, guestId);
	}

}
