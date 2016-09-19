package com.mwi.clmf.controller.admin.guest;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
import com.mwi.clmf.model.ChackCardModel;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.hotel.HotelInforModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.service.admin.guest.GuestInputService;
import com.mwi.clmf.util.CarkMakerUtil;
import com.mwi.clmf.util.CiperUtil;
import com.mwi.clmf.util.MiscUtil;

public class GuestInputController extends Controller {

	/**
	 * 嘉宾管理--嘉宾录入
	 */
	public void index(){
		setAttr("routeList", RouteModel.rDao.routeList());
		setAttr("hotelList", HotelInforModel.hiDao.hotelList());
		render("mwi_info_add_with_Excel.jsp");
	}
	
	/**
	 * 嘉宾管理--嘉宾录入--普通录入
	 */
	public void guestInput(){
		// 嘉宾基本信息
		GuestInforModel gi = getModel(GuestInforModel.class,"guestInfo");
		ChackCardModel cc = new ChackCardModel().set("license_num", CarkMakerUtil.createGuestCardId(gi.getLong("id"))).set("card_status", "0");
		cc.save();
		boolean bl1 = gi.set("password", CiperUtil.encrypt(MiscUtil.get6pwd())).set("username", gi.getStr("email")).set("card_id", cc.getLong("id"))
						.set("audit_status", 1).save();
		// 嘉宾行程安排
		GuestTripModel gt = getModel(GuestTripModel.class,"guestTrip");
		boolean bl2 = gt.set("guest_id", gi.getLong("id"))
						.set("arrival_status", 1)
						.set("create_time",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())).save();
		// 嘉宾住宿安排
		HotelManagementModel hm = getModel(HotelManagementModel.class, "hotel");
		boolean bl3 = hm.set("guest_id", gi.getLong("id")).set("status", 1).save();
		// 嘉宾路线选择
		Long[] routeId = getParaValuesToLong("routeId");
		boolean bl4 = false;
		for (int i = 0; i < routeId.length; i++) {
			bl4 = GuestInputService.giService.guestInput(gi.getLong("id"), routeId[i]);
		}
		System.out.println("guest input:-- "+bl1+" -- bl2 -- "+bl2+" -- bl3 -- "+bl3+" -- bl4 -- "+bl4);
		Cookie cookie = new Cookie("responseMsg", bl1 && bl2 && bl3 && bl4 ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/guestInput");
	}
	
	/**
	 * 嘉宾管理--嘉宾录入--Excel导入
	 */
	public void guestImport(){
		UploadFile uf = getFile("file", "UTF-8");
		List<GuestInforModel> giList = GuestInputService.giService.guestImport(uf.getFile());
		setAttr("guestList", giList);
		Cookie cookie = new Cookie("responseCode", giList.size() > 0 ? "1" : "0");
		getResponse().addCookie(cookie);
		render("mwi_info_add_with_Excel.jsp");
	}
	
	/**
	 * 下载嘉宾信息模板
	 */
	public void downloadTemplate(){
		String path = PathKit.getWebRootPath()+"/template/guest_info_template.xls";
		try{
			File file = new File(path);
			String filename = file.getName();
			//String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
			InputStream fis = new BufferedInputStream(new FileInputStream(path));
			byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
	        // 设置输出的格式
	        getResponse().reset();
	        getResponse().addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
	        getResponse().addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(getResponse().getOutputStream());
            getResponse().setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void checkRoommate(){
		String passportNo = getPara("passportNo");
		GuestInforModel gi = GuestInforModel.guestDao.getGuestByPassportNo(passportNo);
		boolean bl = false;
		if(gi == null)
			bl = false;
		else
			bl = true;
		renderJson(bl);
	}
}
