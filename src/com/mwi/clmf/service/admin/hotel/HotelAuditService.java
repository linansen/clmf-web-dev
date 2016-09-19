package com.mwi.clmf.service.admin.hotel;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.mwi.clmf.model.EmailTemplateModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.util.SendEmail;
import com.mwi.clmf.util.SendEmailTemplate;

public class HotelAuditService {
	
	public static final HotelAuditService haService = new HotelAuditService();
	
	public Page<HotelManagementModel> hotelAuditList(String chineseName, String englishName, Integer hotelId,Integer roomId,String auditStatus, String national,String ch_organ_name,String post, String sex, Integer currentPage, Integer currentSize){
		Page<HotelManagementModel> page = HotelManagementModel.hmDao.hotelManagementList(chineseName, englishName, hotelId, roomId, auditStatus, national, ch_organ_name, post, sex, currentPage, currentSize, " order by hm.checkin_time desc");
		System.out.println("page list :-- "+page.getList());
		return page;
	}
	
	public void hotelAudit(Long guestId, Integer is_audit, Integer is_wechat, Integer is_email){
		GuestInforModel gi = GuestInforModel.guestDao.findById(guestId);
		List list = new ArrayList();
		list.add(gi.getStr("email"));
		if(is_wechat == 1){	// 微信通知
			
		}
		if(is_email == 1){	// 邮件通知
			String content = "";
			if(is_audit == 1){	//审核通过（）
				content = "经主办方审核，由于你的住宿资料已通过审核，详细情况请联系主办方。";
			}else{
				content = "经主办方审核，由于你的住宿资料不符合主办方标准未通过审核，详细情况请联系主办方。";
			}
			String key = Long.valueOf(System.currentTimeMillis()).toString();
			SendEmail se = new SendEmail(key);
			Cache emailCache = Redis.use("emailList");
			emailCache.set(key+"toMail", list);
			emailCache.set(key+"subject", "审核结果");
			emailCache.set(key+"content", content);
			emailCache.set(key+"filePath", "");
			se.start();
		}
	}
	
	public HotelManagementModel getHotelInfo(Long guestId){
		return HotelManagementModel.hmDao.getHotelByGuestId(guestId);
	}
	
	public boolean deleteHotelManagement(Long hmId){
		return HotelManagementModel.hmDao.deleteHotel(hmId);
	}

}
