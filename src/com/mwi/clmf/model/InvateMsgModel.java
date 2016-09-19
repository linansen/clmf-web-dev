package com.mwi.clmf.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class InvateMsgModel extends Model<InvateMsgModel> {

	public static final InvateMsgModel imDao = new InvateMsgModel();
	
	public Page<InvateMsgModel> getInviteHistory(int pageNumber, int pageSize, Long guestId, String invateGuestName, String invateGuestOrgan, String invateGuestPost){
		String sqlPrefix = "select *, im.id inviteId";
		String sqlSurfix = " from  cf_invate_msg im, cf_guest_infor gi where im.from_user_id = gi.id and im.to_user_id = "+guestId;
		
		if(invateGuestName != null && !"".equals(invateGuestName)){
			sqlSurfix = sqlSurfix + " and gi.chinese_name like '%"+invateGuestName+"%'";
		}
		
		if(invateGuestOrgan != null && !"".equals(invateGuestOrgan)){
			sqlSurfix = sqlSurfix + " and gi.ch_organ_name like '%"+invateGuestOrgan+"%'";
		}
		
		if(invateGuestPost != null && !"".equals(invateGuestPost)){
			sqlSurfix = sqlSurfix + " and gi.post like '%"+invateGuestPost+"%'";
		}
		
		
		return imDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	public Page<InvateMsgModel> sentInviteHistory(int pageNumber, int pageSize, Long guestId, String invateGuestName, String invateGuestOrgan, String invateGuestPost){
		String sqlPrefix = "select *, im.id inviteId";
		String sqlSurfix = " from  cf_invate_msg im, cf_guest_infor gi where im.to_user_id = gi.id and im.from_user_id = "+guestId;
		
		if(invateGuestName != null && !"".equals(invateGuestName)){
			sqlSurfix = sqlSurfix + " and gi.chinese_name like '%"+invateGuestName+"%'";
		}
		
		if(invateGuestOrgan != null && !"".equals(invateGuestOrgan)){
			sqlSurfix = sqlSurfix + " and gi.ch_organ_name like '%"+invateGuestOrgan+"%'";
		}
		
		if(invateGuestPost != null && !"".equals(invateGuestPost)){
			sqlSurfix = sqlSurfix + " and gi.post like '%"+invateGuestPost+"%'";
		}
		
		
		return imDao.paginate(pageNumber, pageSize, sqlPrefix, sqlSurfix);
	}
	
	
}
