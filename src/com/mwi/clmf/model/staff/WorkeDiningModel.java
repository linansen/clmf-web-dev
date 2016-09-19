package com.mwi.clmf.model.staff;


import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.guest.GuestDiningModel;

@SuppressWarnings("serial")
public class WorkeDiningModel extends Model<WorkeDiningModel> {
	public static final WorkeDiningModel WMDao = new WorkeDiningModel();
	
	public Page<WorkeDiningModel> getWorkerDiningList(String dining_date, String dining_time, String dining_place, Integer count, int pageNumber, int pageSize,int worker_type ){

		boolean dining_dateNotNull = !"".equals(dining_date) && dining_date != null;
		boolean dining_timeNotNull = !"".equals(dining_time) && dining_time != null;
		boolean dining_placeNotNull = !"".equals(dining_place) && dining_place != null;
		boolean countNotNull = !"".equals(count) && count != null;	
		
		String sql = "from (select dm.person_id,dm.count,dm.person_type,ds.dining_date,ds.dinning_stand_name, ds.dining_place,ds.dining_time from  cf_dining_management dm,cf_dining_stand ds where dm.dining_id=ds.id) dn,cf_worker_infor wi ,cf_group fg where dn.person_id=wi.id and dn.person_type=2";
			if(dining_dateNotNull)
			sql += " and dn.dining_date like '%"+dining_date+"%'";	
			if(dining_timeNotNull)
				sql += " and dn.dining_time like '%"+dining_time+"%'";
			if(dining_placeNotNull)
				sql += " and dn.dining_place = '"+dining_place+"'";
			if(countNotNull)
				sql += " and dn.count='"+count+"'";
			if(worker_type == 1)
				sql += " and wi.worker_type=1";
			if(worker_type == 2)
				sql += " and wi.worker_type=2";
			return WMDao.paginate(pageNumber, pageSize, "select *", sql);
	}
	
	
	public Page<WorkeDiningModel> getworkerList(String realname, String sex, String unit, String post, String group_id, String is_bind_DiningStand, int pageNumber, int pageSize, int worker_type){
		System.out.println("is DiningSet");
		
		boolean realnameNotNull = !"".equals(realname) && realname != null;
		boolean sexNotNull = !"".equals(sex) && sex != null;
		boolean unitNotNull = !"".equals(unit) && unit != null;
		boolean postNotNull = !"".equals(post) && post != null;
		boolean group_idNull = !"".equals(group_id) && group_id != null;
		boolean is_bind_DiningStandNotNull = !"".equals(is_bind_DiningStand) && is_bind_DiningStand != null;
		
		String sql = " from cf_worker_infor cwi where 1=1";
		if(realnameNotNull)
			sql += " and cwi.realname like '%"+realname+"%'";
		if(sexNotNull)
			if("1".equals(sex)){
				sql += " and cwi.sex = 1";
			} else{
				sql += "and cwi.sex = 2";
			}
		if(unitNotNull)
			sql += " and cwi.unit like '%"+unit+"%'";
		if(postNotNull)
			sql += " and cwi.post like '%"+post+"%'";
		if(group_idNull)
			sql += " and cwi.group_id= '"+group_id+"'";
		if(is_bind_DiningStandNotNull){
			if("0".equals(is_bind_DiningStand)){
				sql += " and cwi.is_bind_DiningStand = 0";
			} else{
				sql += "and cwi.is_bind_DiningStand = 1";
			}
		}
		if(worker_type==1)
			sql += " and cwi.worker_type=1";
		if(worker_type==2)
			sql += " and cwi.worker_type=2";
		System.out.println(sql);
		return WMDao.paginate(pageNumber, pageSize, "select *", sql);
	
	}
	
}
