package com.mwi.clmf.service.admin.guest;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import com.mwi.clmf.model.ChackCardModel;
import com.mwi.clmf.model.activity.ActivityCheckReportModel;
import com.mwi.clmf.model.activity.ActivityManagementModel;
import com.mwi.clmf.model.activity.RouteModel;
import com.mwi.clmf.model.guest.GuestInforModel;
import com.mwi.clmf.model.guest.GuestTripModel;
import com.mwi.clmf.model.hotel.HotelManagementModel;
import com.mwi.clmf.model.hotel.HotelRoomModel;
import com.mwi.clmf.transaction.Tx;
import com.mwi.clmf.util.CarkMakerUtil;
import com.mwi.clmf.util.CiperUtil;
import com.mwi.clmf.util.MiscUtil;

public class GuestInputService {
	
	public static final GuestInputService giService = new GuestInputService();
	
	public boolean guestInput(Long guestId, Long routeId){
		ActivityCheckReportModel am = new ActivityCheckReportModel();
		return am.set("route_id", routeId).set("guest_id", guestId).set("route_audit_status", 1).save();
	}
	
	@Tx
	public List<GuestInforModel> guestImport(File file){
		List<GuestInforModel> giList = new ArrayList<GuestInforModel>();
		try {
			InputStream is = new FileInputStream(file);
			Workbook wb = Workbook.getWorkbook(is);
			Sheet st = wb.getSheet(0);
			int row = st.getRows();
			for(int i=19; i<row; i++){
				GuestInforModel gi = null;
				Cell emailCell = st.getCell(13,i);
				String email = emailCell.getContents().trim();
				if(email.length() != 0){
					gi = GuestInforModel.guestDao.getGuestByEmail(email);
					boolean giIsnull = false;
					if(gi == null){
						gi = new GuestInforModel();
						giIsnull = true;
					}
					gi.set("email", email);
					Cell chineseName = st.getCell(0,i);
					String chinese_name = chineseName.getContents().trim();
					if(chinese_name.length() != 0){
						gi.set("chinese_name", chinese_name);
					}
					Cell eName = st.getCell(1,i);
					String englishName = eName.getContents().trim();
					if(englishName.length() != 0){
						gi.set("english_name", englishName);
					}
					Cell nationalCel = st.getCell(2,i);
					String national = nationalCel.getContents().trim();
					if(national.length() != 0){
						gi.set("national", national);
					}
					String passport_no = st.getCell(3,i).getContents().trim();
					if(passport_no.length() != 0){
						gi.set("passport_no", passport_no);
					}
					Cell workArea = st.getCell(4,i);
					String work_area = workArea.getContents().trim();
					if(work_area.length() != 0){
						gi.set("work_area", work_area);
					}
					Cell postCell = st.getCell(5,i);
					String post = postCell.getContents().trim();
					if(post.length() != 0){
						gi.set("post", post);
					}
					Cell birth = st.getCell(6,i);
					String birthday = birth.getContents().trim();
					if(birthday.length() != 0){
						gi.set("birthday", birthday);
					}
					Cell sexCell = st.getCell(7,i);
					String sex = sexCell.getContents().trim();
					if(sex.length() != 0){
						gi.set("sex", "男".equals(sex.trim()) ? 1 : 2);
					}
					Cell addr = st.getCell(8,i);
					String address = addr.getContents().trim();
					if(address.length() != 0){
						gi.set("address", address);
					}
					Cell phone = st.getCell(9,i);
					String phoneNum = phone.getContents().trim();
					if(phoneNum.length() != 0){
						gi.set("phone", phoneNum);
					}
					Cell mobile = st.getCell(10,i);
					String mobileNum = mobile.getContents().trim();
					if(mobileNum.length() != 0){
						gi.set("mobile", mobileNum);
					}
					Cell phoneIn = st.getCell(11,i);
					String phoneInMainLand = phoneIn.getContents().trim();
					if(phoneInMainLand.length() != 0){
						gi.set("phoneInMainLand", phoneInMainLand);
					}
					Cell faxCell = st.getCell(12,i);
					String fax = faxCell.getContents().trim();
					if(fax.length() != 0){
						gi.set("fax", fax);
					}
					Cell wechat = st.getCell(14,i);
					String wechat_username = wechat.getContents().trim();
					if(wechat_username.length() != 0){
						gi.set("wechat_username", wechat_username);
					}
					Cell cpName = st.getCell(15,i);
					String cp_name = cpName.getContents().trim();
					if(cp_name.length() != 0){
						gi.set("cp_name", cp_name);
					}
					Cell cpMobile = st.getCell(16,i);
					String cp_mobile = cpMobile.getContents().trim();
					if(cp_mobile.length() != 0){
						gi.set("cp_mobile", cp_mobile);
					}
					Cell cpphone = st.getCell(17,i);
					String cp_phone = cpphone.getContents().trim();
					if(cp_phone.length() != 0){
						gi.set("cp_phone", cp_phone);
					}
					Cell cpemail = st.getCell(18,i);
					String cp_email = cpemail.getContents().trim();
					if(cp_email.length() != 0){
						gi.set("cp_email", cp_email);
					}
					Cell diatHabCell = st.getCell(19,i);
					String diatHab = diatHabCell.getContents().trim();
					if(diatHab.length() != 0){
						gi.set("diatHab", Integer.valueOf(diatHab));
					}
					Cell diatDescCell = st.getCell(20,i);
					String diatDesc = diatDescCell.getContents().trim();
					if(diatDesc.length() != 0){
						gi.set("diatDesc", diatDesc);
					}
					gi.set("audit_status", 1).set("username", email).set("password", CiperUtil.encrypt(MiscUtil.get6pwd()));
					boolean gibl = false; 
					if(giIsnull){
						gibl = gi.save();
						ChackCardModel cc = new ChackCardModel().set("license_num", CarkMakerUtil.createGuestCardId(gi.getLong("id"))).set("card_status", "0");
						cc.save();
						gi.set("card_id", cc.getLong("id")).update();
					}else{
						gibl = gi.update();
					}
					// 行程
					GuestTripModel gt = GuestTripModel.guestTripDao.getTripByGuestId(gi.getLong("id"));
					boolean gtIsnull = false;
					if(gt == null){
						gt = new GuestTripModel();
						gtIsnull = true;
					}
					String arrival_date = st.getCell(21,i).getContents().trim();
					if(arrival_date.length() != 0){
						gt.set("arrival_date", arrival_date);
					}
					String arrival_time = st.getCell(22,i).getContents().trim();
					if(arrival_time.length() != 0){
						gt.set("arrival_time", arrival_time);
					}
					String arrival_station = st.getCell(23,i).getContents().trim();
					if(arrival_station.length() != 0){
						gt.set("arrival_station", arrival_station);
					}
					String arrival_shift_no = st.getCell(24,i).getContents().trim();
					if(arrival_shift_no.length() != 0){
						gt.set("arrival_shift_no", arrival_shift_no.toUpperCase());
					}
					String leave_date = st.getCell(25,i).getContents().trim();
					if(leave_date.length() != 0){
						gt.set("leave_date", leave_date);
					}
					String leave_time = st.getCell(26,i).getContents().trim();
					if(leave_time.length() != 0){
						gt.set("leave_time", leave_time);
					}
					String leave_city = st.getCell(27,i).getContents().trim();
					if(leave_city.length() != 0){
						gt.set("leave_city", leave_city);
					}
					String leave_station = st.getCell(28,i).getContents().trim();
					if(leave_station.length() != 0){
						gt.set("leave_station", leave_station);
					}
					String leave_shift_no = st.getCell(29,i).getContents().trim();
					if(leave_shift_no.length() != 0){
						gt.set("leave_shift_no", leave_shift_no.toUpperCase());
					}
					String ticket_name = st.getCell(38,i).getContents().trim();
					if(ticket_name.length() != 0){
						gt.set("ticket_name", ticket_name);
					}
					boolean gtbl = false;
					gt.set("guest_id", gi.getLong("id")).set("arrival_status", 1).set("create_time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					if(gtIsnull)
						gtbl = gt.save();
					else
						gtbl = gt.update();
					
					// 活动路线
					boolean ambl = true;
					String routes = st.getCell(30,i).getContents().trim();
					if(routes.length() != 0){
						String[] routeName = routes.split(",");
						//System.out.println("routes:-- "+routes);
						ActivityManagementModel.amDao.delActivityByGuestId(gi.getLong("id"));
						for (String str : routeName) {
							RouteModel rm = RouteModel.rDao.getRouteByName(str);
							//System.out.println("route:-- "+rm);
							ActivityManagementModel am = new ActivityManagementModel();
							ambl = am.set("route_id", rm.getLong("id")).set("guest_id", gi.getLong("id")).set("route_audit_status", 1).save();
							if(!ambl){
								break;
							}
						}
					}
					// 住宿
					HotelManagementModel hm = HotelManagementModel.hmDao.getHotel(gi.getLong("id"));
					//System.out.println("hm model: --"+hm);
					boolean hmIsnull = false;
					if(hm == null){
						hm = new HotelManagementModel();
						hmIsnull = true;
					}
					String hotel = st.getCell(31,i).getContents().trim();
					String room_type = st.getCell(32,i).getContents().trim();
					if(hotel.length() != 0 && room_type.length() != 0){
						HotelRoomModel hr = HotelRoomModel.hrDao.getRoom(hotel, room_type);
						if(hr != null){
							hm.set("room_id", hr.getLong("room_id"));
						}
						String room_num = st.getCell(33,i).getContents().trim();
						if(room_type.length() != 0){
							hm.set("room_num", room_num);
						}
						String checkin_date = st.getCell(34,i).getContents().trim();
						if(checkin_date.length() != 0){
							hm.set("checkin_time", checkin_date);
						}
						String checkout_time = st.getCell(35,i).getContents().trim();
						if(checkout_time.length() != 0){
							hm.set("checkout_time", checkout_time);
						}
						String mate_passport = st.getCell(36,i).getContents().trim();
						if(mate_passport.length() != 0){
							hm.set("roommate_idNo", mate_passport);
							hm.set("with_roommate", 2);
						}else{
							hm.set("with_roommate", 0);
						}
						String is_smoking = st.getCell(37,i).getContents().trim();
						if(is_smoking.length() != 0){
							hm.set("is_smoking", "是".equals(is_smoking) ? 1 : 0);
						}
					}
					boolean hmbl = false;
					if(hmIsnull){
						hmbl = hm.set("status", 1).set("guest_id", gi.getLong("id")).save();
					}else{
						//System.out.println("hm id:-- "+hm.getLong("id"));
						hmbl = hm.set("status", 1).set("guest_id", gi.getLong("id")).update();
					}
					System.out.println("guest infor:"+gibl+" -- guest trip:"+gtbl+" -- activity route:"+ambl+" -- hotel bl:"+hmbl);
					gi.put("guestTrip", gt);
					giList.add(gi);
				}else{
					System.out.println("邮箱不能为空！");
					break;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return giList;
	}
	
}
