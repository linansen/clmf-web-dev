package com.mwi.clmf.controller.admin.reception;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.reception.ReceptionModel;
import com.mwi.clmf.model.reception.ReceptionStadardModel;
import com.mwi.clmf.service.admin.guest.GuestTypeService;
import com.mwi.clmf.service.admin.reception.ReceptionService;

public class ReceptionController extends Controller{
	public void index(){
		int pageNumber = getParaToInt("pageNumber") == null ? 1 : getParaToInt("pageNumber");
		int pageSize = getParaToInt("pageSize") == null ? 10 : getParaToInt("pageSize");
		
		String chineseName = getPara("chineseName"); 
		String englishName = getPara("englishName");
		String guestType = getPara("guestType");
		String national = getPara("national");
		String post = getPara("post");
		String standardId = getPara("standardId");
		String isBindReceptionStard = getPara("isBindReceptionStard");
		String bindGuestType = getPara("bindGuestType");
		
		Page<GuestInforModel> pageList = ReceptionService.receptionService.receptionList(pageNumber, pageSize, chineseName, englishName, guestType, national, post, standardId, isBindReceptionStard, bindGuestType);
		
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("guestType", guestType);
		setAttr("national", national);
		setAttr("post", post);
		setAttr("standardId", standardId);
		setAttr("isBindReceptionStard", isBindReceptionStard);
		setAttr("bindGuestType", bindGuestType);
		setAttr("count", pageList.getTotalRow());
		
		
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("totalPage", pageList.getTotalPage());
		
		
		setAttr("receptionStandList", ReceptionService.receptionService.receptionStadardList());
		setAttr("getGuestTypeList", GuestTypeService.guestTypeService.getGuestTypeList());
		setAttr("guestWithreceptionList", pageList);
		render("mwi_guest_reception_arrange.jsp");
	}
	
	public void addReceptionStandard(){
		System.out.println("---------------------------------------------");
		ReceptionStadardModel rsm = getModel(ReceptionStadardModel.class, "reception_standard");
		ReceptionService.receptionService.addReceptionStandard(rsm);
		redirect("/reception");
	}
	
	public void findStandardById(){
		renderJson("reception_standard", ReceptionStadardModel.rsDao.findById(getPara()));
	}
	
	public void updateReceptionStandard(){
		getModel(ReceptionStadardModel.class, "upadteRs").update();
		redirect("/reception");
	}
	
	public void deleteReceptionStandard(){
		boolean isbind = ReceptionModel.rDao.isBindStandard(getParaToLong());
		if(isbind){
			new ReceptionStadardModel().deleteById(getParaToLong());
		}
		
		redirect("/reception");
	}
	
	public void setGuestType(){
		Long guestId = getParaToLong(0);
		Long guestTypeId = getParaToLong(1);
		
		GuestTypeService.guestTypeService.setGuestType(guestId, guestTypeId);
		redirect("/reception");
	}
	
	public void batchSetGuestType(){
		String guestIdArrStr = getPara(0);
		String[] guestIdArr = guestIdArrStr.split(",");
		String guestTypeId = getPara(1);
		
		GuestTypeService.guestTypeService.batchSetGuestType(guestIdArr, guestTypeId);
		redirect("/reception");
	}
	
	public void setGuestReceptionStand(){
		ReceptionService.receptionService.setGuestReceptionStand(getParaToLong(), getParaValues("set.receptionId"));
		redirect("/reception");
	}
	
	public void batchSetGuestReceptionStand(){
		String guestIdArrStr = getPara("reception.guestIds");
		String[] guestIdArr = guestIdArrStr.split(",");
		ReceptionService.receptionService.batchSetGuestReceptionStand(guestIdArr, getParaValues("set.receptionIds"));
		redirect("/reception");
	}
}









