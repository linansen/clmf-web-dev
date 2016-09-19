package com.mwi.clmf.controller.admin.guest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.mwi.clmf.model.EmailTemplateModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.service.admin.guest.EmailNoticeService;
import com.mwi.clmf.util.Validator;

public class EmailNoticeController extends Controller {

	public void index(){
		
	}
	
	/**
	 * 邮件布告
	 */
	public void getList(){
		String chineseName = Validator.isNull(getPara("chineseName")) ? null : getPara("chineseName");
		String englishName = Validator.isNull(getPara("englishName")) ? null : getPara("englishName");
		String post = Validator.isNull(getPara("post")) ? null : getPara("post");
		String email = Validator.isNull(getPara("email")) ? null : getPara("email");
		String national = Validator.isNull(getPara("national")) ? null : getPara("national");
		String had_login = Validator.isNull(getPara("had_login")) ? null : getPara("had_login");
		String is_send_invate = Validator.isNull(getPara("is_send_invate")) ? null : getPara("is_send_invate");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		Page<GuestInforModel> pageList = EmailNoticeService.enService.emailNoticeList(chineseName, englishName, post, email, national, had_login, is_send_invate, currentPage, currentSize);
		setAttr("pageList", pageList);
		setAttr("nationalList", GuestInforModel.guestDao.getGuestNational());
		setAttr("chineseName", chineseName);
		setAttr("englishName", englishName);
		setAttr("post", post);
		setAttr("email", email);
		setAttr("national", national);
		setAttr("had_login", had_login);
		setAttr("is_send_invate", is_send_invate);
		setAttr("emailTemplate", EmailTemplateModel.etDao.getList());
		render("mwi_guestInteraction_email.jsp");
	}
	
	/**
	 * 批量或单个推送邮件
	 */
	public void batchSendEmail(){
		String path = "/data/annex/";
		UploadFile uf = getFile("email_file", "UTF-8");
		String filePath = "";
		boolean sendSuc = false;
		if(uf != null){
			File source = uf.getFile();
			String uploadfileName = "annex" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + uf.getFileName();
			filePath = path + uploadfileName;
			try {
				FileInputStream fis = new FileInputStream(source);
				File targetDir = new File(path);
				if (!targetDir.exists()) {
					targetDir.mkdirs();
				}
				File target = new File(targetDir, uploadfileName);
				if (!target.exists()) {
					target.createNewFile();
				}
				FileOutputStream fos = new FileOutputStream(target);
				byte[] bts = new byte[300];
				while (fis.read(bts, 0, 300) != -1) {
					fos.write(bts, 0, 300);
				}
				fos.close();
				fis.close();
				source.delete();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String to_user = Validator.isNull(getPara("to_user")) ? null : getPara("to_user");
		String email_title = Validator.isNull(getPara("email_title")) ? null : getPara("email_title");
		String email_content = Validator.isNull(getPara("email_content")) ? null : getPara("email_content");
		Long template = getParaToLong("template");
		if(template == 0){
			sendSuc = EmailNoticeService.enService.sendEmail(to_user, email_title, email_content, filePath);
		}else{
			sendSuc = EmailNoticeService.enService.sendEmailTemplate(to_user, template, filePath);
		}
		Cookie cookie = new Cookie("responseCode", sendSuc ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/emailNotice/getList");
	}
	
}
