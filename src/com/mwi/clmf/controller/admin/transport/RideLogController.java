package com.mwi.clmf.controller.admin.transport;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.transport.RideLogModel;
import com.mwi.clmf.service.admin.transport.RideLogService;

public class RideLogController extends Controller{
	
	public void index(){
		String rideDate = getPara("select_date");
		Long routeId = getParaToLong("select_route_id");
		Integer ridSeq = getParaToInt("select_rid_seq");
		String guestName = getPara("select_guest_name");
		int pageNumber = 1;
		int pageSize = 10;
		
		
		if(!"".equals(getPara("pageSize")) && getPara("pageSize") != null){
			pageSize = getParaToInt("pageSize");
		}
		
		if(!"".equals(getPara("pageNumber")) && getPara("pageNumber") != null){
			pageNumber = getParaToInt("pageNumber");
		}
		
		
		Page<RideLogModel> pageList = RideLogService.rideLogService.getRideLogList(pageNumber, pageSize, rideDate, routeId, ridSeq, guestName);
		
		
		setAttr("rideDate", rideDate);
		setAttr("routeId", routeId);
		setAttr("ridSeq", ridSeq);
		setAttr("guestName", guestName);
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("totalPage", pageList.getTotalPage());
		
		setAttr("pageList", pageList);
		setAttr("routeList", RouteModel.rDao.routeList());
		setCookie("111", "iscookie", 20);
		render("mwi_riding_log.jsp");
	}
}
