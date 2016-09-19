package com.mwi.clmf.controller.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;

import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.meeting.NewCategoryModel;
import com.mwi.clmf.model.meeting.NewsModel;
import com.mwi.clmf.model.meeting.VisitorFileModel;
import com.mwi.clmf.util.SendEmail;

public class FrontIndexController extends Controller{
	@Clear
	public void index(){
		setAttr("catList", NewCategoryModel.NCDao.getCategoryList());
		setAttr("guestInfor", GuestInforModel.guestDao.getGuest());
		render("index.jsp");
	}
	
	@Clear
	public void news(){
		String categoryId = getPara("categoryId");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		
		Page<NewsModel> pageList = NewsModel.nDao.getNewsList(categoryId, currentPage, currentSize);
		setAttr("pageList", pageList);
		render("dialog_bwn_person.jsp");
	}

	public void findByNewsId(){
		setAttr("news", NewsModel.nDao.findById(getPara()));
		render("newDeatil.jsp");
	}
	@Clear
	public void visitorDownload(){
		setAttr("visitorFile", VisitorFileModel.fuDao.guestFileList());
		render("download_modal.jsp");
	}
	
	@Clear
	public void contactUs(){
		String name = getPara("name");
		String email = getPara("email");
		String message = getPara("message");
		boolean bl = false;
		try{
			List list = new ArrayList();
			list.add("guizhouluntan@chinanews.com.cn");
			String key = Long.valueOf(System.currentTimeMillis()).toString();
			SendEmail se = new SendEmail(key);
			Cache emailCache = Redis.use("emailList");
			emailCache.set(key+"toMail", list);
			emailCache.set(key+"subject", "Contact Us");
			emailCache.set(key+"content", "姓名："+name+" 邮箱："+email+" Contact Us Msg:"+ message);
			emailCache.set(key+"filePath", "");
			se.start();
			bl = true;
		}catch(Exception e){
			e.printStackTrace();
			bl = false;
		}
		Cookie cookie = new Cookie("responseCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/front_index/");
	}
	
}
