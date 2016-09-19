package com.mwi.clmf.model.guest;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;


@SuppressWarnings("serial")
public class GuestTypeModel extends Model<GuestTypeModel> {

	public static final GuestTypeModel guestTypeDao = new GuestTypeModel();
	
	public List<GuestTypeModel> getGuestTypeList(){
		return guestTypeDao.find("select * from cf_guest_type order by id");
	}
	
	
}
