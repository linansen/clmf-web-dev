package com.mwi.clmf.model.hotel;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class HotelRoomModel extends Model<HotelRoomModel> {
	public static final HotelRoomModel hrDao = new HotelRoomModel();
	
	public List<HotelRoomModel> roomList(){
		return hrDao.find("select * from cf_hotel_room");
	}
	
	public List<HotelRoomModel> getRoom(Long hotelId){
		return hrDao.find("select * from cf_hotel_room where hotel_id=?",hotelId);
	}
	
	public HotelRoomModel getRoom(String hotel, String roomType){
		return hrDao.findFirst("select *,hr.id room_id from cf_hotel_room hr left join cf_hotel h on hr.hotel_id=h.id where h.hotel_name='"+hotel+"' and hr.room_type_name='"+roomType+"'");
	}
	
}
