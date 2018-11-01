package com.hughes.bits.esb.custom.utils;

public class Constants {


	public static final String AUTHORIZATION_FAILURE_CODE              = "401";
	public static final String AUTHORIZATION_FAILURE              = "User not authorized to send this message";
	public static final String FAILURE_CODE              = "402";
	public static final String FAILED_TO_READ_PARTNER_INFO              = "Failed to read Partner-info table";
	public static final String INVALID_TRANSACTION_CODE              = "403";
	public static final String INVALID_TRANSACTION_INFO              = "Invalid TransactionCode [%0] for input request";

	public final static String SQL_EXCEP_ERROR_CODE				="2019005";
	public final static String SQL_EXCEP_ERROR_DESC				="Unable to perform operation on Database";
	public final static String SQL_EXCEP_ERROR_MSG				="SQLException occurred";
	
	public final static String DB_NAMING_ERROR_CODE				="2019001";
	public final static String DB_NAMING_ERROR_DESC				="Naming Exception in Service Locator";
	public final static String DB_NAMING_ERROR_MSG				="Not able to get the DataSource Object";
	
	public static final String CUSTOMER_CATEGORY_FR							= "Franchisee";
	public static final String BILLTYPE_CREDIT_INV                = "INV";
	public static final String UNIT_NM_SM									= "SM";
	public static final String FEATURE_NM_YAHSAT_ORDERING					= "YAHSAT_ORDERING";
	public static final String PARAM_NAME_YAHSAT_BUSINESS_MODELS  = "YAHSAT_BUSINESS_MODELS";
	public static final String PARAM_NAME_YAHSAT_BUSINESS_MODEL_DEF_VAL	= 	"ConsumerSP";
	public static final String PIM_PARTNER_ID_NOT_MATCHES                         = "1060";
	public static final String NOT_ALLOWED_TO_ACCESS_REQUEST                      = "1061";
	public static final String PIM_INTERNAL_EXCEPTION                             = "1010";
	public static final String PIM_MANDATORY_PARAMETER_MISSING       			= "3013";
	public static final String PIM_SAN_AND_ORDERID_AND_ESN_NULL                         = "1109";
	public static final String SAN_LENGTH_LESS_THAN_THREE                               = "1071";
}
