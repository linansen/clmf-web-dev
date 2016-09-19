package com.mwi.clmf.controller.admin.activity;

import com.jfinal.core.Controller;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.service.admin.activity.RouteService;

public class RouteController extends Controller{
	public void index(){
		int pageNumber = 1;
		int pageSize = 10;
		
		if(getParaToInt("pageNumber") != null){
			pageNumber = getParaToInt("pageNumber");
		}
		
		if(getParaToInt("pageSize") != null){
			pageSize = getParaToInt("pageSize");
		}
		
		Long routeId = getParaToLong("selectRoute");
		String selectDate = getPara("selectDate");
		
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("totalPage", RouteService.routeService.routeList(pageNumber, pageSize, routeId, selectDate).getTotalPage());
		
		setAttr("selectDate", selectDate);
		setAttr("selectRouteId", routeId);
		setAttr("routeList", RouteService.routeService.routeList(pageNumber, pageSize, routeId, selectDate));
		setAttr("onlyRouteList", RouteModel.rDao.routeList());
		render("mwi_activityManagement_routeSetting.jsp");
	}
	
	
	public void findById(){
		System.out.println(getPara());
		renderJson("routeInfo", RouteModel.rDao.findById(getPara()));
	}
	
	public void update(){
		String id = getPara("edit.id");
		if(id == null || "".equals(id.trim())){
			getModel(RouteModel.class, "edit").save();
		} else {
			getModel(RouteModel.class, "edit").update();
		}
		redirect("/route");
	}
	
	public void delete(){
		if(ActivityManagementModel.amDao.findByRouteId(getParaToLong())){
			new RouteModel().deleteById(getPara());
		}
		redirect("/route");
	}
	
	public void batchDelete(){
		new RouteModel().deleteById((Object)getParaValues("routeIds"));
		redirect("/route");
	}
}
