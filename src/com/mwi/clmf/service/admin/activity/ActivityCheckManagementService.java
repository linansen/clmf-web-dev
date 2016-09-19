package com.mwi.clmf.service.admin.activity;

import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.activity.ActivityCheckModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.staff.WorkerInforModel;

public class ActivityCheckManagementService {
	public static final ActivityCheckManagementService activityCheckManagementService = new ActivityCheckManagementService();
		
	public Page<GuestInforModel> getGuestWithCheckStandard(int pageNumber, int pageSize, String chineseName, String englishName, String post, String national, String is_bind_activityCheckStandard, String ch_organ_name){
		Page<GuestInforModel> guestPageList = GuestInforModel.guestDao.guestWithActivityCheckRule(pageNumber, pageSize, chineseName, englishName, post, national, is_bind_activityCheckStandard, ch_organ_name);
		List<GuestInforModel> guestList = guestPageList.getList();
		for(int i=0; i<guestList.size(); i++){
			guestList.get(i).put("acitivityCheckList", ActivityCheckModel.acDao.getActivityCheckListByGuestId(guestList.get(i).getLong("id"), "1"));
		}
		return guestPageList;
	}
	
	public Page<WorkerInforModel> getWorkerWithCheckStandard(int pageNumber, int pageSize, String workerType, String realName, String sex, String unit, String post, String groupName, String isBind){
		Page<WorkerInforModel> workerPageList = WorkerInforModel.wiDao.workerWithCheckRuleList(pageNumber, pageSize, workerType, realName, sex, unit, post, groupName, isBind);
		List<WorkerInforModel> workerList = workerPageList.getList();
		for(int i=0; i<workerList.size(); i++){
			workerList.get(i).put("acitivityCheckList", ActivityCheckModel.acDao.getActivityCheckListByGuestId(workerList.get(i).getLong("workerId"), "2"));
		}
		return workerPageList;
		
	}
	
	public boolean updateCheckStandard(String personType, String[] personIdArr, String[] standardRuleIdArr){
		boolean updateSuc = false;
		for(int k=0; k<personIdArr.length; k++){
			ActivityCheckModel.acDao.deleteCheckStandard(personType, Long.valueOf(personIdArr[k]));
		}
		
		for(int j=0; j<personIdArr.length; j++){
			for(int i=0; i<standardRuleIdArr.length; i++){
				updateSuc = new ActivityCheckModel().set("person_type", personType).set("person_id", Long.valueOf(personIdArr[j])).set("check_checkRuleStandard_id", standardRuleIdArr[i]).save();
				if("1".equals(personType)){
					new GuestInforModel().findById(personIdArr[j]).set("is_bind_activityCheckStandard", 1).update();
				} else {
					new WorkerInforModel().findById(personIdArr[j]).set("is_bind_checkStand", 1).update();
				}
				
			}
		}
		
		return updateSuc;
	}
	
}







