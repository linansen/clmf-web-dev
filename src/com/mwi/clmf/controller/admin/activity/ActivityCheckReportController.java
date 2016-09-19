package com.mwi.clmf.controller.admin.activity;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.activity.ActivityCheckModel;
import com.mwi.clmf.model.activity.ActivityCheckReportModel;
import com.mwi.clmf.model.activity.ActivityCheckRuleStandardModel;

public class ActivityCheckReportController extends Controller{
	
	
	public void index(){
		String flag = "1";
		int pageNumber = 1;
		int pageSize = 10;
		
		if(getParaToInt("pageNumber") != null){
			pageNumber = getParaToInt("pageNumber");
		}
		
		if(getParaToInt("pageSize") != null){
			pageSize = getParaToInt("pageSize");
		}
		
		
		Long standRuleId = getParaToLong("standRuleId");
		String entryThema = getPara("entryThema");
		String entryDate = getPara("entryDate");
		String entryTime = getPara("entryTime");
		String entryAddress = getPara("entryAddress");
		
		if(!"".equals(getPara("flag")) && getPara("flag") != null){
			flag = getPara("flag");
		}
		
		Page<ActivityCheckReportModel> guestPage = ActivityCheckReportModel.amDao.getGuestCheck(pageNumber, pageSize, standRuleId, entryThema, entryDate, entryTime, entryAddress);
		Page<ActivityCheckReportModel> workerPage = ActivityCheckReportModel.amDao.getWorkerCheck(pageNumber, pageSize, standRuleId, entryThema, entryDate, entryTime, entryAddress, "1");
		Page<ActivityCheckReportModel> supportPage = ActivityCheckReportModel.amDao.getWorkerCheck(pageNumber, pageSize, standRuleId, entryThema, entryDate, entryTime, entryAddress, "2");
		
		setAttr("flag", flag);
		
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("entryAddress", entryAddress);
		setAttr("entryTime", entryTime);
		setAttr("entryDate", entryDate);
		setAttr("entryThema", entryThema);
		setAttr("standRuleId", standRuleId);
		
		setAttr("guestTotalPage", guestPage.getTotalPage());
		setAttr("workerTotalPage", workerPage.getTotalPage());
		setAttr("supporterTotalPage", supportPage.getTotalPage());
		
		setAttr("guestList", guestPage);
		setAttr("workerList", workerPage);
		setAttr("supportList", supportPage);
		setAttr("checkRuleStand", ActivityCheckRuleStandardModel.acrsDao.checkRuleList());
		
		render("mwi_activityManangement_signIn_toll.jsp");
	}
	
}
