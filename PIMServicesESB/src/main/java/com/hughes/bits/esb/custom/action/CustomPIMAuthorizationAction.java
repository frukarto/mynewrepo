package com.hughes.bits.esb.custom.action;


import java.io.StringReader;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.camel.Exchange;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;



import org.switchyard.component.http.composer.HttpComposition;
import org.switchyard.component.http.composer.HttpRequestInfo;
import org.switchyard.security.credential.Credential;
import org.switchyard.security.credential.NameCredential;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;

import com.hughes.bits.esb.custom.utils.AppParameter;
import com.hughes.bits.esb.custom.utils.HeaderValue;
import com.hughes.bits.esb.custom.utils.PartnerValue;
import com.hughes.bits.esb.custom.utils.Constants;


public class CustomPIMAuthorizationAction{

	private static final Logger logger = Logger.getLogger(CustomPIMAuthorizationAction.class);
	static Level level = Level.DEBUG ;
	Pattern transactionCodePattern = Pattern.compile("<[a-zA-Z0-9]*[:]*TransactionCode[^>]*>.*</[a-zA-Z0-9]*[:]*TransactionCode>|<[a-zA-Z0-9]*[:]*messageCode[^>]*>.*</[a-zA-Z0-9]*[:]*messageCode>");
	Pattern partnerIdPattern = Pattern.compile("<[a-zA-Z0-9]*[:]*PartnerId[^>]*>.*</[a-zA-Z0-9]*[:]*PartnerId>|<[a-zA-Z0-9]*[:]*partnerId[^>]*>.*</[a-zA-Z0-9]*[:]*partnerId>");

	String authorizationCode =  null;
	Map<String,String>  transCodeToRequestMap = null;
	public CustomPIMAuthorizationAction(){
		
		 authorizationCode =  System.getProperty("PIMMessageCodeMappingToRequest");
		 transCodeToRequestMap  = returnSplitStringToMap(authorizationCode,",",":");

	}

	public void  process(Exchange message) throws Exception {

		String username =null;
		HeaderValue  headerValue;
		String ipAddress =null;
		String msgType =null;
		boolean authorizationResp;

		try{

			logger.log(level,"Entering process():");
			String messageIn = (String )message.getIn().getBody();


			HttpRequestInfo requestInfo=(HttpRequestInfo) message.getIn().getHeader(HttpComposition.HTTP_REQUEST_INFO);
			Set<Credential> credentials = requestInfo.getCredentials();
			Iterator<Credential> iter =  credentials.iterator();
			Credential obj1 = iter.next();
			Credential obj2 = iter.next();
			NameCredential userCredential  =(NameCredential)  (obj1 instanceof NameCredential ? obj1 : obj2) ;

			username = userCredential.getName();
			
			
			
			if(username== null) {

				throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);
				
			}else {

					String userNameSOAPHeader =  "<esb:userName xmlns:esb=\"esbsoapheader\">"+username+"</esb:userName>";
					logger.log(level,"UserNameHeader:" +   userNameSOAPHeader );

					DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
					factory.setNamespaceAware(true);
					DocumentBuilder builder;
					builder = factory.newDocumentBuilder();
					Document doc = builder.parse( new InputSource( new StringReader( userNameSOAPHeader )) );
					message.getIn().setHeader("{esbsoapheader}userName",doc.getDocumentElement());
			}
			message.setProperty("userName", username);
			logger.log(level,"userName:" +username);


			ipAddress = requestInfo.getRemoteAddr();
			if (ipAddress == null) {

					ipAddress = requestInfo.getLocalAddr();

			}

			logger.log(level,"ipAddress:" +requestInfo.getRemoteAddr());

			if(ipAddress==null)
			{
				throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);

			}
			
			Matcher matcher = transactionCodePattern.matcher(messageIn);
			
				if (matcher.find())
				{
					msgType = matcher.group();
					msgType = msgType.substring( msgType.indexOf(">")+1,msgType.lastIndexOf("</"));
					logger.debug(message.getExchangeId()+" "+msgType);

				}
				String messagePartnerId = "";
				matcher =  partnerIdPattern.matcher(messageIn);
				if (matcher.find())
				{
					messagePartnerId = matcher.group();
					messagePartnerId = messagePartnerId.substring( messagePartnerId.indexOf(">")+1,messagePartnerId.lastIndexOf("</"));
					logger.debug(message.getExchangeId()+"  "+messagePartnerId);

				}
				
				if(msgType!= null && transCodeToRequestMap.containsKey(msgType) ){
					
					String inputRequest = transCodeToRequestMap.get(msgType) ;
					logger.debug("transCodeToRequestMap:" + transCodeToRequestMap.get(msgType) );

					if(!messageIn.contains(inputRequest)){

							String errorMessage = Constants.INVALID_TRANSACTION_INFO+"#"+Constants.INVALID_TRANSACTION_CODE;
							errorMessage =  errorMessage.replace("%0", msgType);
						   throw new Exception(errorMessage);

					} 
		
				} else {
					
					String errorMessage = Constants.INVALID_TRANSACTION_INFO+"#"+Constants.INVALID_TRANSACTION_CODE;
					errorMessage =  errorMessage.replace("%0", msgType);
				   throw new Exception(errorMessage);

				}

	//            msgType = messageIn.substring((messageIn.indexOf(XML_DATA_START) + (XML_DATA_START.length() )), messageIn.indexOf(XML_DATA_END) );
				logger.log(level,"msgType:" +msgType);


				if(msgType==null)
				{
					throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);


				}					
		
			
			String  dbMappedPartner =  AppParameter.getParam("pim_username_partnerid_map",username) ;
		
			if( dbMappedPartner == null ||  !dbMappedPartner.equalsIgnoreCase(messagePartnerId)) {
			throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);
			}

			message.setProperty("msgType", msgType);
			String userAllowedIPList = AppParameter.getParam("pim_username_ipaddress_map",username);
			String userAllowedMsgTypes = AppParameter.getParam("pim_username_msgtypes_map",username);

		    PartnerValue partnerValue = new PartnerValue();
			partnerValue.setUserName(username);
			partnerValue.setPartnerId(AppParameter.getParam("pim_username_partnerid_map",username)); 
			
			
			headerValue = new HeaderValue();
			headerValue.setUserName(username);
			//headerValue.setPassword(password);
			headerValue.setIpList(userAllowedIPList);
			headerValue.setMsgList(userAllowedMsgTypes);
			if(partnerValue != null){
				headerValue.setPartnerId(partnerValue.getPartnerId());
				logger.log(level,"partnerValue: " +partnerValue);
				logger.log(level,"headerValue:  " +headerValue);

			}


			authorizationResp = authorizeRequest(msgType,ipAddress,headerValue);
			if(authorizationResp==false)
			{
				throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);

			}

		
		}
		catch(Exception ex){  
					ex.printStackTrace();
					message.setProperty("Code","401" );
					message.setProperty("Message","Request is not authenticated. Please check the input");
				}
	}
	
	
	public static void authorizeJSON(Exchange message) throws Exception {
		
		String transactionCode =  (String)  message.getProperty("TransactionCode");
		String partnerId =        (String)  message.getProperty("PartnerId");
		HttpRequestInfo requestInfo=(HttpRequestInfo) message.getIn().getHeader(HttpComposition.HTTP_REQUEST_INFO);
		Set<Credential> credentials = requestInfo.getCredentials();
		Iterator<Credential> iter =  credentials.iterator();
		Credential obj1 = iter.next();
		Credential obj2 = iter.next();
		NameCredential userCredential  =(NameCredential)  (obj1 instanceof NameCredential ? obj1 : obj2) ;

		String username = userCredential.getName();
	

		if(username== null || transactionCode  == null || partnerId  == null ) {

			throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);
		} else {

			String userNameSOAPHeader =  "<esb:userName xmlns:esb=\"esbsoapheader\">"+username+"</esb:userName>";
			logger.log(level,"UserNameHeader:" +   userNameSOAPHeader );

			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			factory.setNamespaceAware(true);
			DocumentBuilder builder;
			builder = factory.newDocumentBuilder();
			Document doc = builder.parse( new InputSource( new StringReader( userNameSOAPHeader )) );
			message.getIn().setHeader("{esbsoapheader}userName",doc.getDocumentElement());
			message.setProperty("username", username);
			message.setProperty("userName", username);
	}
		
		String  dbMappedPartner =  AppParameter.getParam("pim_username_partnerid_map",username) ;
		
		if( dbMappedPartner == null ||  !dbMappedPartner.equalsIgnoreCase(partnerId)) {
			throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);
		}
		
		String userAllowedMsgTypes = AppParameter.getParam("pim_username_msgtypes_map",username);
		
		if( userAllowedMsgTypes  == null ||  ! userAllowedMsgTypes.contains(transactionCode)) {
			throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);
		}
		
		
	}
	
	
	public void extractQueryStringToProperties(Exchange message ){
		
		HttpRequestInfo requestInfo=(HttpRequestInfo) message.getIn().getHeader(HttpComposition.HTTP_REQUEST_INFO);
	    Map<String, String> query_pairs = new LinkedHashMap<String, String>();
	    try{
	    	String query =  requestInfo.getQueryString();
			   String[] pairs = query.split("&");
			    for (String pair : pairs) {
			        int idx = pair.indexOf("=");
			        String key = URLDecoder.decode(pair.substring(0, idx), "UTF-8");
			        String value = URLDecoder.decode(pair.substring(idx + 1), "UTF-8");
			        query_pairs.put(key, value);
			        message.setProperty(key, value);
			    }
	    }catch(Exception e ){
	    	e.printStackTrace();
	    	logger.error(message.getExchangeId()+"  "+e.getMessage());
	    }
		
	}


	public boolean authorizeRequest(String msg,String ip, HeaderValue val) throws Exception {
		boolean authRetVal;
		String msgList = val.getMsgList();
		String ipList = val.getIpList();
		authRetVal = false;
		try
		{
			logger.log(level,"Entering authorizeRequest :");
			logger.debug(msg+"    "+ip);
			logger.debug(msgList+"    "+ipList);

			int authFlag = -1;
			authFlag = msgList.indexOf(msg);
			if(authFlag < 0 )
			{
				authRetVal = false;
				throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);
			}
			else
			{
				authRetVal = true;
			}
			authFlag = -1 ;
			if((ipList == null) || (ipList.equals(""))) // IP authorization Fix Start
			{
				authRetVal = true;
			}
			else
			{
				authFlag = ipList.indexOf(ip);
				if(authFlag < 0 )
				{
					authRetVal = false;
					throw new Exception(Constants.AUTHORIZATION_FAILURE+"#"+Constants.AUTHORIZATION_FAILURE_CODE);
				}
				else
				{
					authRetVal = true;
				}
			}
		}
		catch(Exception ex) {
			authRetVal=false;
			throw ex;
		}
		return authRetVal;
	}
	
    HashMap<String,String> returnSplitStringToMap(String data ,String columnSeparator,String tokenSeparator){
    	
		logger.debug(data);
		String[] tokens = data.split(columnSeparator);
		HashMap<String,String> dataMap = new HashMap<String,String>();
		for(String token : tokens ){
			
			String[] namevalueArr =  token.split(tokenSeparator); 
			
			dataMap.put(namevalueArr[0], namevalueArr.length  <  2 ? "" : namevalueArr[1]);
		}
		logger.debug(dataMap);

    	return dataMap;
    }



}




