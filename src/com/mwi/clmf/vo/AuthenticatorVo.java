package com.mwi.clmf.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class AuthenticatorVo extends Authenticator{
	private String userName;
	private String password;
	
	public AuthenticatorVo(String userName, String password){
		this.userName = userName;
		this.password = password;
	}
	
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		// TODO Auto-generated method stub
		return new PasswordAuthentication(userName, password); 
	}
}
