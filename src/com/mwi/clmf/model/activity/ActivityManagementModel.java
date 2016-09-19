package com.mwi.clmf.model.activity;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class ActivityManagementModel extends Model<ActivityManagementModel> {

	public static final ActivityManagementModel amDao = new ActivityManagementModel();
	
	public List<ActivityManagementModel> getList(Long guestId){
		return amDao.find("select * from cf_activity_management am, cf_route cr where am.route_id=cr.id and am.guest_id=?",guestId);
	}
	
	public List<ActivityManagementModel> getRouteList(Long guestId, Long routeId, String routeAuditStatus, String selectDate){
		String baseSql = "select * from cf_activity_management am, cf_route cr where am.route_id=cr.id and am.guest_id = "+guestId;
		
		if(routeId != null && !"".equals(routeId)){
			baseSql = baseSql + " and cr.id = "+routeId;
		}
		
		if(routeAuditStatus != null && !"".equals(routeAuditStatus)){
			baseSql = baseSql + " and am.route_audit_status = '"+routeAuditStatus+"'";
		}
		
		if(selectDate != null && !"".equals(selectDate)){
			baseSql = baseSql + " and cr.route_start_time >= '"+selectDate+"' and cr.route_end_time >= '"+selectDate+"'";
		}
		
		return amDao.find(baseSql);
	}
	
	public boolean delActivityByGuestId(Long guestId){
		int num = Db.update("delete from cf_activity_management where guest_id=?",guestId);
		return num > 0 ? true : false;
	}
	
	public boolean delByGuestId(String guestId){
		int num = Db.update("delete from cf_activity_management where guest_id=?",guestId);
		return num > 0 ? true : false;
	}
		
	
	public boolean findByRouteId(Long routeId){
		boolean isNull = false;
		List<ActivityManagementModel> aml = ActivityManagementModel.amDao.find("select * from cf_activity_management where route_id="+routeId);
		if(aml.size()==0){
			isNull = true;
		}
		return isNull;
	}
	
	
}