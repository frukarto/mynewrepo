package com.hughes.bits.esb.custom.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Named;

import org.apache.camel.CamelException;
import org.apache.camel.Exchange;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.hughes.bits.esb.custom.utils.AppParameter;

@Named("PIMErrorMappingAction")
public class PIMErrorMappingAction {
	
	static Pattern  errormsgDelimitPattern = Pattern.compile("\\[(.*?)\\]");


	private static final Logger logger = Logger.getLogger(PIMErrorMappingAction.class);
	static Level level = Level.DEBUG;

	public static void process(Exchange message) throws Exception {
		
		logger.info(message.getExchangeId() + "....... inside process\n");
		String body = message.getIn().getBody(String.class);
		logger.info(message.getExchangeId() + "....... inside body\n" + body);
		String operationName = (String) message.getProperty("org.switchyard.operationName");
		
		SimpleDateFormat  sdf = new SimpleDateFormat(System.getProperty("PIMDateFormat") );
		String dateAsString =   sdf.format(new Date());
		message.setProperty("TransactionDateTime", dateAsString);
	    if(message.getProperty("CamelExceptionCaught") != null && message.getProperty("CamelExceptionCaught") instanceof CamelException  ){
	    	CamelException camelEx = (CamelException)  message.getProperty("CamelExceptionCaught");
	    	String exceptionMessage  = camelEx.getMessage();
	    	exceptionMessage =  exceptionMessage.substring(exceptionMessage.indexOf("<"));
	    	String[] dataList = new String[6];
			dataList[0] = "faultcode";
			dataList[1] = "faultstring";
			dataList[2] = "errorCode";
			dataList[3] = "errorMessage";
			dataList[4] = "Code";
			dataList[5] = "Message";
			HashMap<String, String> tagNamemap1 = PIMProcessorAction.getTagValueFromMsgXML(body, dataList);
			logger.debug(message.getExchangeId()+"   "+tagNamemap1);

	    }

		String standardResponse = "<StandardResponse xmlns=\"http://www.hns.com/iag/schemas/partner\">"
				+ "   <MessageHeader>" + 
				"	<TransactionDateTime>"+dateAsString+"</TransactionDateTime>"
				+ "	<TransactionCode>"+message.getProperty("TransactionCode")+"</TransactionCode>" + 
				"	<TransactionSequenceId>"+message.getProperty("TransactionSequenceId")+"</TransactionSequenceId>"
				+ "   </MessageHeader>"
				+ "   <Code></Code>"
				+ "   <Message></Message>" 
				+ "   </StandardResponse>";
	
		 HashMap<String, String> tagNamemap = null;

		
//		 if (message.getProperty("isException") == null) {


			// success or failure scenario where there is no exception

			String[] dataList = new String[4];
			dataList[0] = "TransactionCode";
			dataList[1] = "TransactionSequenceId";
			dataList[2] = "Code";
			dataList[3] = "Message";

			tagNamemap = PIMProcessorAction.getTagValueFromMsgXML(body, dataList);
			logger.info(message.getExchangeId() + ".......tagNamemap   "+tagNamemap);

			if (tagNamemap.get("Code") == null) {
				
				
				logger.info(message.getExchangeId() + "....... inside success/failure  with no errorcode mapping   \n");

				// NULL errorcode from backend system

				tagNamemap.put("Code", "14000");
				tagNamemap.put("Message", 	"Our system is currently unable to process your request. If you continue to encounter this message, please call us to place your request. Code PIM 14000");

				standardResponse = PIMProcessorAction.replaceTagValue(body, tagNamemap);


			} else {
				
				logger.info(message.getExchangeId() + "....... inside success/failure  with  errorcode mapping   \n");

				// NOT NULL errorcode from backend system

				String errorCodebyDBMapping = AppParameter.getParam("pim_errorcode_popmapping_map",		tagNamemap.get("Code"));
				String errorMsgbyDBMapping = AppParameter.getParam("pim_errorcode_msg_map", errorCodebyDBMapping);
				String overrideDBMsg  =  AppParameter.getParam("pim_errorcode_override_map", tagNamemap.get("Code") );
				logger.info(message.getExchangeId() + ".......  errorCodebyDBMapping   "+errorCodebyDBMapping);
				logger.info(message.getExchangeId() + ".......  errorMsgbyDBMapping   "+ errorMsgbyDBMapping);
				String errorMessageFromBackend =  tagNamemap.get("Message");
				
				if(errorCodebyDBMapping == null || errorCodebyDBMapping != null && errorCodebyDBMapping.equals("") ){
				tagNamemap.put("Code", "14000");
				tagNamemap.put("Message", 	"Our system is currently unable to process your request. If you continue to encounter this message, please call us to place your request. Code PIM 14000");

				standardResponse = PIMProcessorAction.replaceTagValue(body, tagNamemap);

					
				}else 
				
				if(overrideDBMsg != null &&  overrideDBMsg.equalsIgnoreCase("Y")){
				  //	errorMsgbyDBMapping = 	tagNamemap.get("Message");
				  //Make the message passthrough 
					logger.info(message.getExchangeId() + ".......  overrideDBMsg   "+ overrideDBMsg);
					HashMap<String,String> tempMap  = new HashMap<String,String>();
					tempMap.put("Code", errorCodebyDBMapping);
					logger.info(message.getExchangeId() + "Before.......  standardResponse   "+ body);

					standardResponse = PIMProcessorAction.replaceTagValue(body, tempMap);
					logger.info(message.getExchangeId() + "After.......  standardResponse   "+ standardResponse);
	

				}else 				
				if(errorCodebyDBMapping != null ){
					
				
					errorMsgbyDBMapping  =   GeneralUtilities.regularExpressionTemplateStringReplacement(errorMessageFromBackend, errorMsgbyDBMapping, errormsgDelimitPattern);
					
					tagNamemap.put("Code", errorCodebyDBMapping);
					tagNamemap.put("Message", errorMsgbyDBMapping);
					standardResponse = PIMProcessorAction.replaceTagValue(body, tagNamemap);

				}


			}
			message.getIn().setBody(standardResponse);
			return;

			

	}
	
	
}
