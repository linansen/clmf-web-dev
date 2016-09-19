package com.mwi.clmf.controller.admin.hotel;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.guest.GuestDiningModel;
import com.mwi.clmf.model.staff.WorkeDiningModel;

public class DiningStandController extends Controller {
	/**
	 * 用餐标准
	 */
	public void index(){
		String dining_date = getPara("dining_date");
		System.out.println(dining_date);
		String dining_time = getPara("dining_time");
		String dining_place = getPara("dining_place");
		Integer count = getParaToInt("count");
		
		Integer pageNumber = getParaToInt("pageNumber");
		if(pageNumber == null){
			pageNumber = 1;
		}
		int pageSize = 10;
		if(!"".equals(getPara("pageSize")) && getPara("pageSize") != null){
			pageSize = getParaToInt("pageSize");
		}
		
		if(!"".equals(getPara("pageNumber")) && getPara("pageNumber") != null){
			pageNumber = getParaToInt("pageNumber");
		}
		
		
		
		String flag = "1";
		if("2".equals(getPara("flag"))){
			flag = "2";
		} else if("3".equals(getPara("flag"))) {
			flag = "3";
		} 
		setAttr("flag", flag);
		Page<GuestDiningModel> pageList = GuestDiningModel.GMDao.getGuestDiningList(dining_date,dining_time, dining_place, count, pageNumber, pageSize);
		Page<WorkeDiningModel> workerpageList=WorkeDiningModel.WMDao.getWorkerDiningList(dining_date,dining_time, dining_place, count, pageNumber, pageSize ,1);
		Page<WorkeDiningModel> postulantpageList =WorkeDiningModel.WMDao.getWorkerDiningList(dining_date, dining_time, dining_place, count, pageNumber, pageSize ,2);
		
		setAttr("guestDiningList",pageList);
		setAttr("workerDiningList",workerpageList);
		setAttr("postulantDiningList",postulantpageList);
		setAttr("pageNumber", pageNumber);
	
		setAttr("pageSize", pageSize);
		setAttr("dining_date", dining_date);
		setAttr("dining_time", dining_time);
		setAttr("dining_place", dining_place);
		setAttr("count", count);
		setAttr("totalPage", pageList.getTotalPage());
		setAttr("workertotalPage", workerpageList.getTotalPage());
		setAttr("postulanttotalPage", postulantpageList.getTotalPage());
		render("mwi_dining_management_toll.jsp");
	}
	
	
	
	public void pageList(){
		
	}
	
	
	
}
