package com.mwi.clmf.controller.front;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.interceptor.FrontInterceptor;
import com.mwi.clmf.model.InvateMsgModel;
import com.mwi.clmf.model.guest.GuestInforModel;

public class InviteMsgController extends Controller {

	@Clear
	public void index(){
		
	}
	
	//收到邀约历史

	@Clear
	@Before(FrontInterceptor.class)
	public void getInvite(){
		Long guestId = getSessionAttr("guestId");
		int pageNumber = 1;
		int pageSize = 10;
		
		String invateGuestName = getPara("invateGuestName");
		String invateGuestOrgan = getPara("invateGuestOrgan");
		String invateGuestPost = getPara("invateGuestPost");
		
		setAttr("invateGuestName", invateGuestName);
		setAttr("invateGuestOrgan", invateGuestOrgan);
		setAttr("invateGuestPost", invateGuestPost);
		
		Page<InvateMsgModel> imPage = InvateMsgModel.imDao.getInviteHistory(pageNumber, pageSize, guestId, invateGuestName, invateGuestOrgan, invateGuestPost);
		setAttr("getInviteHistory", imPage);
		render("getInvite.jsp");
	}
	
	//发出邀约历史

	@Clear
	@Before(FrontInterceptor.class)
	public void sendedInvite(){
		Long guestId = getSessionAttr("guestId");
		int pageNumber = 1;
		int pageSize = 10;
		
		String invateGuestName = getPara("invateGuestName");
		String invateGuestOrgan = getPara("invateGuestOrgan");
		String invateGuestPost = getPara("invateGuestPost");
		
		setAttr("invateGuestName", invateGuestName);
		setAttr("invateGuestOrgan", invateGuestOrgan);
		setAttr("invateGuestPost", invateGuestPost);
		
		Page<InvateMsgModel> sihList = InvateMsgModel.imDao.sentInviteHistory(pageNumber, pageSize, guestId, invateGuestName, invateGuestOrgan, invateGuestPost);
		
		setAttr("sentInviteHistory", sihList);
		render("sendedInvite.jsp");
	}
	
	
	
	//发送邀约人列表

	@Clear
	@Before(FrontInterceptor.class)
	public void sendInvite(){
		Long guestId = getSessionAttr("guestId");
		Integer pageNumber = getParaToInt("pageNumber") == null ? 1 : getParaToInt("pageNumber");
		Integer pageSize = getParaToInt("pageSize") == null ? 10 : getParaToInt("pageSize");
		String chineseName = getPara("chineseName");
		String organName = getPara("organName");
		String post = getPara("post");
		
		
		setAttr("pageNumber", pageNumber);
		setAttr("pageSize", pageSize);
		setAttr("totalPage", GuestInforModel.guestDao.guestInviteList(pageNumber, pageSize, chineseName, organName, post).getTotalPage());
		setAttr("chineseName", chineseName);
		setAttr("organName", organName);
		setAttr("post", post);
		
		
		setAttr("me", GuestInforModel.guestDao.findById(guestId));
		setAttr("guestList4Invite", GuestInforModel.guestDao.guestInviteList(pageNumber, pageSize, chineseName, organName, post));
		render("sendInvite.jsp");
	}
	
	/**
	 * 发送邀请
	 */

	@Clear
	@Before(FrontInterceptor.class)
	public void sentInvite(){
		InvateMsgModel inv = getModel(InvateMsgModel.class, "invite");
		inv.set("send_time", new SimpleDateFormat("YYYY-MM-dd").format(new Date(System.currentTimeMillis())));
		inv.set("success_status", "2");
		inv.set("reply_status", "2");
		inv.save();
		redirect("/invite/sendInvite");
	}
	
	/**
	 * 回复邀请
	 */

	@Clear
	@Before(FrontInterceptor.class)
	public void replyInvite(){
		Long inviteId = getParaToLong();
		String isAccept = getPara("isAccept");
		String replyMsg = getPara("replyMsg");
		
		boolean suc = new InvateMsgModel().findById(inviteId).set("success_status", isAccept).set("reply_msg", replyMsg).set("reply_status", isAccept).update();
		if(suc){
			renderJson("status", "1");
		} else {
			renderJson("status", "2");
		}
	}
	
	/**
	 * 取消邀请
	 */

	@Clear
	@Before(FrontInterceptor.class)
	public void cancelInvite(){
		Long inviteId = getParaToLong();
		boolean suc = new InvateMsgModel().findById(inviteId).set("success_status", "3").update();
		if(suc){
			renderJson("status", "1");
		} else {
			renderJson("status", "2");
		}
	}
	
	
}
