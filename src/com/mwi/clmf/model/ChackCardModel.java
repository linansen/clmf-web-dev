package com.mwi.clmf.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
/**
 * 证件信息
 * @author sw
 *
 */
@SuppressWarnings("serial")
public class ChackCardModel extends Model<ChackCardModel> {

	public static final ChackCardModel chackCardDao = new ChackCardModel();
	
	public boolean updateStatus(String status, Long guestId){
		int num = Db.update("update cf_chack_card set card_status=? where id=(select gi.card_id from cf_guest_infor gi where gi.id=?)",status,guestId);
		return num == 1 ? true : false;
	}
}
