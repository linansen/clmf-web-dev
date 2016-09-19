package com.mwi.clmf.service.admin.guest;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.mwi.clmf.model.ChackCardModel;
import com.mwi.clmf.model.EmailTemplateModel;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.guest.GuestVisaModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.transaction.Tx;
import com.mwi.clmf.util.CarkMakerUtil;
import com.mwi.clmf.util.CiperUtil;
import com.mwi.clmf.util.MD5HashUtil;
import com.mwi.clmf.util.MiscUtil;
import com.mwi.clmf.util.SendEmail;
import com.mwi.clmf.util.SendEmailTemplate;

public class GuestAuditService {
	
	public static final GuestAuditService gaService = new GuestAuditService();
	
	public Page<GuestInforModel> guestList(String chineseName,
			String englishName, String national, String passportNo,
			String post, String mobile, String email, String sex, String auditStatus,
			int currentPage, int currentSize) {
		Page<GuestInforModel> pageList = GuestInforModel.guestDao.getList(chineseName, englishName,
				passportNo, null, null, null, national, post, mobile, email,
				sex, auditStatus, currentPage, currentSize);
		List<GuestInforModel> list = pageList.getList();
		if(list.size() > 0){
			for (GuestInforModel li : list) {
				li.put("guestVisa", GuestVisaModel.guestVisaDao.getGuestVisa(li.getLong("id")));
				li.put("guestActivity", ActivityManagementModel.amDao.getList(li.getLong("id")));
				li.put("hotel",HotelManagementModel.hmDao.getHotelByGuestId(li.getLong("id")));
				li.put("guestTrip", GuestTripModel.guestTripDao.getTripByGuestId(li.getLong("id")));
			}
		}
		return pageList;
	}
	
	@Tx
	public boolean auditGuest(Long guestId,Integer status, String useLanguage, String refuse_reson, Integer isSentEmail){
		GuestInforModel gi = new GuestInforModel().findById(guestId);
		String password =  MiscUtil.get6pwd();
		ChackCardModel cc = new ChackCardModel().set("id_num", CarkMakerUtil.createGuestCardId(guestId)).set("card_status", "0");
		cc.save();
		boolean bl = gi.set("audit_status", status).set("refuse_reson", refuse_reson).set("password", CiperUtil.encrypt(password)).set("card_id", cc.getLong("id")).update();
		if(bl){
			if(isSentEmail == 1){	//发送邮件通知
				String email = gi.getStr("email");
				List list = new ArrayList();
				list.add(email);
				if("1".equals(useLanguage)){	//中文模板
					if(status == 1){	//审核通过（模板发送确认函）
						String key = Long.valueOf(System.currentTimeMillis()).toString();
						SendEmailTemplate se = new SendEmailTemplate(key);
						Cache emailCache = Redis.use("emailList");
						emailCache.set(key+"toMail", list);
						EmailTemplateModel et = EmailTemplateModel.etDao.findById(2);	//确认函
						emailCache.set(key+"subject", et.getStr("template_name"));
						emailCache.set(key+"content", et.getStr("template_content"));
						emailCache.set(key+"filePath", "");
						emailCache.set(key+"password", password);
						se.start();
					}else if(status == 2){	//拒绝，可以补充资料
						String key = Long.valueOf(System.currentTimeMillis()).toString();
						SendEmail se = new SendEmail(key);
						Cache emailCache = Redis.use("emailList");
						emailCache.set(key+"toMail", list);
						emailCache.set(key+"subject", "审核结果");
						emailCache.set(key+"content", "经主办方审核，由于你资料不全或其他原因，无法通过审核，详细情况请联系主办方。");
						emailCache.set(key+"filePath", "");
						emailCache.set(key+"password", password);
						se.start();
					}else{	//拒绝，禁止登陆
						String key = Long.valueOf(System.currentTimeMillis()).toString();
						SendEmail se = new SendEmail(key);
						Cache emailCache = Redis.use("emailList");
						emailCache.set(key+"toMail", list);
						emailCache.set(key+"subject", "审核结果");
						emailCache.set(key+"content", "经主办方审核，本次会议无法受理您的参会申请，并且不再给您开通系统登录，详细情况请联系主办方。");
						emailCache.set(key+"filePath", "");
						se.start();
					}
				}else{	//英文模板
					String key = Long.valueOf(System.currentTimeMillis()).toString();
					SendEmail se = new SendEmail(key);
					Cache emailCache = Redis.use("emailList");
					emailCache.set(key+"toMail", list);
					emailCache.set(key+"subject", "Audit Result");
					emailCache.set(key+"content", "Audit Result！englist template！");
					emailCache.set(key+"filePath", "");
					emailCache.set(key+"password", password);
					se.start();
				}
				System.out.println("sent to:--"+email);
			}
		}
		return bl;
	}
	
	public boolean batchDel(String guestId){
		boolean bl = false;
		String[] guest = guestId.split(",");
		for (int i = 0; i < guest.length; i++) {
			bl = GuestInforModel.guestDao.updateStatus(Long.valueOf(guest[i]), "4");
		}
		return bl;
	}
	
}
