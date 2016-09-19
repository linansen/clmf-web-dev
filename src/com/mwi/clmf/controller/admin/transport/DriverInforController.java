package com.mwi.clmf.controller.admin.transport;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.Cookie;

import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
import com.mwi.clmf.model.transport.DriverInforModel;
import com.mwi.clmf.service.admin.transport.CarInforService;
import com.mwi.clmf.service.admin.transport.DriverInforService;
import com.mwi.clmf.util.Validator;

public class DriverInforController extends Controller {

	public void index(){
		
	}
	
	public void getList(){
		String driver_no = Validator.isNull(getPara("driver_no")) ? null : getPara("driver_no");
		String driver_name = Validator.isNull(getPara("driver_name")) ? null : getPara("driver_name");
		String phone_num = Validator.isNull(getPara("phone_num")) ? null : getPara("phone_num");
		String id_num = Validator.isNull(getPara("id_num")) ? null : getPara("id_num");
		String driving_type = Validator.isNull(getPara("driving_type")) ? null : getPara("driving_type");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		setAttr("pageList", DriverInforService.diService.getDriverList(driver_no, driver_name, phone_num, id_num, driving_type, currentPage, currentSize));
		setAttr("driver_no", driver_no);
		setAttr("driver_name", driver_name);
		setAttr("phone_num", phone_num);
		setAttr("id_num", id_num);
		setAttr("driving_type", driving_type);
		render("mwi_trafficInfo_driverInfo.jsp");
	}
	
	public void getDriverInfor(){
		Long driverId = getParaToLong("driverId");
		setAttr("driverInfor", DriverInforModel.diDao.findById(driverId));
		render("");
	}
	
	public void update(){
		boolean bl = DriverInforService.diService.updateDriverInfor(getModel(DriverInforModel.class, "driverInfor"));
		System.out.println("update driver infor:-- "+bl);
		Cookie cookie = new Cookie("editCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/driverInfo/getList");
	}
	
	public void add(){
		boolean bl = DriverInforService.diService.addDriverInfor(getModel(DriverInforModel.class, "driverInfor"));
		System.out.println("add driver infor:-- "+bl);
		Cookie cookie = new Cookie("addCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/driverInfo/getList");
	}
	
	public void delete(){
		Long driverId = getParaToLong("driverId");
		boolean bl = DriverInforService.diService.deleteDriver(driverId);
		System.out.println("del driver:-- "+bl);
		Cookie cookie = new Cookie("delCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/driverInfo/getList");
	}
	
	public void batchDel(){
		String driverId = getPara("driverId");
		driverId = driverId.substring(0, driverId.length() - 1);
		boolean bl = DriverInforService.diService.batchDelDriver(driverId);
		System.out.println("batch del driver:-- "+bl);
		Cookie cookie = new Cookie("delCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/driverInfo/getList");
	}
	
	public void downloadTemplate(){
		String path = PathKit.getWebRootPath()+"/template/driver_info_template.xls";
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
	
	public void importDriver(){
		UploadFile uf = getFile("file", "UTF-8");
		if(uf != null){
			boolean bl = CarInforService.ciService.importCar(uf.getFile());
			Cookie cookie = new Cookie("importCode", bl ? "1" : "0");
			getResponse().addCookie(cookie);
		}
	}
	
	
}
