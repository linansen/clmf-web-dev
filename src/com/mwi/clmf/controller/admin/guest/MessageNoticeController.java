package com.mwi.clmf.controller.admin.guest;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.CountryModel;
import com.mwi.clmf.model.SendSmsLogModel;
import com.mwi.clmf.model.guest.GuestInforModel;

public class MessageNoticeController extends Controller {

	public void index(){
		int pageNumber = getParaToInt("pageNumber") == null ? 1 : getParaToInt("pageNumber");
		int pageSize = getParaToInt("pageSize") == null ? 10 : getParaToInt("pageSize");
		
		String chineseName = getPara("chineseName");
		String englishName = getPara("englishName");
		String post = getPara("post");
		String national = getPara("national");
		String phone = getPara("phone");
		
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("post", post);
		setAttr("national", national);
		setAttr("phone", phone);
		
		Page<GuestInforModel> guestPage = GuestInforModel.guestDao.guestList4Sms(pageNumber, pageSize, chineseName, englishName, post, national, phone);
		
		setAttr("guestPage", guestPage);
		setAttr("country", CountryModel.cDao.countryList());
		setAttr("count", guestPage.getTotalRow());
		
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("totalPage", guestPage.getTotalPage());
		
		
		render("mwi_guestInteraction_message.jsp");
	}
	
	public void sendSms(){
		String mobile = getPara(0);
		Long guestId = getParaToLong(1);
		String title = getPara("message_title");
		String content = getPara("message_content");
		String sendResult = "";
		
		System.out.println(mobile+title+content);
		/**
		new SendSmsLogModel().set("to_guest_id", guestId)
							.set("sms_content", content)
							.set("is_success", "1")
							.set("send_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())).save();
		*/
		redirect("/messageNotice");
	}
	
	public void batchSendSms(){
		String guestIdsStr = getPara("guestIds");
		String mobileNos = getPara("mobileNos");
		String[] guestIds = guestIdsStr.split(",");
		
		String title = getPara("message_title");
		String content = getPara("message_content");
		/**
		for(int i=0; i<guestIds.length; i++){
			new SendSmsLogModel().set("to_guest_id", guestIds[i])
			.set("sms_content", content)
			.set("is_success", "1")
			.set("send_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())).save();
		}
		*/
		redirect("/messageNotice");
	}
	
}













