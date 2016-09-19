package com.mwi.clmf.model.guest;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
@SuppressWarnings("serial")
public class GuestDiningModel extends Model<GuestDiningModel> {
	public static final GuestDiningModel GMDao = new GuestDiningModel();
	
	public Page<GuestDiningModel> getGuestDiningList(String dining_date, String dining_time, String dining_place, Integer count, int pageNumber, int pageSize){
		System.out.println("is model");
		
		boolean dining_dateNotNull = !"".equals(dining_date) && dining_date != null;
		boolean dining_timeNotNull = !"".equals(dining_time) && dining_time != null;
		boolean dining_placeNotNull = !"".equals(dining_place) && dining_place != null;
		boolean countNotNull = !"".equals(count) && count != null;
		
		String sql = " from (select dm.person_id person_id,dm.person_type, ds.dinning_stand_name,dm.count,ds.dining_date,ds.dining_place,ds.dining_time from  cf_dining_management dm,cf_dining_stand ds where dm.dining_id=ds.id) dn,cf_guest_infor gi where dn.person_id=gi.id and dn.person_type=1";
		if(dining_dateNotNull)
			sql += " and dn.dining_date like '%"+dining_date+"%'";
		if(dining_timeNotNull)
			sql += " and dn.dining_time like '%"+dining_time+"%'";
		if(dining_placeNotNull)
			sql += " and dn.dining_place like '%"+dining_place+"%'";
		if(countNotNull)
			sql += " and dn.count='"+count+"'";
		System.out.println(sql);
		return GMDao.paginate(pageNumber, pageSize, "select *", sql);
	
	}
	
	public Page<GuestDiningModel> getGuestList(String chinese_name, String english_name, String ch_organ_name, String post, String national, String is_bind_DiningStand, int pageNumber, int pageSize){
		System.out.println("is DiningSet");
		
		boolean chinese_nameNotNull = !"".equals(chinese_name) && chinese_name != null;
		boolean english_nameNotNull = !"".equals(english_name) && english_name != null;
		boolean ch_organ_nameNotNull = !"".equals(ch_organ_name) && ch_organ_name != null;
		boolean postNotNull = !"".equals(post) && post != null;
		boolean nationalNotNull = !"".equals(national) && national != null;
		boolean is_bind_DiningStandNotNull = !"".equals(is_bind_DiningStand) && is_bind_DiningStand != null;
		
		String sql = " from cf_guest_infor cgi where 1=1";
		if(chinese_nameNotNull)
			sql += " and cgi.chinese_name like '%"+chinese_name+"%'";
		if(english_nameNotNull)
			sql += " and cgi.english_name like '%"+english_name+"%'";
		if(ch_organ_nameNotNull)
			sql += " and cgi.ch_organ_name like '%"+ch_organ_name+"%'";
		if(postNotNull)
			sql += " and cgi.post like '%"+post+"%'";
		if(nationalNotNull)
			sql += " and cgi.national like '%"+national+"%'";
		if(is_bind_DiningStandNotNull){
			if("0".equals(is_bind_DiningStand)){
				sql += " and cgi.is_bind_DiningStand = 0";
			} else{
				sql += "and cgi.is_bind_DiningStand = 1";
			}
		}
		System.out.println(sql);
		return GMDao.paginate(pageNumber, pageSize, "select *", sql);
	
	}
	
}
