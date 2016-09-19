package com.mwi.clmf.controller.admin.guest;

import com.jfinal.core.Controller;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTypeModel;

public class GuestTypeController extends Controller {
	public void index(){
		
	}
	
	public void save(){
		boolean saveSuc = getModel(GuestTypeModel.class, "gType").save();
		redirect("/reception");
	}
	
	public void findById(){
		Long id = getParaToLong();
		renderJson("guestType", GuestTypeModel.guestTypeDao.findById(id));
	}
	
	public void update(){
		boolean updateSuc = getModel(GuestTypeModel.class, "edit_gType").update();
		redirect("/reception");
	}
	
	public void delete(){
		Long id = getParaToLong();
		System.out.println(id);
		boolean delSuc = false;
		boolean isNull = GuestInforModel.guestDao.findByGuestType(id);
		System.out.println(isNull);
		if(isNull){
			delSuc = GuestTypeModel.guestTypeDao.deleteById(id);
			redirect("/reception");
		} else {
			redirect("/reception");
		}
	}
	
}
