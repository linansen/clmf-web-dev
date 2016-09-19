package com.mwi.clmf.model.transport;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;


@SuppressWarnings("serial")
public class RideLogModel extends Model<RideLogModel>{
	
	public static final RideLogModel rlDao = new RideLogModel();
	//String rideDate, Long routeId, Integer ridSeq, String guestName
	public Page<RideLogModel> getRideLog(int pageNumber, int pageSize, String rideDate, Long routeId, Integer ridSeq, String guestName){
		boolean fstCondi = false;
		String sqlprefix = "SELECT rl.id, rl.guest_id, gi.chinese_name, gi.post, gi.phone, (SELECT route_content from cf_route r WHERE r.id = rl.route_id) routeContent, rl.car_no, rl.count, rl.time";
		String sqlsurfix = " from cf_ride_log rl, cf_guest_infor gi WHERE rl.guest_id = gi.id";
		fstCondi = rideDate != null && routeId != null && ridSeq != null && !"".equals(ridSeq);
		System.out.println(fstCondi);
		if(fstCondi){
			sqlsurfix = sqlsurfix + " and rl.time = '" + rideDate + "' and rl.route_id = " + routeId + " and rl.count = "+ridSeq;
		}
		
		if(guestName != null && !"".equals(guestName)){
			sqlsurfix = sqlsurfix + " and gi.chinese_name like '%" + guestName+"%'";
		}
		return rlDao.paginate(pageNumber, pageSize, sqlprefix, sqlsurfix);
	}

}
