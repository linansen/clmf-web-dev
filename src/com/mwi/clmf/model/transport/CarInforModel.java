package com.mwi.clmf.model.transport;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class CarInforModel extends Model<CarInforModel> {
	
	public static final CarInforModel ciDao = new CarInforModel();
	
	public Page<CarInforModel> pageCarList(String car_no, String car_num, String car_category, String car_model, String seat_num, Integer currentPage, Integer currentSize, String sort){
		String sql = "from cf_car_infor where 1=1";
		if(car_no != null)
			sql += " and car_no like '%"+car_no+"%'";
		if(car_num != null)
			sql += " and car_num like '%"+car_num+"%'";
		if(car_category != null)
			sql += " and car_category='"+car_category+"'";
		if(car_model != null)
			sql += " and car_model='"+car_model+"'";
		if(seat_num != null)
			sql += " and seat_num="+Integer.valueOf(seat_num);
		sql += sort;	//" order by create_time desc"
		return ciDao.paginate(currentPage, currentSize, "select * ", sql);
	}
	
	public boolean delete(Long carId){
		int num = Db.update("delete from cf_car_infor where id=?",carId);
		return num == 1 ? true :false;
	}
	
	public boolean batchDel(String str){
		int num = Db.update("delete from cf_car_infor where id in ("+str+")");
		return num > 0 ? true :false;
	}

}
