package com.mwi.clmf.model.transport;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class DriverInforModel extends Model<DriverInforModel> {
	
	public static final DriverInforModel diDao = new DriverInforModel();
	
	public Page<DriverInforModel> pageList(String driver_no, String driver_name, String phone_num, String id_num, String driving_type, Integer currentPage, Integer currentSize, String sort){
		String sql = "from cf_driver_infor where 1=1";
		if(driver_no != null)
			sql += " and driver_no like '%"+driver_no+"%'";
		if(driver_name != null)
			sql += " and driver_name like '%"+driver_name+"%'";
		if(phone_num != null)
			sql += " and phone_num like '%"+phone_num+"%'";
		if(id_num != null)
			sql += " and id_num like '%"+id_num+"%'";
		if(driving_type != null)
			sql += " and driving_type='"+driving_type+"'";
		sql += sort;	//" order by create_time desc"
		return diDao.paginate(currentPage, currentSize, "select * ", sql);
	}
	
	public boolean delete(Long driverId){
		int num = Db.update("delete from cf_driver_infor where id=?",driverId);
		return num == 1 ? true :false;
	}

	public boolean batchDel(String driverId){
		int num = Db.update("delete from cf_driver_infor where id in ("+driverId+")");
		return num > 0 ? true :false;
	}
	
}
