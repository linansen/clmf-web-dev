package com.mwi.clmf.service.admin.staff;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import jxl.Sheet;
import jxl.Workbook;

import com.jfinal.plugin.activerecord.Page;
import com.mwi.clmf.model.ChackCardModel;
import com.mwi.clmf.model.adminUser.UserModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.reception.WorkerMatchModel;
import com.mwi.clmf.model.staff.WorkerInforModel;
import com.mwi.clmf.transaction.Tx;
import com.mwi.clmf.util.CarkMakerUtil;
import com.mwi.clmf.util.CiperUtil;
import com.mwi.clmf.util.MiscUtil;

public class WokerInforService {
	public static final WokerInforService wokerInforService = new WokerInforService();
	
	public Page<WorkerInforModel> workerList(int pageNumber, int pageSize){
		
		return WorkerInforModel.wiDao.workerList(pageNumber, pageSize);
		
	}
	
	public void matchWorker(String[] guestIdArr, String[] workerIdArr){
		
		for(int i=0; i<guestIdArr.length; i++){
			WorkerInforModel.wiDao.deletByGuestId(Long.parseLong(guestIdArr[i]));
		}
		
		for(int j=0; j<guestIdArr.length; j++){
			for(int k=0; k<workerIdArr.length; k++){
				new WorkerMatchModel().set("worker_id", workerIdArr[k]).set("guest_id", guestIdArr[j]).save();
				new WorkerInforModel().findById(workerIdArr[k]).set("working_state", "1").update();
				new GuestInforModel().findById(guestIdArr[j]).set("is_matched", "1").update();
			}
			
		}
	}
	@Tx
	public boolean importWorker(File file){
		boolean wibl = true;
		try {
			InputStream is = new FileInputStream(file);
			Workbook wb = Workbook.getWorkbook(is);
			Sheet st = wb.getSheet(0);
			int row = st.getRows();
			for(int i=4; i<row; i++){
				WorkerInforModel wi = null;
				String email = st.getCell(6,i).getContents().trim();
				String name = st.getCell(1,i).getContents().trim();
				if(email.length() > 0 && name.length() > 0){
					wi = WorkerInforModel.wiDao.getWorkerByName(name, email, "1");
					boolean bl = true;
					if(wi == null){
						wi = new WorkerInforModel();
						bl = false;
					}
					wi.set("email", email);
					wi.set("realname", name);
					String ename = st.getCell(2,i).getContents().trim();
					if(ename.length() > 0){
						wi.set("english_name", ename);
					}
					String sex = st.getCell(3,i).getContents().trim();
					if(sex.length() > 0){
						wi.set("sex", "男".equals(sex)?1:2);
					}
					String id_no = st.getCell(4,i).getContents().trim();
					if(id_no.length() > 0){
						wi.set("id_no", id_no);
					}
					String phone = st.getCell(5,i).getContents().trim();
					if(phone.length() > 0){
						wi.set("phone", phone);
					}
					String wechat_username = st.getCell(7,i).getContents().trim();
					if(wechat_username.length() > 0){
						wi.set("wechat_username", wechat_username);
					}
					String group = st.getCell(8,i).getContents().trim();
					if(group.length() > 0){
						wi.set("work_group", group);
					}
					String unit = st.getCell(9,i).getContents().trim();
					if(unit.length() > 0){
						wi.set("unit", unit);
					}
					String post = st.getCell(10,i).getContents().trim();
					if(post.length() > 0){
						wi.set("post", post);
					}
					if(bl){	//update
						wibl = wi.update();
					}else{
						wi.set("worker_type", "1").save();
						ChackCardModel cc = new ChackCardModel().set("license_num", CarkMakerUtil.createEmpCardId(wi.getLong("id"))).set("card_status", "0");
						cc.save();
						UserModel um = new UserModel().set("username", email)
											   .set("password", id_no.length() > 0 ? CiperUtil.encrypt(id_no.substring(id_no.length()-6, id_no.length())) : CiperUtil.encrypt(MiscUtil.get6pwd()))
											   .set("realname", name)
											   .set("email", email)
											   .set("status", 1);
						um.save();
						wibl = wi.set("card_id", cc.getLong("id")).set("user_id", um.getLong("id")).update();
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			wibl = false;
		}
		return wibl;
	}
	
	public boolean importVolunteer(File file){
		boolean vmbl = true;
		try {
			InputStream is = new FileInputStream(file);
			Workbook wb = Workbook.getWorkbook(is);
			Sheet st = wb.getSheet(0);
			int row = st.getRows();
			for(int i=3; i<row; i++){
				WorkerInforModel wi = null;
				String email = st.getCell(6,i).getContents().trim();
				String name = st.getCell(1,i).getContents().trim();
				if(email.length() > 0 && name.length() > 0){
					wi = WorkerInforModel.wiDao.getWorkerByName(name, email, "2");
					boolean bl = true;
					if(wi == null){
						wi = new WorkerInforModel();
						bl = false;
					}
					wi.set("email", email);
					wi.set("realname", name);
					String ename = st.getCell(2,i).getContents().trim();
					if(ename.length() > 0){
						wi.set("english_name", ename);
					}
					String sex = st.getCell(3,i).getContents().trim();
					if(sex.length() > 0){
						wi.set("sex", sex);
					}
					String id_no = st.getCell(4,i).getContents().trim();
					if(id_no.length() > 0){
						wi.set("id_no", id_no);
					}
					String phone = st.getCell(5,i).getContents().trim();
					if(phone.length() > 0){
						wi.set("phone", phone);
					}
					String wechat_username = st.getCell(7,i).getContents().trim();
					if(wechat_username.length() > 0){
						wi.set("wechat_username", wechat_username);
					}
					/*String group = st.getCell(8,i).getContents().trim();
					if(group.length() > 0){
						wi.set("group_id", group);
					}*/
					String unit = st.getCell(8,i).getContents().trim();
					if(unit.length() > 0){
						wi.set("unit", unit);
					}
					String post = st.getCell(9,i).getContents().trim();
					if(post.length() > 0){
						wi.set("post", post);
					}
					String group = st.getCell(10,i).getContents().trim();
					if(group.length() > 0){
						wi.set("work_group", group);
					}
					if(bl){	//update
						vmbl = wi.update();
					}else{
						wi.set("worker_type", "2").save();
						ChackCardModel cc = new ChackCardModel().set("id_num", CarkMakerUtil.createVolCardNum(wi.getLong("id"))).set("card_status", "0");
						cc.save();
						vmbl = wi.set("card_id", cc.getLong("id")).update();
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vmbl;
	}
	
}
