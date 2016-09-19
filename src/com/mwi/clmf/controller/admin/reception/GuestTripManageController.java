package com.mwi.clmf.controller.admin.reception;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.reception.GuestTripManageService;
import com.mwi.clmf.model.reception.ReceptionModel;
import com.mwi.clmf.model.reception.ReceptionStadardModel;
import com.mwi.clmf.model.staff.WorkerInforModel;
import com.mwi.clmf.service.admin.reception.ReceptionService;

public class GuestTripManageController extends Controller {
	public void index(){
		
		int pageNumber = getParaToInt("pageNumber") == null ? 1 : getParaToInt("pageNumber");
		int pageSize = getParaToInt("pageSize") == null ? 10 : getParaToInt("pageSize");
		int flag = getParaToInt("flag") == null ? 1 : getParaToInt("flag");
		
		String chineseName = getPara("chineseName");
		String arrivalStation = getPara("arrivalStation");
		String arrivalDate = getPara("arrivalDate");
		String arrivalTime = getPara("arrivalTime");
		String arrivalShiftNo = getPara("arrivalShiftNo");
		String leaveStation = getPara("leaveStation");
		String leaveDate = getPara("leaveDate");
		String leaveTime = getPara("leaveTime");
		String leaveShiftNo = getPara("leaveShiftNo");
		
		
		Page<GuestInforModel> guestPage = GuestInforModel.guestDao.guestInfor4Transfer(pageNumber, pageSize, chineseName, arrivalStation, arrivalDate, arrivalTime, arrivalShiftNo, leaveStation, leaveDate, leaveTime, leaveShiftNo);
		List<GuestInforModel> guestList = guestPage.getList();
		for(int i=0; i<guestList.size(); i++){
			guestList.get(i).put("workerList", WorkerInforModel.wiDao.getWorkerByGuestId(guestList.get(i).getLong("guestId"), "1"));
			guestList.get(i).put("supporterList", WorkerInforModel.wiDao.getWorkerByGuestId(guestList.get(i).getLong("guestId"), "2"));
			guestList.get(i).put("receptionList", ReceptionModel.rDao.receptionList(guestList.get(i).getLong("guestId")));
		}
		
		setAttr("chineseName", chineseName);
		setAttr("arrivalStation", arrivalStation);
		setAttr("arrivalDate", arrivalDate);
		setAttr("arrivalTime", arrivalTime);
		setAttr("arrivalShiftNo", arrivalShiftNo);
		setAttr("leaveStation", leaveStation);
		setAttr("leaveDate", leaveDate);
		setAttr("leaveTime", leaveTime);
		setAttr("leaveShiftNo", leaveShiftNo);
		setAttr("flag", flag);
		
		setAttr("count", guestPage.getTotalRow());
		
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("totalPage", guestPage.getTotalPage());
		
		setAttr("receptionList", ReceptionStadardModel.rsDao.receptionStadardList());
		setAttr("guestPage", guestPage);
		
		render("mwi_guest_reception_mannagement.jsp");
	}
	
	
	public void setGuestReceptionStand(){
		ReceptionService.receptionService.setGuestReceptionStand(getParaToLong(), getParaValues("receptionId"));
		redirect("/transfer");
	}
	
	
}
