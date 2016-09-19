package com.mwi.clmf.model.activity;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;


@SuppressWarnings("serial")
public class ActivityCheckModel extends Model<ActivityCheckModel>{
	public static final ActivityCheckModel acDao = new ActivityCheckModel();
	
	public List<ActivityCheckModel> getActivityCheckListByGuestId(Long personId, String personType){
		String sql = null;
		String baseSql = "select * from cf_activity_check_management acm, cf_activity_check_rule_standard acrs, cf_guest_infor gi, cf_worker_infor wi where 1=1";
		String condition1 = " and acm.check_checkRuleStandard_id = acrs.id";
		String condition2 = " and acm.person_type = '"+personType+"'";
		String condition3 = " and acm.person_id = gi.id";
		String condition4 = " and acm.person_id = wi.id";
		String condition5 = " and gi.id = "+personId;
		String condition6 = " and wi.id = "+personId;
		String groupBy = " GROUP BY check_checkRuleStandard_id";
		
		if("1".equals(personType)){
			sql = baseSql + condition1 + condition2 + condition3 + condition5 + groupBy;
		}
		
		if ("2".equals(personType)) {
			sql = baseSql + condition1 + condition2 + condition4 + condition6 + groupBy;
		}
		
		return acDao.find(sql);
	}
	
	public boolean deleteCheckStandard(String personType, Long personId){
		boolean delSuc = false;
		int num = Db.update("delete from cf_activity_check_management where person_type = '"+personType+"' and person_id = "+personId);
		
		if(num != 0){
			delSuc = true;
		}
		
		return delSuc;
	}
	
	
}

