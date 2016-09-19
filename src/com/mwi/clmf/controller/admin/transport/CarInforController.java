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
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.mwi.clmf.model.transport.CarInforModel;
import com.mwi.clmf.service.admin.transport.CarInforService;
import com.mwi.clmf.util.Validator;

public class CarInforController extends Controller {

	public void index(){
		
	}
	
	public void getList(){
		String car_no = Validator.isNull(getPara("car_no")) ? null : getPara("car_no");
		String car_num = Validator.isNull(getPara("car_num")) ? null : getPara("car_num");
		String car_category = Validator.isNull(getPara("car_category")) ? null : getPara("car_category");
		String car_model = Validator.isNull(getPara("car_model")) ? null : getPara("car_model");
		String seat_num = Validator.isNull(getPara("seat_num")) ? null : getPara("seat_num");
		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");
		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");
		
		Page<CarInforModel> pageList = CarInforService.ciService.getCarList(car_no, car_num, car_category, car_model, seat_num, currentPage, currentSize);
//		List<CarInforModel> list = pageList.getList();
//		for (CarInforModel li : list) {
//			
//		}
		
		setAttr("pageList", pageList);
		setAttr("car_no", car_no);
		setAttr("car_num", car_num);
		setAttr("car_category", car_category);
		setAttr("car_model", car_model);
		setAttr("seat_num", seat_num);
		render("mwi_trafficInfo_verticalInfo.jsp");
	}
	
//	public void getCarInfor(){
//		Long carId = getParaToLong("carId");
//		setAttr("carInfor", CarInforModel.ciDao.findById(carId));
//		render("");
//	}
	
	public void update(){
		boolean bl = CarInforService.ciService.updateCarInfor(getModel(CarInforModel.class, "carInfor"));
		System.out.println("update carinfor:-- "+bl);
		Cookie cookie = new Cookie("editCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/carInfor/getList");
	}
	
	public void add(){
		boolean bl = getModel(CarInforModel.class, "carInfor").save();
		System.out.println("save carinfor:-- "+bl);
		Cookie cookie = new Cookie("addCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/carInfor/getList");
	}
	
	public void delete(){
		Long carId = getParaToLong("carId");
		boolean bl = CarInforService.ciService.deleteCar(carId);
		System.out.println("del car:-- "+bl);
		Cookie cookie = new Cookie("delCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/carInfor/getList");
	}
	
	public void batchDel(){
		String carId = getPara("carId");
		carId = carId.substring(0, carId.length() - 1);
		boolean bl = CarInforService.ciService.batchDel(carId);
		System.out.println("batchDel car:-- "+bl);
		Cookie cookie = new Cookie("delCode", bl ? "1" : "0");
		getResponse().addCookie(cookie);
		redirect("/carInfor/getList");
	}
	
	public void downLoadTemplate(){
		String path = PathKit.getWebRootPath()+"/template/car_info_template.xls";
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
	
	
	public void importCarInfo(){
		UploadFile uf = getFile("file", "UTF-8");
		if(uf != null){
			boolean bl = CarInforService.ciService.importCar(uf.getFile());
			Cookie cookie = new Cookie("importCode", bl ? "1" : "0");
			getResponse().addCookie(cookie);
		}
	}
	
}
