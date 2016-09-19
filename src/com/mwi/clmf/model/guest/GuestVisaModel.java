package com.mwi.clmf.model.guest;

import com.jfinal.plugin.activerecord.Model;
/**
 * 嘉宾签证信息
 * @author sw
 *
 */
@SuppressWarnings("serial")
public class GuestVisaModel extends Model<GuestVisaModel> {
	
	public static final GuestVisaModel guestVisaDao = new GuestVisaModel();
	
	public GuestVisaModel getGuestVisa(Long guestId){
		return guestVisaDao.findFirst("select * from cf_guest_visa where guest_id=?",guestId);
	}

}
