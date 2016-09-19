package com.mwi.clmf.controller.admin.staff;

import com.jfinal.core.Controller;
import com.mwi.clmf.model.staff.WorkerInforModel;
import com.mwi.clmf.service.admin.staff.WokerInforService;

public class SupporterController extends Controller {
	
	public void index(){
		int pageNumber = 1;
		int pageSize = 10;
		setAttr("supporterList", WokerInforService.wokerInforService.workerList(pageNumber, pageSize));
		
		render("");
	}
	
	public void update(){
		getModel(WorkerInforModel.class, "wi").update();
		redirect("");
	}
	
	public void delete(){
		new WorkerInforModel().deleteById(getPara("id"));
		redirect("");
	}
	
	public void batchDelete(){
		new WorkerInforModel().deleteById((Object)getParaValues("ids"));
		redirect("");
	}
}
