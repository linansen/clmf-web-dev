package com.mwi.clmf.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.mwi.clmf.model.EmailSendLogModel;
import com.mwi.clmf.vo.AuthenticatorVo;

public class SendEmail extends Thread{
	public SendEmail(String key){
		super(key);
	}
	
	@Override
	public void run() {
		boolean sendSuc = false;
		Cache emailCache = Redis.use("emailList");
		String key = this.getName();
		
		//获取redis数据放入变量
		List list = emailCache.get(key+"toMail");
		String subject = emailCache.get(key+"subject");
		String emailContent = emailCache.get(key+"content");
		String filePath = emailCache.get(key+"filePath");
		
		//删除redis里的数据
		emailCache.del(key+"toMail");
		emailCache.del(key+"subject");
		emailCache.del(key+"content");
		emailCache.del(key+"filePath");
		
		for(int i=0; i<list.size(); i++){
			sendSuc = sendMail(list.get(i).toString(), emailContent, subject, filePath);
			String isSuc = "1";
			if(sendSuc){
				isSuc = "0";
			}
			new EmailSendLogModel().set("to_mail", list.get(i).toString()).
				set("mail_subject", subject).
				set("mail_content", emailContent).
				set("file_name", filePath).
				set("send_time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(System.currentTimeMillis()))).
				set("is_success", isSuc).save();
		}
		
	}
	
	
	// 发送验证邮件
	public static boolean sendMail(String toMail, String emailContent, String subject, String filePath) {
		boolean sendSuc = false;
		
		// 发送邮箱信息
		// 因为是新注册的邮箱还不能开通smtp服务，测试即可用自己的账户测试。11月21日将能开通smtp服务
		Prop configProp = PropKit.use("emailSet.properties");
		String emailUserName = configProp.get("emailUserName");
		String password = configProp.get("password");
		String mailHost = configProp.get("mailHost");
		String mailAuth = configProp.get("mailAuth");
		
		System.out.println(mailHost+mailAuth+emailUserName+password);
		// 设置身份验证、服务器等信息
		Properties props = new Properties();
		props.setProperty("mail.smtp.host", mailHost);
		props.setProperty("mail.smtp.auth", mailAuth);
		File file = null;
		if(filePath.length()>0){
			file = new File(filePath);
		} 
		
		
		
		// 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
        Multipart multipart = new MimeMultipart();
        
		// (使用SSL，端口号465)

		Authenticator authenticator = new AuthenticatorVo(emailUserName, password);
		javax.mail.Session mailSession = javax.mail.Session.getDefaultInstance(props, authenticator);
		mailSession.setDebug(true);
		
		
		// 发送邮件
		try {
			if(filePath.length()>0){
				if(file.exists() == false){
					file.createNewFile();
				}
			} 
			
			// 添加邮件正文
	        BodyPart contentPart = new MimeBodyPart();
	        contentPart.setContent(emailContent, "text/html;charset=UTF-8");
	        multipart.addBodyPart(contentPart);
			
			// 添加附件的内容
	        if (file != null) {
	            BodyPart attachmentBodyPart = new MimeBodyPart();
	            DataSource source = new FileDataSource(file);
	            attachmentBodyPart.setDataHandler(new DataHandler(source));
	            
	            //MimeUtility.encodeWord可以避免文件名乱码
	            attachmentBodyPart.setFileName(MimeUtility.encodeWord(file.getName()));
	            multipart.addBodyPart(attachmentBodyPart);
	        }
			
			Address from = new InternetAddress(emailUserName);
			Address to = new InternetAddress(toMail);
			MimeMessage msg = new MimeMessage(mailSession);
			msg.setFrom(from);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setContent(multipart);
			msg.setRecipient(RecipientType.TO, to);
			msg.saveChanges();
			Transport.send(msg);
			sendSuc = true;
		} catch (Exception e) {
			e.printStackTrace();
			sendSuc = false;
		}
		return sendSuc;
	}

	public static void main(String[] args) throws IOException {
		System.out.println();
	}
}
