package com.hughes.bits.esb.custom.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class SmooksPIMUtils {

	public static boolean checkInternationalAddress(String country, String state, String postalCode)
	{
		/*Pattern pattern = Pattern.compile("^.{1,6}$");
		Matcher matcher = pattern.matcher(state);

		Pattern pattern1 = Pattern.compile("^.{1,10}$");
		Matcher matcher1 = pattern1.matcher(postalCode);
		
		Pattern pattern2 = Pattern.compile("^(AF|MW|AM|AO|AZ|BH|CY|EG|IR|IQ|JO|KE|KW|LB|NG|OM|PK|QA|SA|ZA|SD|SY|TZ|TR|UG|AE|YE|SS|SZ)$");
		Matcher matcher2 = pattern2.matcher(country);
		
		return matcher.find() && matcher1.find() && matcher2.find();*/
		return true;
	}

	public static boolean checkAddress(String state, String postalCode)
	{
		Pattern pattern = Pattern.compile("^.{2}$");
		Matcher matcher = pattern.matcher(state);

		Pattern pattern1 = Pattern.compile("^.{5,10}$");
		Matcher matcher1 = pattern1.matcher(postalCode);

		return matcher.find() && matcher1.find();
	}
	
	public static boolean checkProgramCode(String progCode, String custCategory)
	{
		if(Constants.CUSTOMER_CATEGORY_FR.equalsIgnoreCase(custCategory)) {
			
			Pattern pattern = Pattern.compile("^.{1,20}$");
			Matcher matcher = pattern.matcher(progCode);
	
			return matcher.find();
		}
		return true;
	}
	
	public static boolean checkInvInfoBusType(String custCategory, String paymentMode, String businessType)
	{
		if(Constants.CUSTOMER_CATEGORY_FR.equalsIgnoreCase(custCategory) && Constants.BILLTYPE_CREDIT_INV.equalsIgnoreCase(paymentMode)) {
			Pattern pattern = Pattern.compile("^(Franchisee,Corporation,Partnership,Proprietorship)$");
			Matcher matcher = pattern.matcher(businessType);

			return matcher.find();
		}
		return true;
	}
	
	
	public static boolean checkInvInfoYearsInBus(String custCategory, String paymentMode,String yearsInBusiness)
	{
		if(Constants.CUSTOMER_CATEGORY_FR.equalsIgnoreCase(custCategory) && Constants.BILLTYPE_CREDIT_INV.equalsIgnoreCase(paymentMode)) {
			Pattern pattern = Pattern.compile("^.{1,3}$");
			Matcher matcher = pattern.matcher(yearsInBusiness);
			return matcher.find();
		}
		return true;
	}
	
	public static boolean checkInvInfoBusBankRef(String custCategory, String paymentMode,String businessBankReference)
	{
		if(Constants.CUSTOMER_CATEGORY_FR.equalsIgnoreCase(custCategory) && Constants.BILLTYPE_CREDIT_INV.equalsIgnoreCase(paymentMode)) {
			Pattern pattern = Pattern.compile("^.{0,50}$");
			Matcher matcher = pattern.matcher(businessBankReference);
			return matcher.find();
		}
		return true;
	}
	
	public static boolean checkInvInfoBranch (String custCategory, String paymentMode,String branch)
	{
		if(Constants.CUSTOMER_CATEGORY_FR.equalsIgnoreCase(custCategory) && Constants.BILLTYPE_CREDIT_INV.equalsIgnoreCase(paymentMode)) {
			Pattern pattern = Pattern.compile("^.{0,50}$");
			Matcher matcher = pattern.matcher(branch);
			return matcher.find();
		}
		return true;
	}
	
	public static boolean checkInvInfoBusBankAccNum(String custCategory, String paymentMode,String businessBankAccountNumber)
	{
		if(Constants.CUSTOMER_CATEGORY_FR.equalsIgnoreCase(custCategory) && Constants.BILLTYPE_CREDIT_INV.equalsIgnoreCase(paymentMode)) {
			Pattern pattern = Pattern.compile("^.{0,50}$");
			Matcher matcher = pattern.matcher(businessBankAccountNumber);
			return matcher.find();
		}
		return true;
	}
	
	public static boolean checkInvInfoPhone(String custCategory, String paymentMode,String phone)
	{
		if(Constants.CUSTOMER_CATEGORY_FR.equalsIgnoreCase(custCategory) && Constants.BILLTYPE_CREDIT_INV.equalsIgnoreCase(paymentMode)) {
				Pattern pattern = Pattern.compile("^.{0,20}$");
				Matcher matcher = pattern.matcher(phone);
				return matcher.find();
		}
		return true;
	}
}
