package com.mwi.clmf.model.hotel;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class HotelInforModel extends Model<HotelInforModel> {

	public static final HotelInforModel hiDao = new HotelInforModel();
	
	public List<HotelInforModel> hotelList(){
		return hiDao.find("select * from cf_hotel");
	}
	
}
