package com.mwi.clmf.model.activity;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;


@SuppressWarnings("serial")
public class RouteModel extends Model<RouteModel>{
	
	public static final RouteModel rDao = new RouteModel();
	
	public Page<RouteModel> routePageList(int pageNumber, int pageSize, Long routeId, String selectDate){
		String sqlPrefix = "select *";
		String sqlSurfix = " from cf_route where 1=1";
		if(routeId != null && !"".equals(routeId.toString().trim())){
			sqlSurfix = sqlSurfix + " and id = "+routeId;
		}
		
		if(selectDate != null && !"".equals(selectDate.trim())){
			sqlSurfix = sqlSurfix + " and route_start_time <= '"+selectDate+"' and route_end_time >= '"+selectDate+"'";
		}
		
		return rDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public List<RouteModel> routeList(){
		return rDao.find("select id, route_nicName, route_name, route_content, route_start_time, route_end_time, limit_num, regist_num, batch from cf_route");
	}
	
	public List<RouteModel> getRouteByGuestId(Long guestId){
		return rDao.find("select * from cf_route where id in (select route_id from cf_activity_management where guest_id=?)",guestId);
	}
	
	public RouteModel getRouteByName(String name){
		return rDao.findFirst("select * from cf_route where route_nicName like '%"+name+"%'");
	}
}
