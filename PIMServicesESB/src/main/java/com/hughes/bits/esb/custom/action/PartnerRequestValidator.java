package com.hughes.bits.esb.custom.action;


import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.camel.Exchange;
import org.apache.log4j.Logger;

import com.hughes.bits.esb.custom.action.GeneralUtilities;
//import com.jaxb.generated.CustomerValue;
import com.hughes.bits.esb.custom.utils.AppParameter;
import com.hughes.bits.esb.custom.utils.Constants;
import com.hughes.bits.esb.custom.utils.PIMUtil;



public class PartnerRequestValidator  {

	private static Logger logger = Logger.getLogger(PartnerRequestValidator.class);
	
	
	public void process(Exchange exchange) throws Exception {
		String userName = (String) exchange.getProperty("userName");
		String msgType = (String) exchange.getProperty("msgType");
		
	
		String checkSuperPart =  AppParameter.getParam("pim_username_superpartner_map",userName);
		String businessModel = AppParameter.getParam("pim_username_buisnessmodel_map",userName);
		String partnerId = AppParameter.getParam("pim_username_partnerid_map",userName);
		HashMap<String,String> databyValue = new HashMap<String,String>();
		
		boolean isSuperPartner = false;
		
		logger.debug("Message Type - " +  msgType);
		logger.debug("partnerId  - " +  partnerId);
		logger.debug("businessModel  - " +  businessModel);
		logger.debug("checkSuperPart  - " +  checkSuperPart);
		logger.debug("userName  - " +  userName);
		
		
		try {
			
		
			
			if("true".equalsIgnoreCase(checkSuperPart)){
				  System.out.println("true");
				  isSuperPartner = true;
			 }
			else if("false".equalsIgnoreCase(checkSuperPart)){
				 isSuperPartner = false;
			}
			else{
				
				logger.debug("Invalid super partner value");
			}
			
		
				
				
			//	isSuperPartner = partnerVal.isSuperPartner();
				logger.debug("isSuperPartner: " + isSuperPartner);
	

			String payloadPartnerId=null;
			
			if("ORD".equals(msgType)){
				String[] getList = {"PartnerId"};
				logger.debug("New Order(): Start");
				String validateReqObj = exchange.getIn().getBody(String.class);
				databyValue = GeneralUtilities.getTagValueFromMsgXML(validateReqObj,getList);
				payloadPartnerId = databyValue.get("PartnerId");
				validatePartnerId(isSuperPartner, partnerId, payloadPartnerId);
				logger.debug("New Order(): End");
			} 
			else if("MOD".equals(msgType)) {
				String validateReqObj = exchange.getIn().getBody(String.class);
				validateModifyOrder(validateReqObj, partnerId, isSuperPartner);
			} 
			else if("CAN".equals(msgType)) {
				String  validateReqObj = exchange.getIn().getBody(String.class);
				validateCancelOrder(validateReqObj, partnerId, isSuperPartner);
			} 
			else if("UPG".equals(msgType)) {
				logger.debug("No validation required, as upgrade can be done by another source too");
			}
			else if("ECO".equals(msgType)) {
				logger.debug("ExistingCustomerOrderRequest():  Start");
				String[] getList = {"PartnerId"};
				String validateReqObj = exchange.getIn().getBody(String.class);
				databyValue = GeneralUtilities.getTagValueFromMsgXML(validateReqObj,getList);
				payloadPartnerId= databyValue.get("PartnerId");
				validatePartnerId(isSuperPartner, partnerId, payloadPartnerId);
				logger.debug("ExistingCustomerOrderRequest():  End");
			} 
			else if("CSS".equals(msgType)) {
				String validateReqObj = exchange.getIn().getBody(String.class);
				validateChangeServiceStatus(validateReqObj, partnerId, isSuperPartner);
			}  
			else if("CCU".equals(msgType)){
				logger.debug("CreateCustomerRequest():  Start");
				String[] getList = {"PartnerId"};
				String validateReqObj = exchange.getIn().getBody(String.class);
				databyValue = GeneralUtilities.getTagValueFromMsgXML(validateReqObj,getList);
				payloadPartnerId= databyValue.get("PartnerId");
				validatePartnerId(isSuperPartner, partnerId, payloadPartnerId);
				logger.debug("CreateCustomerRequest():  End");
			} 
			else if("MCU".equals(msgType)){
				String validateReqObj = exchange.getIn().getBody(String.class);
				validateModifyCustomerRequest(validateReqObj, partnerId,isSuperPartner);
			} 
			else if("SCU".equals(msgType)){
				logger.debug("SearchCustomerRequest():  Start");
				String[] getList = {"PartnerId"};
				String validateReqObj = exchange.getIn().getBody(String.class);
				databyValue = GeneralUtilities.getTagValueFromMsgXML(validateReqObj,getList);
				payloadPartnerId= databyValue.get("PartnerId");
			
				validatePartnerId(isSuperPartner, partnerId, payloadPartnerId);
				logger.debug("SearchCustomerRequest():  End");
			
			} 
			else if("VOR".equals(msgType)){
				String validateReqObj = exchange.getIn().getBody(String.class);
				validateViewOrder(validateReqObj, partnerId, isSuperPartner);
			}  
			else if("FAR".equals(msgType)){
				logger.debug("FAPTokenAllocateRequest():  Start");
				String[] getList = {"PartnerId"};
				String validateReqObj = exchange.getIn().getBody(String.class);
				databyValue = GeneralUtilities.getTagValueFromMsgXML(validateReqObj,getList);
				payloadPartnerId= databyValue.get("PartnerId");
				
				validatePartnerId(isSuperPartner, partnerId, payloadPartnerId);
				logger.debug("FAPTokenAllocateRequest():  End");
			}  
			else if("EPQ".equals(msgType)){
				logger.debug("EnhancedServicePrequalRequest():  Start");
				String[] getList = {"PartnerId"};
				String validateReqObj = exchange.getIn().getBody(String.class);
				databyValue = GeneralUtilities.getTagValueFromMsgXML(validateReqObj,getList);
				payloadPartnerId=databyValue.get("PartnerId");
				
				validatePartnerId(isSuperPartner, partnerId, payloadPartnerId);
				logger.debug("EnhancedServicePrequalRequest():  End");
			}  
			else if("LSR".equals(msgType)){
				String validateReqObj = exchange.getIn().getBody(String.class);
				validateStatusRequest(validateReqObj, businessModel , isSuperPartner);
			}

		}  catch(Exception e){
 		    e.printStackTrace();
 		   throw e;

 		  }

		logger.debug( "validate(): end");
		
	}

	/**
	 
	 */
	
	public void validatePartnerId(boolean isSuperPartner , String partnerId ,  String id) throws Exception
	{
		
		if(!isSuperPartner){
			if(partnerId != null && partnerId.equalsIgnoreCase(id)) {
				logger.debug( " Both partnerId matches. Partner Request validation pass");
			} else {
				logger.error(" New order Request is not coming from right partner, Partner Request validation Fail");
				throw new Exception( "Request is not coming from right partner, PartnerId not matches"+ partnerId + "#"+Constants.PIM_PARTNER_ID_NOT_MATCHES);

			}
		} else {
			logger.debug( " This partner is a Super partner, so skip validation");
		}
		
	}

	

	private void validateModifyOrder(String obj, String id, boolean isSuperPartner) throws Exception {
		logger.debug("validateModifyOrder(): start");
		String[] getList = {"PartnerId" , "SAN" ,"OrderId"};
		HashMap<String,String> databyValue = new HashMap<String,String>();
		databyValue = GeneralUtilities.getTagValueFromMsgXML(obj,getList);
		
		try {
			//ModifyOrderRequest modifyOrderRequest = (ModifyOrderRequest) obj;
			String partnerId = databyValue.get("PartnerId");
			String orderId = null; 
			String san = null;

			if(databyValue.get("OrderId") != null && databyValue.get("SAN") != null) {
				san =databyValue.get("SAN");
			} else {
				if(databyValue.get("OrderId")!=null) 
					orderId = databyValue.get("OrderId");
				if(databyValue.get("SAN")!=null) 
					san = databyValue.get("SAN");
			}
			validatePartnerId(isSuperPartner ,partnerId,id );
//			CustomerValue customerVal = null;

//			if(orderId!=null) 
//				customerVal=PIMUtil.getCustomerValueFromOrderId(orderId);
//			if(san!=null) 
//				customerVal=PIMUtil.getCustomerValueFromSAN(san);
//
//			if(customerVal != null) {
//				String classACustomerId = customerVal.getClassACustomerId();
//				String sourceCustomerId = customerVal.getSourceCustomerId();
//				if(classACustomerId != null && classACustomerId.equalsIgnoreCase(partnerId) || sourceCustomerId != null && sourceCustomerId.equalsIgnoreCase(partnerId)) {
//					logger.debug("validateModifyOrder(): PartnerId matched with classACustomerId or SourceCustomerId");
//				} else {
//					logger.error("validateModifyOrder(): PartnerId not matched with classACustomerId = " + classACustomerId + " or sourceCustomerId = " + sourceCustomerId + ", So Validation fail");
//					throw new Exception( "PartnerId not matches with classACustomerId or SourceCustomerId, validation Fail#"+Constants.NOT_ALLOWED_TO_ACCESS_REQUEST);
//					
//				}
			
//			}
			
		} catch(Exception e) {
			logger.error( "validateModifyOrder(): Caught PIMException : " + e.getMessage());
			throw e;
		}
		logger.debug( "validateModifyOrder(): Modify order Request is coming from right partner, Partner Request validation Pass");
		logger.debug( "validateModifyOrder(): end");
	}


	/**
	
	 */


	private void validateCancelOrder(String obj, String id, boolean isSuperPartner) throws Exception {
		logger.debug("validateCancelOrder(): start");
		try {
			//CancelOrderRequest cancelOrderRequest = (CancelOrderRequest) obj;
			String[] getList = {"PartnerId" , "SAN" ,"OrderId"};
			HashMap<String,String> databyValue = new HashMap<String,String>();
			databyValue = GeneralUtilities.getTagValueFromMsgXML(obj,getList);
			String partnerId = databyValue.get("PartnerId");
			String orderId = null; 
			String san = null;

			if(databyValue.get("OrderId") != null && databyValue.get("SAN") != null) {
				san = databyValue.get("SAN");
			} else {
				if(databyValue.get("OrderId")!=null) 
					orderId = databyValue.get("OrderId");
				if(databyValue.get("SAN")!=null) 
					san = databyValue.get("OrderId");
			}
			validatePartnerId(isSuperPartner ,partnerId,id );

//			CustomerValue customerVal = null;

//			if(orderId!=null) 
//				customerVal=PIMUtil.getCustomerValueFromOrderId(orderId);
//			if(san!=null) 
//				customerVal=PIMUtil.getCustomerValueFromSAN(san);
//
//			if(customerVal != null) {
//				String classACustomerId = customerVal.getClassACustomerId();
//				String sourceCustomerId = customerVal.getSourceCustomerId();
//				if(classACustomerId != null && classACustomerId.equalsIgnoreCase(partnerId) || sourceCustomerId != null && sourceCustomerId.equalsIgnoreCase(partnerId)) {
//					logger.debug("validateCancelOrder(): PartnerId matched with classACustomerId or SourceCustomerId");
//				} else {
//					logger.error("validateCancelOrder(): PartnerId not matched with classACustomerId = " + classACustomerId + " or sourceCustomerId = " + sourceCustomerId + ", So Validation fail");
//					throw new Exception("PartnerId not matches with classACustomerId or SourceCustomerId, validation Fail#"+Constants.NOT_ALLOWED_TO_ACCESS_REQUEST);
//					
//				}
//			}
			
			
		} catch(SQLException ex) {
			logger.error( "validateCancelOrder(): Caught PIMException : " + ex.getMessage());
			throw new Exception("Caught SQLException :" + ex.getMessage() +"#"+Constants.PIM_INTERNAL_EXCEPTION);

		}catch(Exception e) {
			logger.error( "validateCancelOrder(): Caught PIMException : " + e.getMessage());
			throw e;
		} 
		logger.debug("validateCancelOrder(): Cancel order Request is coming from right partner, Partner Request validation Pass");
		logger.debug( "validateCancelOrder(): end");
	}


	

	private void validateChangeServiceStatus(String obj, String id, boolean isSuperPartner) throws Exception {
		logger.debug("validateChangeServiceStatus(): start");
		boolean sanMatched = false;
		PartnerRequestValidator partnerReqVal = new PartnerRequestValidator();
		String[] getList = {"SAN"};
		HashMap<String,String> databyValue = new HashMap<String,String>();
		databyValue = GeneralUtilities.getTagValueFromMsgXML(obj,getList);
		try {
			//ChangeServiceStatusRequest changeServiceStatusRequest = (ChangeServiceStatusRequest) obj;
			String san = databyValue.get("SAN");
//			CustomerValue customerVal = PIMUtil.getCustomerValueFromSAN(san);
			if(!isSuperPartner){
				
				
//				if(customerVal != null) {
//					String classACustomerId = customerVal.getClassACustomerId();
//					String sourceCustomerId = customerVal.getSourceCustomerId();
//					if(classACustomerId != null && classACustomerId.equalsIgnoreCase(id) || sourceCustomerId != null && sourceCustomerId.equalsIgnoreCase(id) ) {
//						logger.debug("validateChangeServiceStatus(): Change Service status Request is coming from right partner, Partner Request validation pass");
//					} else {
//						logger.error( "validateChangeServiceStatus(): PartnerId not matched with classACustomerId = " + classACustomerId + " or sourceCustomerId = " + sourceCustomerId + ", So Validation fail");
//						throw new Exception( "PartnerId not matched with classACustomerId or sourceCustomerId#"+Constants.NOT_ALLOWED_TO_ACCESS_REQUEST);
//
//						
//					}
					
					
					
//				} else  {
//					
//					
//					
//					logger.debug("validateChangeServiceStatus(): ClassACustomerId and sourceCustomerId is null so SAN may be of legacy site");
//					boolean sanValid  = partnerReqVal.validateSANCharacters(san);
//					if(sanValid == true){
//						logger.debug("validateChangeServiceStatus(): SAN Length is greater than or equal to three");
//						san = san.substring(0, 3);
//							Collection<String> customerPrefixes = PIMUtil.getCustomerPrefixFromPartnerId(id);
//						sanMatched = partnerReqVal.matchCustomerPrefixWithSanPrefix(san,customerPrefixes);
//						if(sanMatched==true){
//							logger.debug( "validateChangeServiceStatus(): SAN prefix is matched, So Validation Pass");
//						} else {
//							logger.debug( "validateChangeServiceStatus(): SAN prefix is not matched, So Validation fail");
//						
//							throw new Exception("SAN prefix is not matched with the customer prefix#"+Constants.NOT_ALLOWED_TO_ACCESS_REQUEST);
//							
//						}
//					}
//				}
			
			
			
//			} else {
//				logger.debug("validateChangeServiceStatus(): This partner is a Super partner, so skip validation");
			}
			
			
			
		}   catch(Exception ex) {
			logger.error( "validateChangeServiceStatus(): Caught SQLException : " + ex.getMessage());
		
			throw new Exception("Caught SQLException :" + ex.getMessage() +"#"+Constants.PIM_INTERNAL_EXCEPTION);
		}
		logger.debug("validateChangeServiceStatus(): end");
	}



	private void validateStatusRequest(String obj, String businessModel , boolean isSuperPartner) throws Exception {
		logger.debug( "validateStatusRequest(): start");
		boolean sanMatched = false;
		PartnerRequestValidator partnerReqVal = new PartnerRequestValidator();
		String[] getList = {"SAN" , "OrderId" , "SerialNumber" , "CustomerCategory"};
		HashMap<String,String> databyValue = new HashMap<String,String>();
		databyValue = GeneralUtilities.getTagValueFromMsgXML(obj,getList);
		try {
			String id = "";
			
			//StatusRequest statusRequest = (StatusRequest) obj;
			String san = databyValue.get("SAN");
			String orderId = databyValue.get("OrderId");
			String serialNumber = databyValue.get("SerialNumber");

			if(databyValue.get("CustomerCategory") != null && databyValue.get("CustomerCategory").trim().length() > 0) {
				businessModel = databyValue.get("CustomerCategory").trim();
			}

			if(businessModel == null || businessModel.trim().length() == 0) {
				throw new Exception("Customer Category is empty#"+Constants.PIM_MANDATORY_PARAMETER_MISSING);
			}

//			CustomerValue customerVal = null;
			if(san != null) {
				logger.debug("validateStatusRequest(): SAN is not null");
//				customerVal = PIMUtil.getCustomerValueFromSAN(san);
			} else if(orderId != null){
				logger.debug("validateStatusRequest(): OrderID is not null");
//				customerVal = PIMUtil.getCustomerValueFromOrderId(orderId);
			} else if(serialNumber != null){
				logger.debug("validateStatusRequest(): Serial Number is not null");
				san = PIMUtil.getSANBySerialNumber(serialNumber);
				logger.debug( "validateStatusRequest(): SAN fetched from serial number is " + san);
//				if(san != null)
//					customerVal = PIMUtil.getCustomerValueFromSAN(san);
			}else {
				logger.error( "validateStatusRequest(): SAN,OrderID and SerialNumber all are null");
				
				throw new Exception( "SAN,OrderID and SerialNumber all are null#"+Constants.PIM_SAN_AND_ORDERID_AND_ESN_NULL);
			}

			String dbBusinessModel = null;
//			if(customerVal != null) {
//				dbBusinessModel = customerVal.getBusinessModel();
//			}
			boolean isYahsatBusinessModelFlag = PIMUtil.isYahsatBusinessModel(businessModel);
			if(isYahsatBusinessModelFlag && dbBusinessModel != null && !dbBusinessModel.trim().equalsIgnoreCase(businessModel.trim())) {
			
				throw new Exception("Partner's business model not matched with business model stored in DB for the SAN/order id#"+Constants.NOT_ALLOWED_TO_ACCESS_REQUEST);
			} else {
				//Do nothing
			}

			if(!isSuperPartner){
//				if(customerVal != null) {
//					String classACustomerId = customerVal.getClassACustomerId();
//					String sourceCustomerId = customerVal.getSourceCustomerId();
//					if(classACustomerId != null && classACustomerId.equalsIgnoreCase(id) || sourceCustomerId != null && sourceCustomerId.equalsIgnoreCase(id) ) {
//						logger.debug( "validateStatusRequest(): Customer Update Request is coming from right partner, Partner Request validation pass");
//					} else {
//						logger.error( "validateStatusRequest(): PartnerId not matched with classACustomerId = " + classACustomerId + " or sourceCustomerId = " + sourceCustomerId + ", So Validation fail");
//				
//						throw new Exception("PartnerId not matched with classACustomerId or sourceCustomerId#"+Constants.NOT_ALLOWED_TO_ACCESS_REQUEST);
//
//					}
//				} else  {
//					logger.debug( "validateStatusRequest(): ClassACustomerId and sourceCustomerId is null so SAN may be of legacy site");
//					boolean sanValid = false;
//					if(san != null) {
//						sanValid = partnerReqVal.validateSANCharacters(san);
//					}
//					if(sanValid == true){
//						logger.debug( "validateStatusRequest(): SAN Length is greater than or equal to three");
//						san = san.substring(0, 3);
//						Collection<String> customerPrefixes = PIMUtil.getCustomerPrefixFromPartnerId(id);
//						sanMatched = partnerReqVal.matchCustomerPrefixWithSanPrefix(san,customerPrefixes);
//						if(sanMatched==true){
//							logger.debug( "validateStatusRequest(): SAN prefix is matched, So Validation Pass");
//						} else {
//							logger.error("validateStatusRequest(): SAN prefix is not matched, So Validation fail");
//						
//							throw new Exception( "SAN prefix is not matched with the customer prefix#"+Constants.NOT_ALLOWED_TO_ACCESS_REQUEST);
//						}
//					}
//				}
			} else {
				logger.debug("validateStatusRequest(): This partner is a Super partner, so skip validation");
			}
		} catch(Exception e) {
			logger.error( "validateStatusRequest(): Caught PIMException : " + e.getMessage());
			throw e;
		} 
		logger.debug("validateStatusRequest(): end");
	}



	private void validateModifyCustomerRequest(String obj, String partnerId, boolean isSuperPartner) throws Exception {
		logger.debug("validateModifyCustomerRequest(): start");
		String payloadPartnerId = null;
		String[] getList = {"PartnerId" , "CustomerId"};
		HashMap<String,String> databyValue = new HashMap<String,String>();
		databyValue = GeneralUtilities.getTagValueFromMsgXML(obj ,getList);
		try {
		
			if(!isSuperPartner) {
				payloadPartnerId = databyValue.get("PartnerId");
				String customerId =databyValue.get("CustomerId");
				String classACustomerId = null;
				String sourceCustomerId = null;
//				CustomerValue customerVal = PIMUtil.getCustomerValueFromCustomerId(customerId);
//				if(customerVal!=null){
//					classACustomerId    = customerVal.getClassACustomerId();
//					sourceCustomerId    = customerVal.getSourceCustomerId();
//
//					if(payloadPartnerId!=null && payloadPartnerId.equalsIgnoreCase(partnerId)){
//						logger.debug("validateModifyCustomerRequest(): Both partnerId matches. Partner Request validation pass");
//					} else{
//				
//						throw new Exception( "Request is not coming from right partner, PartnerId not matches"+ payloadPartnerId + "#"+ Constants.PIM_PARTNER_ID_NOT_MATCHES);
//
//					}
//					if(payloadPartnerId!=null && (payloadPartnerId.equalsIgnoreCase(classACustomerId) || payloadPartnerId.equalsIgnoreCase(sourceCustomerId))){
//						logger.debug("validateModifyCustomerRequest(): Both ClassACustomerId matches. Partner Request validation pass");
//					}else{
//				
//						throw new Exception( "Request is not coming from right partner, PartnerId not matches"+ payloadPartnerId + "#"+ Constants.PIM_PARTNER_ID_NOT_MATCHES);
//					}
//				}
			} else {
				logger.debug( "validateModifyCustomerRequest() This partner is a Super partner, so skip validation");
			}
		} catch(Exception ex){
			logger.error( "validateCreateCustomerRequest(): Caught SQLException : " + ex.getMessage());
	
			throw new Exception( "Caught SQLException : " + ex.getMessage()+ "#" + Constants.PIM_INTERNAL_EXCEPTION);
		}
		logger.debug("validateCreateCustomerRequest(): end");
	}

	private void validateViewOrder(String obj, String id, boolean isSuperPartner) throws Exception {
		logger.debug("validateViewOrder(): start");
		String[] getList = {"PartnerId" , "SAN" ,"OrderId"};
		HashMap<String,String> databyValue = new HashMap<String,String>();
		databyValue = GeneralUtilities.getTagValueFromMsgXML(obj,getList);
		
		try {
			
			
		
			String partnerId =  databyValue.get("PartnerId");
			String orderId = null;

			if( databyValue.get("OrderId") != null) {
				orderId =  databyValue.get("OrderId");
			}

			validatePartnerId(isSuperPartner ,partnerId,id );
//			CustomerValue customerVal = null;

//			if(orderId!=null) customerVal=PIMUtil.getCustomerValueFromOrderId(orderId);

//			if(customerVal != null) {
//				String classACustomerId = customerVal.getClassACustomerId();
//				String sourceCustomerId = customerVal.getSourceCustomerId();
//				if(classACustomerId != null && classACustomerId.equalsIgnoreCase(partnerId) || sourceCustomerId != null && sourceCustomerId.equalsIgnoreCase(partnerId)) {
//					logger.debug( "validateViewOrder(): PartnerId matched with classACustomerId or SourceCustomerId");
//				} else {
//					logger.error("validateViewOrder(): PartnerId not matched with classACustomerId = " + classACustomerId + " or sourceCustomerId = " + sourceCustomerId + ", So Validation fail");
//			
//					throw new Exception("PartnerId not matches with classACustomerId or SourceCustomerId + validation Fail#"+Constants.NOT_ALLOWED_TO_ACCESS_REQUEST);
//				}
//			}
		}  catch(SQLException ex) {
			logger.error("validateViewOrder(): Caught SQLException : " + ex.getMessage());
	
			throw new Exception( "Caught SQLException : " + ex.getMessage() + "#"+Constants.PIM_INTERNAL_EXCEPTION);
		}
		logger.debug( "validateViewOrder(): View Order Request is coming from right partner, Partner Request validation Pass");
		logger.debug("validateViewOrder(): end");
	}


	private boolean matchCustomerPrefixWithSanPrefix(String san, Collection<String> customerPrefixes) throws Exception{
		logger.debug( "matchCustomerPrefixWithSanPrefix(): start ");
		boolean sanMatched = false;
		try
		{
			if(customerPrefixes == null || customerPrefixes.size() <= 0) {
				logger.error( "matchCustomerPrefixWithSanPrefix(): Size of Customer Prefix list is less than or equal to Zero");
	
				throw new Exception("Size of CustomerPrefix list is less than or equal to Zero#"+Constants.NOT_ALLOWED_TO_ACCESS_REQUEST);
			}
			logger.debug("matchCustomerPrefixWithSanPrefix(): Iterate through customer prefix list");

			Iterator<String> i = customerPrefixes.iterator();
			while (i.hasNext()) {
				String custPrefix = (String)i.next();

				if(custPrefix!= null && custPrefix.equalsIgnoreCase(san)) {
					sanMatched = true;
					logger.debug("matchCustomerPrefixWithSanPrefix(): san is matched with customer prefix");
					break;
				}
			}

		} catch(Exception e) {
			logger.error( "matchCustomerPrefixWithSanPrefix(): Caught PIMException : " + e.getMessage());
			throw e;
		}
		logger.info( "matchCustomerPrefixWithSanPrefix(): value of sanMatched flag" + sanMatched);
		logger.debug( "matchCustomerPrefixWithSanPrefix(): end");
		return sanMatched;

	}



	

	private boolean validateSANCharacters(String san) throws Exception {
		logger.debug( "validateSANCharacters(): start ");
		boolean sanValid = false;
		try {
			int sanLength = san.trim().length();
			if(san!= null && sanLength <3){
				logger.error( "validateSANCharacters(): Length of SAN is less than three" + sanLength);
		
				throw new Exception( "SAN Length is less than three characters#"+Constants.SAN_LENGTH_LESS_THAN_THREE);
			} else {

				sanValid = true;
			}

		} catch(Exception pe) {
			logger.debug( "validateSANCharacters(): Caught PIMException : " + pe.getMessage());
			throw pe;
		}
	logger.info( "validateSANCharacters(): value of sanValid flag" + sanValid);
		logger.debug("validateSANCharacters(): end ");
		return sanValid;
	}
	}
		
	