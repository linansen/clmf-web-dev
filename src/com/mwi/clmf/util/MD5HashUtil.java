package com.mwi.clmf.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5HashUtil {

	private static final char[] hexChars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

	private static MessageDigest md = null;

	static {
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}

	public static String hashCode(String dataToHash) {
		return hashData(dataToHash.getBytes(), false);
	}

	public static String hashCode(String dataToHash, boolean isLowerCase) {
		return hashData(dataToHash.getBytes(), isLowerCase);
	}

	public static String hashCode(String dataToHash, String charsetName) {
		try {
			return hashData(dataToHash.getBytes(charsetName), false);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String hashCode(String dataToHash, String charsetName, boolean isLowerCase) {
		try {
			return hashData(dataToHash.getBytes(charsetName), isLowerCase);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static String hashCode(byte[] dataToHash, boolean isLowerCase) {
		return hashData(dataToHash, isLowerCase);
	}

	private static String hashData(byte[] dataToHash, boolean isLowerCase) {
		if (isLowerCase)
			return hexStringFromBytes((calculateHash(dataToHash))).toLowerCase();
		else
			return hexStringFromBytes((calculateHash(dataToHash)));
	}

	private static String hexStringFromBytes(byte[] b) {
		String hex = "";
		int msb;
		int lsb = 0;
		int i;

		for (i = 0; i < b.length; i++) {
			msb = (b[i] & 0x000000FF) / 16;
			lsb = (b[i] & 0x000000FF) % 16;
			hex = hex + hexChars[msb] + hexChars[lsb];
		}
		return (hex);
	}

	private static byte[] calculateHash(byte[] dataToHash) {
		md.update(dataToHash, 0, dataToHash.length);
		return (md.digest());
	}

	public static String MD5(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];

		for (int i = 0; i < charArray.length; i++)
			byteArray[i] = (byte) charArray[i];

		byte[] md5Bytes = md5.digest(byteArray);

		StringBuffer hexValue = new StringBuffer();

		for (int i = 0; i < md5Bytes.length; i++) {
			int val = (md5Bytes[i]) & 0xff;
			if (val < 16)
				hexValue.append("0");
			hexValue.append(Integer.toHexString(val));
		}

		return hexValue.toString();
	}

	// 可逆的加密算法
	public static String KL(String inStr) {
		// String s = new String(inStr);
		char[] a = inStr.toCharArray();
		for (int i = 0; i < a.length; i++) {
			a[i] = (char) (a[i] ^ 't');
		}
		String s = new String(a);
		return s;
	}

	// 加密后解密
	public static String JM(String inStr) {
		char[] a = inStr.toCharArray();
		for (int i = 0; i < a.length; i++) {
			a[i] = (char) (a[i] ^ 't');
		}
		String k = new String(a);
		return k;
	}

	public static String mD5crypt(String str) {
		if (str == null || str.length() == 0) {
			throw new IllegalArgumentException("String to encript cannot be null or zero length");
		}

		StringBuffer hexString = new StringBuffer();

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte[] hash = md.digest();

			for (int i = 0; i < hash.length; i++) {
				if ((0xff & hash[i]) < 0x10) {
					hexString.append("0" + Integer.toHexString((0xFF & hash[i])));
				} else {
					hexString.append(Integer.toHexString(0xFF & hash[i]));
				}
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return hexString.toString().toUpperCase();
	}

	public static void main(String[] args) {
		// System.out.println(mD5crypt("media"));
		// System.out.println( JM(mD5crypt("media")));
		String passportNo = "123456";
		//passportNo = passportNo.substring(passportNo.length()-6, passportNo.length());
		System.out.println(passportNo);
		System.out.println("原始：" + passportNo);
		System.out.println("MD5后：" + MD5(passportNo));
		System.out.println("MD5后再加密：" + KL(MD5(passportNo)));
		System.out.println("解密为MD5后的：" + JM(KL(MD5(passportNo))));
	}

}
