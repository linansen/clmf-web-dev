package com.mwi.clmf.service.admin.reception;

import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.reception.ReceptionModel;
import com.mwi.clmf.model.reception.ReceptionStadardModel;



public class ReceptionService{
	public static final ReceptionService receptionService = new ReceptionService();
	
	public boolean addReceptionStandard(ReceptionStadardModel rsm){
		return rsm.save();
	}
	
	public List<ReceptionStadardModel> receptionStadardList(){
		return ReceptionStadardModel.rsDao.receptionStadardList();
	}
	
	public Page<GuestInforModel> receptionList(int pageNumber, int pageSize, String chineseName, String englishName, String guestType, String national, String post, String standardId, String isBindReceptionStard, String bindGuestType){
		Page<GuestInforModel> guestPage = GuestInforModel.guestDao.guestListWithType(pageNumber, pageSize, chineseName, englishName, guestType, national, post, standardId, isBindReceptionStard, bindGuestType);
		
		List<GuestInforModel> guestList = guestPage.getList();
		
		for(int i=0; i<guestList.size(); i++){
			guestList.get(i).put("receptionList", ReceptionModel.rDao.receptionList(guestList.get(i).getLong("guestId")));
		}
		
		return guestPage;
	}
	
	public void setGuestReceptionStand(Long guestId, String[] receptionArr){
		ReceptionModel.rDao.delByGuestId(guestId);
		for(int i=0; i<receptionArr.length; i++){
			new ReceptionModel().set("reception_stand_id", receptionArr[i]).set("guest_id", guestId).save();
		}
		new GuestInforModel().findById(guestId).set("is_bind_receptionStandard", "1").update();
		
	}
	
	public void batchSetGuestReceptionStand(String[] guestIdArr, String[] receptionArr){
		for(int i=0; i<guestIdArr.length; i++){
			ReceptionModel.rDao.delByGuestId(Long.valueOf(guestIdArr[i]));
		}
		
		for(int j=0; j<guestIdArr.length; j++){
			for(int k=0; k<receptionArr.length; k++){
				new ReceptionModel().set("reception_stand_id", receptionArr[k]).set("guest_id", Long.valueOf(guestIdArr[j])).save();
			}
			new GuestInforModel().findById(guestIdArr[j]).set("is_bind_receptionStandard", "1").update();
		}
	}

}
