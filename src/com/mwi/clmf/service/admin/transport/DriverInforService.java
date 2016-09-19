package com.mwi.clmf.service.admin.transport;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.transport.DriverInforModel;

public class DriverInforService {
	
	public static final DriverInforService diService = new DriverInforService();
		
	public Page<DriverInforModel> getDriverList(String driver_no, String driver_name, String phone_num, String id_num, String driving_type, Integer currentPage, Integer currentSize){
		return DriverInforModel.diDao.pageList(driver_no, driver_name, phone_num, id_num, driving_type, currentPage, currentSize, " order by create_time desc");
	}
	
	public boolean updateDriverInfor(DriverInforModel di){
		return di.update();
	}
	
	public boolean addDriverInfor(DriverInforModel di){
		return di.set("create_time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())).save();
	}
	
	public boolean deleteDriver(Long driverId){
		return DriverInforModel.diDao.delete(driverId);
	}

	public boolean batchDelDriver(String driverId){
		return DriverInforModel.diDao.batchDel(driverId);
	}
}
