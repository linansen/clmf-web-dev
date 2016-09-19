package com.mwi.clmf.controller.front;

import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.util.CiperUtil;

public class FrontLoginController extends Controller{
	@Clear
	public void index(){
		
	}
	
	@Clear
	public void login(){
		String userEmail = getPara("user_email");
		String password = CiperUtil.encrypt(getPara("password"));
		
		GuestInforModel gi = GuestInforModel.guestDao.guestLogin(userEmail, password);
		System.out.println(gi != null);
		if(gi != null){
			String auditStatus = gi.get("audit_status");
			if("1".equals(auditStatus) || "2".equals(auditStatus) || "5".equals(auditStatus)){
				setSessionAttr("guestId", gi.getLong("id"));
				new GuestInforModel().findById(gi.getLong("id")).set("had_login", "1").update();
				redirect("/guest_infor");
			} else {
				//已删除或者未审核或者没有权限登录
				redirect("/front_index");
			}
			
		} else {
			//用户名或者密码错误
			redirect("/front_index");
		}
	}
	
	@Clear
	public void logout(){
		removeSessionAttr("guestId");
		redirect("/front_index");
	}
}
