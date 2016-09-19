package com.mwi.clmf.controller.admin.activity;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.service.admin.activity.ActivityManagementService;

public class ActivityManagementController extends Controller{
	
	public void index(){
		int pageNumber = 1;
		int pageSize = 10;
		
		if(getParaToInt("pageNumber") != null){
			pageNumber = getParaToInt("pageNumber");
		}
		
		if(getParaToInt("pageSize") != null){
			pageSize = getParaToInt("pageSize");
		}
		
		String chineseName = getPara("chineseName");
		String englishName = getPara("englishName");
		Long routeId = getParaToLong("routeId");
		String routeAuditStatus = getPara("routeAuditStatus");
		String post = getPara("post");
		String national = getPara("national");
		String selectDate = getPara("selectDate");
		
		Page<GuestInforModel> guestPage = ActivityManagementService.activityManagementService.guestWithActivityManagement(pageNumber, pageSize, chineseName, englishName, routeId, routeAuditStatus, post, national, selectDate);
		
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("totalPage", guestPage.getTotalPage());
		
		
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("routeId", routeId);
		setAttr("routeAuditStatus", routeAuditStatus);
		setAttr("post", post);
		setAttr("national", national);
		setAttr("selectDate", selectDate);
		
		setAttr("count", guestPage.getList().size());
		setAttr("guestRouteList", guestPage);
		setAttr("onlyRouteList", RouteModel.rDao.routeList());
		setAttr("routeList", RouteModel.rDao.routeList());
		
		
		render("mwi_registration_management.jsp");
	}
	
	public void auditRoute(){
		String[] guestIdArr = null;
		if(getParaValuesToLong("audit_guestId") != null && getParaValuesToLong("audit_guestId").length != 0){
			guestIdArr = getParaValues("audit_guestId");
		} else {
			guestIdArr = getPara("guestIds").split(",");
		}
		
		String r1 = getPara("audit_routeId1");
		String r2 = getPara("audit_routeId2");
		String[] routeIdArr = {r1, r2};
		ActivityManagementService.activityManagementService.auditRoute(guestIdArr, routeIdArr);
		redirect("/activity_signup");
	}
	
}
