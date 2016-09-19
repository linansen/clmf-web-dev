package com.mwi.clmf.service.admin.activity;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.activity.RouteModel;

public class RouteService {
	public static final RouteService routeService = new RouteService();
	
	public Page<RouteModel> routeList(int pageNumber, int pageSize, Long routeId, String selectDate){
		return RouteModel.rDao.routePageList(pageNumber, pageSize, routeId, selectDate);
	}
}
