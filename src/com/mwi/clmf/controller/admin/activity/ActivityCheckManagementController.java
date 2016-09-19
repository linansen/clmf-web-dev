package com.mwi.clmf.controller.admin.activity;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.activity.ActivityCheckRuleStandardModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.staff.WorkerInforModel;
import com.mwi.clmf.service.admin.activity.ActivityCheckManagementService;

public class ActivityCheckManagementController extends Controller {
	public void index(){
		int pageNumber = 1;
		int pageSize = 10;
		String flag = "1";
		if(getPara("flag") != null && !"".equals((getPara("flag").trim()))){
			flag = getPara("flag");
		}
		
		if(getParaToInt("pageNumber") != null){
			pageNumber = getParaToInt("pageNumber");
		}
		
		if(getParaToInt("pageSize") != null){
			pageSize = getParaToInt("pageSize");
		}
		
		
		String chineseName = getPara("chineseName");
		String englishName = getPara("englishName");
		String post = getPara("post");
		String national = getPara("national");
		String is_bind_activityCheckStandard = getPara("is_bind_activityCheckStandard");
		String ch_organ_name = getPara("ch_organ_name");
		
		String realName = getPara("realName");
		String sex = getPara("sex");
		String unit = getPara("unit");
		String workerPost = getPara("workerPost");
		String groupName = getPara("groupName");
		String isBind = getPara("isBind");
		
		Page<GuestInforModel> guestPage = ActivityCheckManagementService.activityCheckManagementService.getGuestWithCheckStandard(pageNumber, pageSize, chineseName, englishName, post, national, is_bind_activityCheckStandard, ch_organ_name);
		Page<WorkerInforModel> workerPage = ActivityCheckManagementService.activityCheckManagementService.getWorkerWithCheckStandard(pageNumber, pageSize, "1", realName, sex, unit, workerPost, groupName, isBind);
		Page<WorkerInforModel> supporterPage = ActivityCheckManagementService.activityCheckManagementService.getWorkerWithCheckStandard(pageNumber, pageSize, "2", realName, sex, unit, workerPost, groupName, isBind);
				
				
		setAttr("flag", flag);
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("post", post);
		setAttr("national", national);
		setAttr("is_bind_activityCheckStandard", is_bind_activityCheckStandard);
		setAttr("ch_organ_name", ch_organ_name);
		
		setAttr("realName", realName);
		setAttr("sex", sex);
		setAttr("unit", unit);
		setAttr("workerPost", workerPost);
		setAttr("groupName", groupName);
		setAttr("isBind", isBind);
		
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("guestTotalPage", guestPage.getTotalPage());
		setAttr("workerTotalPage", workerPage.getTotalPage());
		setAttr("supporterTotalPage", supporterPage.getTotalPage());

		setAttr("guestCount", guestPage.getList().size());
		setAttr("workerCount", workerPage.getList().size());
		setAttr("supporterCount", supporterPage.getList().size());
		
		setAttr("checkRuleList", ActivityCheckRuleStandardModel.acrsDao.checkRuleList());
		setAttr("guestWithActivityCheckList", guestPage);
		setAttr("workerWithActivityCheckList", workerPage);
		setAttr("supporterWithActivityCheckList", supporterPage);
		render("mwi_activity_rights_management.jsp");
	}
	
	public void addCheckRule(){
		getModel(ActivityCheckRuleStandardModel.class, "checkRuleModel").save();
		redirect("/activity_check_manage");
	}
	
	public void toUpdateCheckRule(){
		renderJson("check_rule_standard", ActivityCheckRuleStandardModel.acrsDao.findById(getPara()));
	}
	
	public void updateCheckRule(){
		getModel(ActivityCheckRuleStandardModel.class, "editCheckRuleStand").update();
		redirect("/activity_check_manage");
	}
	
	public void deleteCheckRule(){
		new ActivityCheckRuleStandardModel().deleteById(getPara());
		redirect("/activity_check_manage");
	}
	
	
	public void updateCheckStandard(){
		String personType = getPara("reset_person_type");
		String personId = getPara("reset_person_id");
		String[] personIdArr = personId.split(",");
		String[] standardRuleIdArr = getParaValues("standardRuleId");
		
		String flag = "1";
		if(getPara("flag") != null && !"".equals((getPara("flag").trim()))){
			flag = getPara("flag");
		}
		System.out.println(flag);
		setAttr("flag", flag);
		boolean typeNotNull = personType != null && !"".equals(personType.trim());
		boolean personIdNotNull = personId != null && !"".equals(personId.trim());
		boolean standardIdNotNull = standardRuleIdArr != null;
		if(typeNotNull && personIdNotNull && standardIdNotNull){
			ActivityCheckManagementService.activityCheckManagementService.updateCheckStandard(personType, personIdArr, standardRuleIdArr);
		}
		
		redirect("/activity_check_manage?flag="+flag);
	}
	
}








