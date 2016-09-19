package com.mwi.clmf.model.reception;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;


@SuppressWarnings("serial")
public class ReceptionModel extends Model<ReceptionModel>{
	public static final ReceptionModel rDao = new ReceptionModel();
	
	public List<ReceptionModel> receptionList(Long guestId){
		String sql = "SELECT rs.*, gi.*, rsm.* from cf_reception_standard rs, cf_guest_infor gi, cf_reception_standard_management rsm where rsm.guest_id = gi.id and rsm.reception_stand_id = rs.id";
		
		if(guestId != null && !"".equals(guestId)){
			sql = sql + " and rsm.guest_id = "+guestId;
		} 
		
		return rDao.find(sql);
	}
	
	public boolean delByGuestId(Long guestId){
		int num = Db.update("delete from cf_reception_standard_management where guest_id = ?", guestId);
		boolean delSuc = false;
		
		if(num != 0){
			delSuc = true;
		}
		
		return delSuc;
	}
	
	public boolean isBindStandard(Long standardId){
		boolean isBind = false;
		List<ReceptionModel> rm = rDao.find("SELECT * from cf_reception_standard_management where reception_stand_id = ?",standardId);
		if(rm.size() == 0){
			isBind = true;
		}
		return isBind;
	}
	
	
}




