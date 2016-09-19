package com.mwi.clmf.model.hotel;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class DinningStandModel extends Model<DinningStandModel> {

	public static final DinningStandModel DSMDao = new DinningStandModel();
	public List<DinningStandModel> getDiningList(){
		return DSMDao.find("select * from cf_dining_stand");
	}
}
