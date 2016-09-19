package com.mwi.clmf.model.activity;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class ActivityCheckReportModel extends Model<ActivityCheckReportModel> {

	public static final ActivityCheckReportModel amDao = new ActivityCheckReportModel();
	
	public Page<ActivityCheckReportModel> getGuestCheck(int pageNumber, int pageSize, Long standRuleId, String entryThema, String entryDate, String entryTime, String entryAddress){
		String sqlprefix = "select acm.*, acrs.*, gi.*";
		String sqlSurfix = " from cf_activity_check_report acm, cf_activity_check_rule_standard acrs, cf_guest_infor gi where gi.id = acm.person_id and acm.check_rule_id = acrs.id and acm.person_type = 1";
		
		boolean standRuleIdNotNull = !"".equals(standRuleId) && standRuleId != null;
		boolean entryThemaNotNull = !"".equals(entryThema) && entryThema != null;
		boolean entryDateNotNull = !"".equals(entryDate) && entryDate != null;
		boolean entryTimeNotNull = !"".equals(entryTime) && entryTime != null;
		boolean entryAddressNotNull = !"".equals(entryAddress) && entryAddress != null;
		
		if(standRuleIdNotNull){
			sqlSurfix = sqlSurfix + " and acrs.id = "+standRuleId;
		}
		
		if(entryThemaNotNull){
			System.out.println("11111111111111111");
			sqlSurfix = sqlSurfix + " and acrs.entry_thema like '%"+entryThema+"%'";
		}
		
		if(entryDateNotNull){
			sqlSurfix = sqlSurfix + " and acrs.entry_date = '"+entryDate+"'";
		}
		
		if(entryTimeNotNull){
			sqlSurfix = sqlSurfix + " and acrs.entry_time = '"+entryTime+"'";
		}
		
		if(entryAddressNotNull){
			sqlSurfix = sqlSurfix + " and acrs.entry_address like '%"+entryAddress+"%'";
		}
		
		return amDao.paginate(pageNumber, pageSize, sqlprefix, sqlSurfix);
	}
	
	public Page<ActivityCheckReportModel> getWorkerCheck(int pageNumber, int pageSize, Long standRuleId, String entryThema, String entryDate, String entryTime, String entryAddress, String workerType){
		String sqlprefix = "select acm.*, acrs.*, wi.*";
		String sqlsurfix = " from cf_activity_check_report acm, cf_activity_check_rule_standard acrs, cf_worker_infor wi where wi.id = acm.person_id and acm.check_rule_id = acrs.id and acm.person_type = 2 and wi.worker_type = "+workerType;
		
		boolean standRuleIdNotNull = !"".equals(standRuleId) && standRuleId != null;
		boolean entryThemaNotNull = !"".equals(entryThema) && entryThema != null;
		boolean entryDateNotNull = !"".equals(entryDate) && entryDate != null;
		boolean entryTimeNotNull = !"".equals(entryTime) && entryTime != null;
		boolean entryAddressNotNull = !"".equals(entryAddress) && entryAddress != null;
		
		if(standRuleIdNotNull){
			sqlsurfix = sqlsurfix + " and acrs.id = "+standRuleId;
		}
		
		if(entryThemaNotNull){
			sqlsurfix = sqlsurfix + " and acrs.entry_thema like '%"+entryThema+"%'";
		}
		
		if(entryDateNotNull){
			sqlsurfix = sqlsurfix + " and acrs.entry_date = '"+entryDate+"'";
		}
		
		if(entryTimeNotNull){
			sqlsurfix = sqlsurfix + " and acrs.entry_time = '"+entryTime+"'";
		}
		
		if(entryAddressNotNull){
			sqlsurfix = sqlsurfix + " and acrs.entry_address like '%"+entryAddress+"%'";
		}
		
		return amDao.paginate(pageNumber, pageSize, sqlprefix, sqlsurfix);
	}
	
}
