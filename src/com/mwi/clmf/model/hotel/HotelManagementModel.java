package com.mwi.clmf.model.hotel;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class HotelManagementModel extends Model<HotelManagementModel> {

	public static final HotelManagementModel hmDao = new HotelManagementModel();

	public HotelManagementModel getHotelByGuestId(Long guestId) {
		return hmDao.findFirst("select *,hm.id hm_id from cf_hotel_management hm left join cf_guest_infor gi on hm.guest_id=gi.id left join cf_hotel_room hr on hm.room_id=hr.id left join cf_hotel h on hr.hotel_id=h.id where hm.guest_id=?",guestId);
	}
	
	public HotelManagementModel getHotel(Long guestId) {
		return hmDao.findFirst("select * from cf_hotel_management where guest_id=?",guestId);
	}

	public Page<HotelManagementModel> hotelManagementList(String chineseName,
			String englishName, Integer hotelId, Integer roomId,
			String auditStatus, String national, String ch_organ_name,
			String post, String sex, Integer currentPage, Integer currentSize, String sort) {
		String sql = "from cf_hotel_management hm left join cf_guest_infor gi on hm.guest_id=gi.id left join cf_hotel_room hr on hm.room_id=hr.id left join cf_hotel h on hr.hotel_id=h.id where 1=1";
		if(chineseName != null)
			sql += " and gi.chinese_name like '%"+chineseName+"%'";
		if(englishName != null)
			sql += " and gi.english_name like '%"+englishName+"%'";
		if(hotelId != 0)
			sql += " and hr.hotel_id="+hotelId;
		if(roomId != 0)
			sql += " and hm.room_id="+roomId;
		if(auditStatus != null)
			sql += " and hm.status='"+auditStatus+"'";
		if(national != null)
			sql += " and gi.national like '%"+national+"%'";
		if(ch_organ_name != null)
			sql += " and gi.ch_organ_name like '%"+ch_organ_name+"%'";
		if(post != null)
			sql += " and gi.post like '%"+post+"%'";
		if(sex != null)
			sql += " and gi.sex='"+sex+"'";
		sql += sort;	//" order by hm.checkin_time desc"
		return hmDao.paginate(currentPage, currentSize, "select hm.*,hm.id hm_id,gi.*,hr.*,h.* ", sql);
	}
	
	public boolean auditHotel(Long hmId, String auditResult){
		int num = Db.update("update cf_hotel_management set status=? where id=1?",auditResult,hmId);
		return num == 1 ? true : false;
	}
	
	public boolean deleteHotel(Long hmId){
		int num = Db.update("delete from cf_hotel_management where id=?",hmId);
		return num > 0 ? true : false;
	}
	
}
