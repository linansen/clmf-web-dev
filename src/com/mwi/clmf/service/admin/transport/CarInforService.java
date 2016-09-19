package com.mwi.clmf.service.admin.transport;

import java.io.File;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.transport.CarInforModel;

public class CarInforService {

	public static final CarInforService ciService = new CarInforService();
	
	public Page<CarInforModel> getCarList(String car_no, String car_num, String car_category, String car_model, String seat_num, Integer currentPage, Integer currentSize){
		return CarInforModel.ciDao.pageCarList(car_no, car_num, car_category, car_model, seat_num, currentPage, currentSize, " order by create_time desc");
	}
	
	public boolean updateCarInfor(CarInforModel ci){
		return ci.update();
	}
	
	public boolean deleteCar(Long carId){
		return CarInforModel.ciDao.delete(carId);
	}
	
	public boolean batchDel(String str){
		return CarInforModel.ciDao.batchDel(str);
	}
	
	public boolean importCar(File file){
		System.out.println("car info import! ");
		return true;
	}
}
