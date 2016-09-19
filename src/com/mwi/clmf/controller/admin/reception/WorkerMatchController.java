package com.mwi.clmf.controller.admin.reception;

import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.CountryModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTypeModel;
import com.mwi.clmf.model.reception.ReceptionModel;
import com.mwi.clmf.model.reception.ReceptionStadardModel;
import com.mwi.clmf.model.staff.WorkerGroupModel;
import com.mwi.clmf.model.staff.WorkerInforModel;
import com.mwi.clmf.service.admin.staff.WokerInforService;

public class WorkerMatchController extends Controller{
	public void index(){
		int pageNumber = getParaToInt("pageNumber") == null ? 1 : getParaToInt("pageNumber");
		int pageSize = getParaToInt("pageSize") == null ? 10 : getParaToInt("pageSize");
		int flag = getParaToInt("flag") == null ? 1 : getParaToInt("flag");
		
		//------------------嘉宾page
		String chineseName = getPara("chineseName");
		String englishName = getPara("englishName");
		String phone = getPara("phone");
		String isMatched = getPara("isMatched");
		String post = getPara("post");
		String national = getPara("national");
		String guestType = getPara("guestType");
		String receptionId = getPara("receptionId");
		
		String realName = getPara("realName");
		String groupId = getPara("groupId");
		String workingStatus = getPara("workingStatus");
		String unit = getPara("unit");
		String groupName = getPara("groupName");
		
		
		//工作人员
		Page<WorkerInforModel> workerPage = WorkerInforModel.wiDao.workerList4Match(pageNumber, pageSize, realName, groupName, workingStatus, "1", post, unit);
		Page<WorkerInforModel> supporterPage = WorkerInforModel.wiDao.workerList4Match(pageNumber, pageSize, realName, groupName, workingStatus, "2", post, unit);
		
		List<WorkerInforModel> workerList = workerPage.getList();
		for(int j=0; j<workerList.size(); j++){
			workerList.get(j).put("guestList", GuestInforModel.guestDao.guestListByWorkerId(workerList.get(j).getLong("workerId")));
		}
		
		List<WorkerInforModel> supporterList = supporterPage.getList();
		for(int k=0; k<supporterList.size(); k++){
			supporterList.get(k).put("guestList", GuestInforModel.guestDao.guestListByWorkerId(supporterList.get(k).getLong("workerId")));
		}
		
		
		
		//嘉宾
		Page<GuestInforModel> guestPage = GuestInforModel.guestDao.guestInfro4Match(pageNumber, pageSize, chineseName, englishName, phone, isMatched, post, national, guestType, receptionId);
		List<GuestInforModel> guestList = guestPage.getList();
		
		for (int i = 0; i < guestList.size(); i++) {
			guestList.get(i).put("workerList", WorkerInforModel.wiDao.getWorkerByGuestId(guestList.get(i).getLong("guestId"), "1"));
			guestList.get(i).put("supporterList", WorkerInforModel.wiDao.getWorkerByGuestId(guestList.get(i).getLong("guestId"), "2"));
			guestList.get(i).put("receptionList", ReceptionModel.rDao.receptionList(guestList.get(i).getLong("guestId")));
		}
		
		setAttr("groupList", WorkerGroupModel.wgDao.groupList());
		
		setAttr("realName", realName);
		setAttr("groupId", groupId);
		setAttr("workingStatus", workingStatus);
		setAttr("unit", unit);
		setAttr("groupName", groupName);
		
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("phone", phone);
		setAttr("isMatched", isMatched);
		setAttr("post", post);
		setAttr("national", national);
		setAttr("guestType", guestType);
		setAttr("receptionId", receptionId);
		
		setAttr("flag", flag);
		
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("guestTotalPage", guestPage.getTotalPage());
		setAttr("workeTotalPage", workerPage.getTotalPage());
		setAttr("supporterTotalPage", supporterPage.getTotalPage());
		
		setAttr("count", guestPage.getTotalRow());
		setAttr("workerCount", workerPage.getTotalRow());
		setAttr("supporterCount", supporterPage.getTotalRow());
		
		setAttr("guestPage", guestPage);
		setAttr("workerPage", workerPage);
		setAttr("supporterPage", supporterPage);
		
		setAttr("guestTypeList", GuestTypeModel.guestTypeDao.getGuestTypeList());
		setAttr("receptionList", ReceptionStadardModel.rsDao.receptionStadardList());
		setAttr("allCountry", CountryModel.cDao.countryList());
		
		
		render("mwi_reception_personalMatching.jsp");
	}
	
	public void toMatch(){
		render("personalMatch_modal.jsp");
	}
	
	public void toMatchIframe(){
		int pageNumber = getParaToInt("pageNumber") == null ? 1 : getParaToInt("pageNumber");
		int pageSize = getParaToInt("pageSize") == null ? 10 : getParaToInt("pageSize");
		
		String post = "";
		String unit = "";
		
		String wRealName = getPara("w.realName");
		String wWorkingStatus = getPara("w.workingStatus");
		String wGroupName = getPara("w.groupName");
		
		String sRealName = getPara("s.realName");
		String sWorkingStatus = getPara("s.workingStatus");
		String sGroupName = getPara("s.groupName");
		
		Page<WorkerInforModel> workerPage = WorkerInforModel.wiDao.workerList4Match(pageNumber, pageSize, wRealName, wGroupName, wWorkingStatus, "1", post, unit);
		Page<WorkerInforModel> supporterPage = WorkerInforModel.wiDao.workerList4Match(pageNumber, pageSize, sRealName, sGroupName, sWorkingStatus, "2", post, unit);
		
		setAttr("wRealName", wRealName);
		setAttr("wWorkingStatus", wWorkingStatus);
		setAttr("wGroupName", wGroupName);
		setAttr("sRealName", sRealName);
		setAttr("sWorkingStatus", sWorkingStatus);
		setAttr("sGroupName", sGroupName);
		setAttr("workerCount", workerPage.getTotalRow());
		setAttr("supporterCount", supporterPage.getTotalRow());
		

		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("workerTotalPage", workerPage.getTotalPage());
		setAttr("supporterTotalPage", supporterPage.getTotalPage());
		
		
		
		setAttr("workerPage", workerPage);
		setAttr("supporterPage", supporterPage);
		render("personalMatch_iframe.jsp");
	}
	
	public void matchWorker(){
		String guestIdsStr = getPara("guestIds");
		String workerIdsStr = getPara("workerIds");
		String supporterIdsStr = getPara("supporterIds");
		
		if(guestIdsStr != null && !"".equals(guestIdsStr) && workerIdsStr != null && !"".equals(workerIdsStr) && supporterIdsStr != null && !"".equals(supporterIdsStr)){
			String staffIdsStr = workerIdsStr +","+ supporterIdsStr;
			String[] guestIdsArr = guestIdsStr.split(",");
			String[] staffIdsArr = staffIdsStr.split(",");
			
			WokerInforService.wokerInforService.matchWorker(guestIdsArr, staffIdsArr);
		}
		
		redirect("/match");
	}
}






















