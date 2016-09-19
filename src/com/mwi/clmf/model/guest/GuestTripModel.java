package com.mwi.clmf.model.guest;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
/**
 * 嘉宾行程安排信息
 * @author sw
 *
 */
@SuppressWarnings("serial")
public class GuestTripModel extends Model<GuestTripModel> {

	public static final GuestTripModel guestTripDao = new GuestTripModel();
	
	public boolean updateStatus(String status, long guestId){
		int num = Db.update("update cf_guest_trip set arrival_status=? where guest_id=?",status,guestId);
		return num == 1 ? true : false;
	}
	
	public GuestTripModel getTripByGuestId(Long guestId){
		return guestTripDao.findFirst("select * from cf_guest_trip where guest_id=?",guestId);
	}
	
	public Page<GuestTripModel> getGuestListWithTrip(int pageNumber, int pageSize){
		String sqlPrefix = "select gi.id guestId, gi.*, gt.*";
		String sqlSurfix = " from cf_guest_infor gi, cf_guest_trip gt where gi.id = gt.guest_id";
		return guestTripDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
}
