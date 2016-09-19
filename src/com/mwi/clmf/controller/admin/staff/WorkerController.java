package com.mwi.clmf.controller.admin.staff;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.http.Cookie;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.mwi.clmf.model.staff.WorkerInforModel;
import com.mwi.clmf.service.admin.staff.WokerInforService;

public class WorkerController extends Controller {
	
	public void index(){
		String realname = getPara("realname");
		String work_group = getPara("work_group");
		System.out.println(work_group);
		String unit = getPara("unit");
		String post = getPara("post");
		String skill = getPara("skill");
		String id_no = getPara("id_no");
		String phone = getPara("phone");
		String wechat_username = getPara("wechat_username");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		
		Page<WorkerInforModel> pageList= WorkerInforModel.wiDao.getWorkerList(realname, work_group, unit, post, skill,id_no, phone,wechat_username,currentPage, currentSize,1);
		
		setAttr("workerList",pageList);
		setAttr("currentPage", currentPage);
		setAttr("currentSize", currentSize);
		setAttr("realname", realname);
		setAttr("work_group", work_group);
		setAttr("unit", unit);
		setAttr("post", post);
		setAttr("skill", skill);
		setAttr("id_no", id_no);
		setAttr("phone", phone);
		
		render("mwi_personnel_staffInfo.jsp");
	}
	
	
	public void save(){
		String realname = getPara("realname");
		String id_no = getPara("id_no");
		String sex = getPara("sex");
		String phone = getPara("phone");
		String email = getPara("email");
		String wechat_username = getPara("wechat_username");
		String unit = getPara("unit");
		String post = getPara("post");
		String skill = getPara("skill");
		
		new WorkerInforModel().
				set("realname", realname).
				set("id_no", id_no).
				set("sex", sex).
				set("phone", phone).
				set("email", email).
				set("wechat_username", wechat_username).
				set("unit", unit).
				set("post", post).
				set("skill", skill).
				set("working_state", 0).
				set("groupping_state", 0).
				set("worker_type", 1).
				set("is_bind_checkStand", 0).
				set("is_bind_DiningStand", 0).save();
		redirect("/staff");
	}
	
	public void update(){
		String wOId=getPara("wOId");
		String realname = getPara("realname");
		String id_no = getPara("id_no");
		String sex = getPara("sex");
		String phone = getPara("phone");
		String email = getPara("email");
		String wechat_username = getPara("wechat_username");
		String unit = getPara("unit");
		String post = getPara("post");
		String skill = getPara("skill");
		
		new WorkerInforModel().findById(wOId).
				set("realname", realname).
				set("id_no", id_no).
				set("sex", sex).
				set("phone", phone).
				set("email", email).
				set("wechat_username", wechat_username).
				set("unit", unit).
				set("post", post).
				set("skill", skill).
				set("working_state", 0).
				set("groupping_state", 0).
				set("worker_type", 1).
				set("is_bind_checkStand", 0).
				set("is_bind_DiningStand", 0).update();
		redirect("/staff");
	}
	
	public void findBywoId(){
		renderJson("staff",new WorkerInforModel().findById(getPara()));
	}
	
	public void deleteBywoId(){
		new WorkerInforModel().deleteById(getPara());
		redirect("/staff");
	}
	
	public void bathdelStaff(){
		String staffId = getPara("staffId");
		String[] staffIds = staffId.split(",");
		for(int i=0; i<staffIds.length; i++){
			new WorkerInforModel().deleteById(staffIds[i]);
		}
		redirect("/staff");
	}
	
	public void importWorker(){
		UploadFile uf = getFile("file", "UTF-8");
		boolean bl = WokerInforService.wokerInforService.importWorker(uf.getFile());
		Cookie cookie = new Cookie("responseCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		render("mwi_personnel_staffInfo.jsp");
	}
	
	public void uploadTemplate(){
		String path = PathKit.getWebRootPath()+"/template/worker_info_template.xls";
		try{
			File file = new File(path);
			String filename = file.getName();
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
}
