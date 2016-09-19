package com.mwi.clmf.service.admin.guest;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.mwi.clmf.model.EmailTemplateModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.util.SendEmail;
import com.mwi.clmf.util.SendEmailTemplate;

public class EmailNoticeService {
	
	public static final EmailNoticeService enService = new EmailNoticeService();
	
	public Page<GuestInforModel> emailNoticeList(String chineseName, String englishName, String post, String email, String national,String had_login, String is_send_invate, Integer currentPage, Integer currentSize){
		return GuestInforModel.guestDao.guestInforList(chineseName, englishName, post, email, national, had_login, is_send_invate, currentPage, currentSize, " order by mail_count asc");
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public boolean sendEmailTemplate(String to_user, Long template, String filePath){
		boolean bl = false;
		try{
			to_user = to_user.substring(0, to_user.length()-1);
			String [] user = to_user.split(",");
			List list = new ArrayList();
			for (String str : user) {
				GuestInforModel gi = GuestInforModel.guestDao.findById(str);
				String email = gi.getStr("email");
				gi.set("is_send_invate", "1").update();
				list.add(email);
			}
			String key = Long.valueOf(System.currentTimeMillis()).toString();
			SendEmailTemplate se = new SendEmailTemplate(key);
			Cache emailCache = Redis.use("emailList");
			emailCache.set(key+"toMail", list);
			EmailTemplateModel et = EmailTemplateModel.etDao.findById(template);
			emailCache.set(key+"subject", et.getStr("template_name"));
			emailCache.set(key+"content", et.getStr("template_content"));
			if(filePath.length() > 0)
				emailCache.set(key+"filePath", filePath);
			else
				emailCache.set(key+"filePath", "");
			se.start();
			bl = true;
			System.out.println("sent to:--"+list);
		}catch(Exception e){
			bl = false;
			e.printStackTrace();
		}
		return bl;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public boolean sendEmail(String to_user, String email_title, String email_content, String filePath){
		boolean bl = false;
		try{
			to_user = to_user.substring(0, to_user.length()-1);
			String [] user = to_user.split(",");
			List list = new ArrayList();
			for (String str : user) {
				GuestInforModel gi = GuestInforModel.guestDao.findById(str);
				String email = gi.getStr("email");
				gi.set("is_send_invate", "1").update();
				list.add(email);
			}
			String key = Long.valueOf(System.currentTimeMillis()).toString();
			SendEmail se = new SendEmail(key);
			Cache emailCache = Redis.use("emailList");
			emailCache.set(key+"toMail", list);
			emailCache.set(key+"subject", email_title);
			emailCache.set(key+"content", email_content);
			if(filePath.length() > 0)
				emailCache.set(key+"filePath", filePath);
			else
				emailCache.set(key+"filePath", "");
			se.start();
			bl = true;
			System.out.println("sent to:--"+list);
		}catch(Exception e){
			bl = false;
			e.printStackTrace();
		}
		return bl;
	}
	

}
