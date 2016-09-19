package com.mwi.clmf.model.reception;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class ReceptionStadardModel extends Model<ReceptionStadardModel>{
	public static final ReceptionStadardModel rsDao = new ReceptionStadardModel();
	
	public List<ReceptionStadardModel> getStandardByGuestId(Long guestId){
		return rsDao.find("SELECT rsm.id, rsm.reception_stand_id, rs.stand_name, rs.description from cf_reception_standard_management rsm, cf_reception_standard rs, cf_guest_infor gi WHERE rsm.reception_stand_id = rs.id and gi.id = ?", guestId);
	}
	 
	public List<ReceptionStadardModel> receptionStadardList(){
		return rsDao.find("select * from cf_reception_standard order by id");
	}
}
