package com.mwi.clmf.model.guest;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 嘉宾个人信息
 * 
 * @author sw
 * 
 */
@SuppressWarnings("serial")
public class GuestInforModel extends Model<GuestInforModel> {

	public static final GuestInforModel guestDao = new GuestInforModel();

	public Page<GuestInforModel> getList(String chineseName, String englishName,
			String passportNo, String arrivalDate, String arrivalTime,
			String arrivalStation, String national, String post, String mobile,
			String email, String sex, String auditStatus, int currentPage, int currentSize) {
		String sql = "from cf_guest_infor gi left join cf_guest_trip gt on gi.id=gt.guest_id where gi.audit_status != '4' and gi.audit_status != '5'";
		if(chineseName != null)
			sql += " and gi.chinese_name like '%"+chineseName+"%'";
		if(englishName != null)
			sql += " and gi.english_name like '%"+englishName+"%'";
		if(passportNo != null)
			sql += " and gi.passport_no like '%"+passportNo+"%'";
		if(arrivalDate != null)
			sql += " and gt.arrival_date='"+arrivalDate+"'";
		if(arrivalTime != null)
			sql += " and gt.arrival_time='"+arrivalTime+"'";
		if(arrivalStation != null)
			sql += " and gt.arrival_station like '%"+arrivalStation+"%'";
		if(national != null)
			sql += " and gi.national='"+national+"'";
		if(post != null)
			sql += " and gi.post like '%"+post+"%'";
		if(mobile != null)
			sql += " and gi.mobile like '%"+mobile+"%'";
		if(email != null)
			sql += " and gi.email like '%"+email+"%'";
		if(sex != null)
			sql += " and gi.sex='"+sex+"'";
		if(auditStatus != null)
			sql += " and gi.audit_status='"+auditStatus+"'";
		System.out.println("last sql:--"+sql);
		sql += " order by gt.arrival_status desc";
		return guestDao.paginate(currentPage, currentSize, "select gi.id id,gi.username userName,gi.english_name englishName,gi.chinese_name chineseName,gi.national national,gi.passport_no passportNo,gi.post post,gi.sex sex,gi.audit_status audit_status,gi.email email,gt.arrival_date arrivalDate,gt.arrival_time arrivalTime,gt.arrival_station arrivalStation,gi.card_id cardId,(select cc.card_status from cf_chack_card cc where cc.id=gi.card_id) cardStatus, gt.arrival_status arrivalStatus", sql);
	}
	
	public List<GuestInforModel> getGuestNational(){
		return guestDao.find("select distinct national from cf_guest_infor where national is not null");
	}
	
	public GuestInforModel getGuestInfor(Long guestId){
		return guestDao
				.findFirst(
						"select gi.*,gi.id gi_id,gv.id visa_id,gv.guest_id visa_guest_id,gv.group_name visa_group_name,gv.given_name given_name,gv.surname surname,gv.birth_date birth_date,gv.sex visa_sex,gv.nationality nationality,gv.organ_name organ_name,gv.post visa_post,gv.passport_no visa_passport_no,gv.passport_image_url passport_image_url,gv.passport_valid_date passport_valid_date,gv.email visa_email,gv.fax visa_fax,gv.contact_address contact_address,gv.issue_place issue_place,gv.entry_date entry_date,gv.stay_days stay_days,gv.create_time create_time,gt.*,hm.* from cf_guest_infor gi left join cf_guest_visa gv on gi.id=gv.guest_id left join cf_guest_trip gt on gi.id=gt.guest_id left join cf_hotel_management hm on gi.id=hm.guest_id where gi.id=?",
						guestId);
	}
	
	public GuestInforModel guestLogin(String userEmail, String pwd){
		return guestDao.findFirst("select * from cf_guest_infor where email=? and password=?", userEmail, pwd);
	}
	
	public List<GuestInforModel> getGuest(String guestId){
		return guestDao.find("select * from cf_guest_infor where id not in ('"+guestId+"')");
	}
	
	public Page<GuestInforModel> guestListWithType(int pageNumber, int pageSize, String chineseName, String englishName, String guestType, String national, String post, String standardId, String isBindReceptionStard, String bindGuestType){
		String sqlPrefix = "select gi.*, gi.id guestId, gt.id typeId, gt.type_name, gt.prefix, gt.desc";
		String sqlSurfix = " from cf_guest_infor gi left join cf_guest_type gt on gi.guest_type = gt.id left join cf_reception_standard_management rsm on gi.id = rsm.guest_id where 1=1";
		if(chineseName != null && !"".equals(chineseName)){
			System.out.println(chineseName);
			sqlSurfix = sqlSurfix + " and gi.chinese_name like '%"+chineseName+"%'";
		}
		
		if(englishName != null && !"".equals(englishName)){
			sqlSurfix = sqlSurfix + " and gi.english_name like '%"+englishName+"%'";
		}
		
		if(guestType != null && !"".equals(guestType)){
			sqlSurfix = sqlSurfix + " and gt.id = '"+guestType+"'";
		}
		
		if(national != null && !"".equals(national)){
			sqlSurfix = sqlSurfix + " and gi.national like '%"+national+"%'";
		}
		
		if(post != null && !"".equals(post)){
			sqlSurfix = sqlSurfix + " where gi.post like '%"+post+"%'";
		}
		
		if(standardId != null && !"".equals(standardId)){
			sqlSurfix = sqlSurfix + " and rsm.reception_stand_id = '"+standardId+"'";
		}
		
		if(isBindReceptionStard != null && !"".equals(isBindReceptionStard)){
			if("0".equals(isBindReceptionStard)){
				sqlSurfix = sqlSurfix + " and gi.is_bind_receptionStandard = '"+isBindReceptionStard+"'";
			}
		}
		
		if(bindGuestType != null && !"".equals(bindGuestType)){
			if("0".equals(bindGuestType)){
				sqlSurfix = sqlSurfix + " and gi.guest_type = '"+bindGuestType+"'";
			}
		}
		
		sqlSurfix = sqlSurfix + " group by gi.id";
		
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public Page<GuestInforModel> guestPageList(int pageNumber, int pageSize){
		String sqlPrefix = "select *";
		String sqlSurfix = " from cf_guest_infor where 1=1";
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public Page<GuestInforModel> guestInviteList(int pageNumber, int pageSize, String chineseName, String organName, String post){
		String sqlPrefix = "select *";
		String sqlSurfix = " from cf_guest_infor where 1=1";
		if(chineseName != null && !"".equals(chineseName)){
			sqlSurfix = sqlSurfix + " and chinese_name like '%"+chineseName+"%'";
		}
		
		if(organName != null && !"".equals(organName)){
			sqlSurfix = sqlSurfix + " and ch_organ_name like '%"+organName+"%'";
		}
		
		if(post != null && !"".equals(post)){
			sqlSurfix = sqlSurfix + " and post like '%"+post+"%'";
		}
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public Page<GuestInforModel> guestWithActivityCheckRule(int pageNumber, int pageSize, String chineseName, String englishName, String post, String national, String is_bind_activityCheckStandard, String ch_organ_name){
		String sqlPrefix = "select *";
		String sqlSurfix = " from cf_guest_infor gi where 1=1";
		if(chineseName != null && !"".equals(chineseName)){
			sqlSurfix = sqlSurfix + " and gi.chinese_name like '%"+chineseName+"%'";
		}
		
		if(englishName != null && !"".equals(englishName)){
			sqlSurfix = sqlSurfix + " and gi.english_name like '%"+englishName+"%'";
		}
		
		if(post != null && !"".equals(post)){
			sqlSurfix = sqlSurfix + " and gi.post like '%"+post+"%'";
		}
		
		if(national != null && !"".equals(national)){
			sqlSurfix = sqlSurfix + " and gi.national like '%"+national+"%'";
		}
		
		if(is_bind_activityCheckStandard != null && !"".equals(is_bind_activityCheckStandard)){
			sqlSurfix = sqlSurfix + " and gi.is_bind_activityCheckStandard = '"+is_bind_activityCheckStandard+"'";
		}
		
		if(ch_organ_name != null && !"".equals(ch_organ_name)){
			sqlSurfix = sqlSurfix + " and gi.ch_organ_name like '%"+ch_organ_name+"%'";
		}
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public Page<GuestInforModel> getGuestListById(int pageNumber, int pageSize, String idsStr){
		String sqlPrefix = "select *";
		String sqlSurfix = " from cf_guest_infor where id in ("+idsStr+")";
		
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public boolean updateStatus(Long guestId, String status){
		int num = Db.update("update cf_guest_infor set audit_status=? where id=?",status,guestId);
		return num == 1 ? true : false;
	}
	
	public boolean findByGuestType(Long guestTypeId){
		boolean isNull = false;
		List<GuestInforModel> list = guestDao.find("select * from cf_guest_infor where guest_type=?", guestTypeId);
		if(list.size() == 0){
			isNull = true;
		}
		return isNull;
	}
	
	public Page<GuestInforModel> guestInforList(String chineseName, String englishName, String post, String email, String national, String had_login, String is_send_invate, Integer currentPage, Integer currentSize, String sort){
		String sqlSurfix = "from cf_guest_infor where 1=1";
		if(chineseName != null)
			sqlSurfix += " and chinese_name like '%"+chineseName+"%'";
		if(englishName != null)
			sqlSurfix += " and english_name like '%"+englishName+"%'";
		if(post != null)
			sqlSurfix += " and post like '%"+post+"%'";
		if(email != null)
			sqlSurfix += " and email like '%"+email+"%'";
		if(national != null)
			sqlSurfix += " and national='"+national+"'";
		if(had_login != null)
			sqlSurfix += " and had_login='"+had_login+"'";
		if(is_send_invate != null)
			sqlSurfix += " and is_send_invate='"+is_send_invate+"'";
		sqlSurfix += sort;
		return GuestInforModel.guestDao.paginate(currentPage, currentSize, "select * ", sqlSurfix);
	}
	
	public GuestInforModel getGuestByPassportNo(String passportNo){
		return guestDao.findFirst("select * from cf_guest_infor where passport_no=?",passportNo);
	}
	
	public GuestInforModel getGuestByPassportNo(String name, String passportNo){
		return guestDao.findFirst("select * from cf_guest_infor where chinese_name=? and passport_no=?", name, passportNo);
	}
	
	public Page<GuestInforModel> guestWithActivityManagement(int pageNumber, int pageSize, String chineseName, String englishName, String post, String national){
		String sqlPrefix = "select *";
		String sqlSurfix = " from cf_guest_infor gi where 1=1";
		if(chineseName != null && !"".equals(chineseName)){
			sqlSurfix = sqlSurfix + " and gi.chinese_name like '%"+chineseName+"%'";
		}
		
		if(englishName != null && !"".equals(englishName)){
			sqlSurfix = sqlSurfix + " and gi.english_name like '%"+englishName+"%'";
		}
		
		if(post != null && !"".equals(post)){
			sqlSurfix = sqlSurfix + " and gi.post like '%"+post+"%'";
		}
		
		if(national != null && !"".equals(national)){
			sqlSurfix = sqlSurfix + " and gi.national like '%"+national+"%'";
		}
		
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public GuestInforModel getGuestByEmail(String email){
		return guestDao.findFirst("select * from cf_guest_infor where email=?", email);
	}
	
	public Page<GuestInforModel> guestInfro4Match(int pageNumber, int pageSize, String chineseName, String englishName, String phone, String isMatched, String post, String national, String guestType, String receptionId){
		String sqlPrefix = "select *, gi.id guestId";
		String sqlSurfix = " from cf_guest_infor gi left join cf_match m on gi.id = m.guest_id LEFT JOIN cf_guest_type gt on gi.guest_type = gt.id LEFT JOIN cf_reception_standard_management rsm on gi.id = rsm.guest_id where 1=1";
		if(englishName != null && !"".equals(englishName)){
			sqlSurfix = sqlSurfix + " and gi.english_name like '%"+englishName+"%'";
		}
		
		if(chineseName != null && !"".equals(chineseName)){
			sqlSurfix = sqlSurfix + " and gi.chinese_name like '%"+chineseName+"%'";
		}
		
		if(phone != null && !"".equals(phone)){
			sqlSurfix = sqlSurfix + " and gi.phone like '%"+phone+"%'";
		}
		
		if(isMatched != null && !"".equals(isMatched)){
			sqlSurfix = sqlSurfix + " and gi.is_matched = '"+isMatched+"'";
		}
		
		if(post != null && !"".equals(post)){
			sqlSurfix = sqlSurfix + " and gi.post like '%"+post+"%'";
		}
		
		if(national != null && !"".equals(national)){
			sqlSurfix = sqlSurfix + " and gi.national like '%"+national+"%'";
		}
		
		if(guestType != null && !"".equals(guestType)){
			sqlSurfix = sqlSurfix + " and gi.guest_type = '"+guestType+"'";
		}
		
		if(receptionId != null && !"".equals(receptionId)){
			sqlSurfix = sqlSurfix + " and rsm.reception_stand_id = '"+receptionId+"'";
		}
		
		sqlSurfix += " GROUP BY gi.id";
		
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public List<GuestInforModel> guestListByWorkerId(Long workerId){
		return guestDao.find("select * from cf_guest_infor gi left join cf_match m on gi.id = m.guest_id where m.worker_id=?", workerId);
	}
	
	public Page<GuestInforModel> guestInfor4Transfer(int pageNumber, int pageSize, String chineseName, String arrivalStation, String arrivalDate, String arrivalTime, String arrivalShiftNo, String leaveStation, String leaveDate, String leaveTime, String leaveShiftNo){
		String sqlPrefix = "select *, gi.id guestId";
		String sqlSurfix = " from cf_guest_infor gi left join cf_match m on gi.id = m.guest_id LEFT JOIN cf_guest_trip gt on gi.id = gt.guest_id LEFT JOIN cf_reception_standard_management rsm on gi.id = rsm.guest_id where 1=1";
				
		if(chineseName != null && !"".equals(chineseName)){
			sqlSurfix = sqlSurfix + " and gi.chinese_name like '%"+chineseName+"%'";
		}
		
		if(arrivalStation != null && !"".equals(arrivalStation)){
			sqlSurfix = sqlSurfix + " and gt.arrival_station like '%"+arrivalStation+"%'";
		}
		
		if(arrivalTime != null && !"".equals(arrivalTime)){
			sqlSurfix = sqlSurfix + " and gt.arrival_time = '"+arrivalTime+"'";
		}
		
		if(arrivalDate != null && !"".equals(arrivalDate)){
			sqlSurfix = sqlSurfix + " and gt.arrival_date = '"+arrivalDate+"'";
		}
		
		if(arrivalShiftNo != null && !"".equals(arrivalShiftNo)){
			sqlSurfix = sqlSurfix + " and gt.arrival_shift_no like '%"+arrivalShiftNo+"%'";
		}
		
		if(leaveStation != null && !"".equals(leaveStation)){
			sqlSurfix = sqlSurfix + " and gt.leave_station like '%"+leaveStation+"%'";
		}
		
		if(leaveTime != null && !"".equals(leaveTime)){
			sqlSurfix = sqlSurfix + " and gt.leave_time = '"+leaveTime+"'";
		}
		
		if(leaveDate != null && !"".equals(leaveDate)){
			sqlSurfix = sqlSurfix + " and gt.leave_date = '"+leaveDate+"'";
		}
		
		if(leaveShiftNo != null && !"".equals(leaveShiftNo)){
			sqlSurfix = sqlSurfix + " and gt.leave_shift_no like '%"+leaveShiftNo+"%'";
		}
		
		sqlSurfix += " group by gi.id";
		
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public Page<GuestInforModel> guestInfor4License(int pageNumber, int pageSize, String chineseName, String englishName, String isActive, String licenseNum, String post, String guestType){
		String sqlPrefix = "select *, gi.id guestId";
		String sqlSurfix = " from cf_guest_infor gi LEFT JOIN cf_guest_type gt on gi.guest_type = gt.id LEFT JOIN cf_chack_card cc on gi.card_id = cc.id where 1=1";
				
		if(chineseName != null && !"".equals(chineseName)){
			sqlSurfix = sqlSurfix + " and gi.chinese_name like '%"+chineseName+"%'";
		}
		
		if(englishName != null && !"".equals(englishName)){
			sqlSurfix = sqlSurfix + " and gi.english_name like '%"+englishName+"%'";
		}
		
		if(isActive != null && !"".equals(isActive)){
			sqlSurfix = sqlSurfix + " and gi.is_active = '"+isActive+"'";
		}
		
		if(licenseNum != null && !"".equals(licenseNum)){
			sqlSurfix = sqlSurfix + " and cc.license_num like '%"+licenseNum+"%'";
		}
		
		if(post != null && !"".equals(post)){
			sqlSurfix = sqlSurfix + " and gi.post like '%"+post+"%'";
		}
		
		if(guestType != null && !"".equals(guestType)){
			sqlSurfix = sqlSurfix + " and gi.guest_type = '"+guestType+"'";
		}
		
		sqlSurfix += " group by gi.id";
		
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public List<GuestInforModel> getGuest(){
		return guestDao.find("select * from cf_guest_infor where audit_status='1'");
	}
	
	public Page<GuestInforModel> pageList(String chinese_name, String english_name, String ch_organ_name, String post, Integer currentPage, Integer currentSize){
		String sql = "from cf_guest_infor where 1=1";
		if(chinese_name != null)
			sql += " and chinese_name like '%"+chinese_name+"%'";
		if(english_name != null)
			sql += " and english_name like '%"+english_name+"%'";
		if(ch_organ_name != null)
			sql += " and ch_organ_name like '%"+ch_organ_name+"%'";
		if(post != null)
			sql += " and post like '%"+post+"%'";
		return guestDao.paginate(currentPage, currentSize, "select * ", sql);
	}
	
	public Page<GuestInforModel> guestList4Sms(int pageNumber, int pageSize, String chineseName, String englishName, String post, String national, String phone){
		String sqlPrefix = "select gi.*, gi.id guestId, gt.id typeId, gt.type_name, gt.prefix, gt.desc, (select count(*) from cf_sms_log sl where sl.to_guest_id = gi.id) sendCount";
		String sqlSurfix = " from cf_guest_infor gi left join cf_guest_type gt on gi.guest_type = gt.id where 1=1";
		if(chineseName != null && !"".equals(chineseName)){
			System.out.println(chineseName);
			sqlSurfix = sqlSurfix + " and gi.chinese_name like '%"+chineseName+"%'";
		}
		
		if(englishName != null && !"".equals(englishName)){
			sqlSurfix = sqlSurfix + " and gi.english_name like '%"+englishName+"%'";
		}
		
		if(post != null && !"".equals(post)){
			sqlSurfix = sqlSurfix + " and gi.post like '%"+post+"%'";
		}
		
		if(phone != null && !"".equals(phone)){
			sqlSurfix = sqlSurfix + " and gi.mobile like '%"+phone+"%'";
		}
		
		if(national != null && !"".equals(national)){
			sqlSurfix = sqlSurfix + " and gi.national like '%"+national+"%'";
		}
				
		return guestDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}

}











