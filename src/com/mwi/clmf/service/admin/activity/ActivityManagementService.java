package com.mwi.clmf.service.admin.activity;

import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.guest.GuestInforModel;

public class ActivityManagementService {
	public static final ActivityManagementService activityManagementService = new ActivityManagementService();
	
	public Page<GuestInforModel> guestWithActivityManagement(int pageNumber, int pageSize, String chineseName, String englishName, Long routeId, String routeAuditStatus, String post, String national, String selectDate){
		Page<GuestInforModel> guestPage = GuestInforModel.guestDao.guestWithActivityManagement(pageNumber, pageSize, chineseName, englishName, post, national);
		List<GuestInforModel> guestList = guestPage.getList();
		
		for(int i=0; i<guestList.size(); i++){
			guestList.get(i).put("routeList", ActivityManagementModel.amDao.getRouteList(guestList.get(i).getLong("id"), routeId, routeAuditStatus, selectDate));
		}
				
		return guestPage;
		
	}
	
	public boolean auditRoute(String[] guestIdArr, String[] routeIdArr){
		boolean auditSuc = false;
		
		for(int k=0; k<guestIdArr.length; k++){
			ActivityManagementModel.amDao.delByGuestId(guestIdArr[k]);
		}
		
		for(int i=0; i<guestIdArr.length; i++){
			for(int j=0; j<routeIdArr.length; j++){
				auditSuc = new ActivityManagementModel().set("route_id", routeIdArr[j]).set("guest_id", guestIdArr[i]).set("route_audit_status", "1").save();
			}
		}
		return auditSuc;
	}
}
