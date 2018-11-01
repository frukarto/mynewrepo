package com.hughes.bits.esb.custom.action;


import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Pattern;

import javax.inject.Named;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;


import org.apache.camel.Processor;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.switchyard.component.http.composer.HttpComposition;
import org.switchyard.component.http.composer.HttpRequestInfo;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.hughes.bits.esb.custom.action.GeneralUtilities;
import org.switchyard.security.credential.Credential;
import org.switchyard.security.credential.NameCredential;

import javax.xml.soap.MessageFactory;
import javax.xml.soap.Name;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPConstants;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPFault;
import javax.xml.soap.SOAPPart;

import org.apache.camel.CamelException;
import org.apache.camel.Exchange;
import org.apache.camel.Message;
import org.apache.camel.component.http.HttpOperationFailedException;
import org.apache.camel.processor.validation.SchemaValidationException;
import org.apache.cxf.binding.soap.SoapFault;
import org.apache.cxf.transport.http.HTTPException;
import org.switchyard.component.soap.composer.SOAPComposition;
import org.switchyard.component.soap.composer.SOAPFaultInfo;

@Named("pimProcessorAction")
public  class PIMProcessorAction implements Processor {

	private static final Logger logger = Logger.getLogger(PIMProcessorAction.class);
	static Level level = Level.DEBUG ;
	Pattern transactionCodePattern = Pattern.compile("<[a-zA-Z0-9]*[:]*TransactionCode[^>]*>.*</[a-zA-Z0-9]*[:]*TransactionCode>");
	static HashMap<String,String> messageHeader = new HashMap<String,String>();

	static HashMap<String,String>  operationToResponse = new HashMap<String,String>();

	static {

	    operationToResponse.put("StatusRequest", "StatusResponse ");
		operationToResponse.put("SearchOrderRequest", "SearchOrderResponse");
		operationToResponse.put("ViewOrderRequest", "OrderDetailsResponse");
		operationToResponse.put("GetSANByOrderIdRequest", "GetSANByOrderIdResponse");
		operationToResponse.put("ServicePrequalRequest", "ServicePrequalResponse");
		operationToResponse.put("FAPTokenAllocateRequest", "FAPTokenAllocateResponse");
		operationToResponse.put("SearchSiteRequest", "SiteDetailsResponse");
		operationToResponse.put("SearchCustomerRequest", "SearchCustomerResponse");
		operationToResponse.put("ViewCustomerRequest ", "CustomerDetailsResponse");
		operationToResponse.put("EnhancedServicePrequalOp", "EnhancedServicePrequalResponse");
		operationToResponse.put("VerifyAddressRequest", "VerifyAddressResponse");
		operationToResponse.put("GetFSOBySANOrderIdRequest", "GetFSOBySANOrderIdResponse");
		operationToResponse.put("GenerateVoucherBatchRequest", "GenerateVoucherBatchResponse");
		operationToResponse.put("ReverseVoucherRequest", "ReverseVoucherhResponse");
		operationToResponse.put("CheckVoucherStatusRequest", "CheckVoucherStatusResponce");
		operationToResponse.put("ActivateVoucherBatchRequest", "ActivateVoucherBatchResponse");
		operationToResponse.put("DownloadVoucherRequest", "DownloadVoucherResponse");
		operationToResponse.put("CheckVoucherBatchRequest", "CheckVoucherBatchResponse");
		operationToResponse.put("GetBillingDetailsReq", "GetBillingDetailsResp");
		operationToResponse.put("NewOrderReq", "StandardResponse");
		operationToResponse.put("UpgradeOrderRequest", "StandardResponse");
		operationToResponse.put("ModifyOrderRequest", "StandardResponse");
		operationToResponse.put("CreateCustomerRequest", "CustomerStandardResponse");
		operationToResponse.put("ModifyCustomerRequest", "CustomerStandardResponse");
		operationToResponse.put("ExistingCustomerOrderRequest", "StandardResponse");
		operationToResponse.put("ResendNotifications", "StandardResponse");
		operationToResponse.put("CancelOrderRequest", "StandardResponse");
		operationToResponse.put("ChangeServiceStatusRequest", "StandardResponse");

	}

	public static void   extractUserName(Exchange message) throws Exception {

		HttpRequestInfo requestInfo=(HttpRequestInfo) message.getIn().getHeader(HttpComposition.HTTP_REQUEST_INFO);
		Set<Credential> credentials = requestInfo.getCredentials();
		Iterator<Credential> iter =  credentials.iterator();
		Credential obj1 = iter.next();
		Credential obj2 = iter.next();
		NameCredential userCredential  =(NameCredential)  (obj1 instanceof NameCredential ? obj1 : obj2) ;
		message.setProperty("username",userCredential.getName());
		message.setProperty("userName",userCredential.getName());

	}

	public  void   process(Exchange message) throws Exception {
		logger.info("Enter: process");
		String standardResponse = "<StandardResponse xmlns=\"http://www.hns.com/iag/schemas/partner\">"+
				"   <MessageHeader>"+
				"	<TransactionDateTime></TransactionDateTime>"+
				"	<TransactionCode></TransactionCode>"+
				"	<TransactionSequenceId></TransactionSequenceId>"+
				"   </MessageHeader>"+
				"   <Code></Code>"+
				"   <Message></Message>"+
				"   </StandardResponse>" ;

		String body = message.getIn().getBody(String.class)   ;

		String[] dataList = new String[6];
		dataList[0]="TransactionDateTime";
		dataList[1]="TransactionCode";
		dataList[2]="TransactionSequenceId";
		dataList[3]="PartnerId";
		dataList[4]="SAN";
		dataList[5]="OrderId";
		HashMap<String,String> tagNamemap = new HashMap<String,String>() ;
		try{
			 tagNamemap =  getTagValueFromMsgXML(body,dataList);

		}catch(Exception e){

		}

		String  actionStep  = (String) message.getProperty("ActionStep");
		if(actionStep != null && ("Authorization".equals(actionStep) || "Validation".equals(actionStep))){
			Exception exception = message.getProperty(Exchange.EXCEPTION_CAUGHT, Exception.class);
			String[] exceptionMessageArray = errorMessageCode(exception.getMessage());
			tagNamemap.put("Code", exceptionMessageArray[1]);
			tagNamemap.put("Message", exceptionMessageArray[0]);

			standardResponse = replaceTagValue(standardResponse,tagNamemap);

			for(String requestName : operationToResponse.keySet() ){

				 if(body.contains(requestName )){
					 message.setProperty("org.switchyard.operationName", requestName);
				 }
			}

		}else if(actionStep != null && actionStep.equals("BackendAPI") ){
			Exception exception = message.getProperty(Exchange.EXCEPTION_CAUGHT, Exception.class);
			exception.printStackTrace();

			tagNamemap.put("Code", "14000");
			tagNamemap.put("Message", "Our system is currently unable to process your request. If you continue to encounter this message, please call us to place your request. Code PIM 14000");

			standardResponse = replaceTagValue(standardResponse,tagNamemap);


		}

			//Get the operationname  and check if there is any mapping  exist
			String operationName =  (String) message.getProperty("org.switchyard.operationName");
			operationName =  operationName != null ?  operationName.trim(): operationName;
			String operationResponse = operationToResponse.get(operationName);
			logger.debug("Operation Name: "+operationName+"  Response Variable:"+ operationResponse);
			if(operationToResponse.get(operationName) != null ){
				standardResponse = standardResponse.replace("StandardResponse", operationResponse);
			}

			message.getIn().setBody(standardResponse);
			logger.info("Exit: process");
		}


	public static String[] errorMessageCode(String exceptionMessage) {

		String [] exceptionMessageArray = exceptionMessage.split("#");
		return exceptionMessageArray;
	}


	public static void  setMessageHeader(Exchange message) throws Exception {
			logger.info("Enter: getMessageHeader");
			String body = message.getIn().getBody(String.class);

			String[] dataList = new String[5];
			dataList[0]="TransactionDateTime";
			dataList[1]="TransactionCode";
			dataList[2]="TransactionSequenceId";


			messageHeader =  getTagValueFromMsgXML(body,dataList);
		}



	public static void  extractElementToProperties(Exchange message) throws Exception {
		logger.info("Enter: getMessageHeader");
		String body = message.getIn().getBody(String.class);

		String elementList = (String) message.getProperty("ElementList");
		String[] dataList = elementList.split(",");

		HashMap<String,String >elementMap =    getTagValueFromMsgXML(body,dataList);
		logger.debug(message.getExchangeId()+"   "+elementMap);
		 for(String data  : elementMap.keySet() ){
			message.setProperty(data, elementMap.get(data));
		 }

	}

		public static void  tracker(Exchange message) throws Exception {
			logger.info("Enter: Looping over the combinations of Transport and SatelliteID");
				
			try{
		
			Integer iterator = (Integer) message.getProperty("Counter");
			//counter--;
			Integer counter = new Integer(127);
			//int counter = Integer.parseInt(tracker);		
			String body = message.getIn().getBody(String.class);
			ArrayList<String> key_array = new ArrayList<String>();
			String satcheck=null,beamcheck =null;
			
			String elementlistArr = (String) message.getProperty("elementlistArr");
			String[] elementList = elementlistArr.split(",");

			String transname = (String) message.getProperty("transportname");
			//String SLVT_BeamID = (String) message.getProperty("SLVT_BeamID");
			String satelliteid = (String) message.getProperty("SatID");
			//String SLVT_SatelliteID = (String) message.getProperty("SLVT_SatelliteID");
			String repeatingtagArr = (String) message.getProperty("repeatingtagArr");


			HashMap<String,HashMap<String,String>>elementMap =   getArrayElements(body,repeatingtagArr,transname,satelliteid,elementList);
				//logger.debug(message.getExchangeId()+"   "+elementMap);
				counter = elementMap.size();
				counter = counter-iterator;
				
				logger.info("in tracker the finalmap is " + elementMap);
				
				for ( HashMap.Entry entry : elementMap.entrySet()) {
						key_array.add((String) entry.getKey());
					}					
					String key=key_array.get(counter);
					HashMap<String, String> value = elementMap.get(key);
					String tnname = null;
					for ( HashMap.Entry temp :value.entrySet()) {
						String a = (String) temp.getKey();
						if ( a.equals("SatellitedID"))
						{
							satcheck = (String) temp.getValue();					
						}
						if ( a.equals("BeamID")) 	 	 
						{
							beamcheck = (String) temp.getValue();					
						}
						if ( a.equals("TransportName")) 	 	 
						{
							tnname  = (String) temp.getValue();					
						}
						
					}
					
					message.setProperty("SLVT_SatelliteID", satcheck);
					message.setProperty("SLVT_BeamID", beamcheck);
					message.setProperty("TransportName", tnname);
					
					iterator--;
					//String final_count = Integer.toString(counter);	
					message.setProperty("Counter", iterator);
					logger.info("counter is " + iterator);
		}
		
		catch(Exception e){
			e.printStackTrace();
		}

	}
	
	public static void  extractArrayElements(Exchange message) throws Exception {
		logger.info("Enter: getMessageHeader");

		try{
	    Integer counter = new Integer(127);
		String body = message.getIn().getBody(String.class);
		ArrayList<String> Availabilitycheck = new ArrayList<String>();
		String condition ="success_validation";
		
		String elementlistArr = (String) message.getProperty("elementlistArr");
		String[] elementList = elementlistArr.split(",");

		String transname = (String) message.getProperty("transportname");
		
		String satelliteid = (String) message.getProperty("SatID");

		String repeatingtagArr = (String) message.getProperty("repeatingtagArr");


		HashMap<String,HashMap<String,String>>elementMap =   getArrayElements(body,repeatingtagArr,transname,satelliteid,elementList);
		//logger.debug(message.getExchangeId()+"   "+elementMap);
				for ( HashMap.Entry entry : elementMap.entrySet()) {
						System.out.println(entry.getKey() + ", " + entry.getValue());
						HashMap<String,String> subDataMap2 = (HashMap<String, String>) entry.getValue();
						for ( HashMap.Entry temp :subDataMap2.entrySet()) {							
						String a = (String) temp.getKey();
						if ( a.equals("AvailabilityFlag"))
						{
							Availabilitycheck.add((String) temp.getValue());						
						}
						
							String property= entry.getKey()+"_"+temp.getKey();
							property = property.replaceAll("\\s", "");
							message.setProperty(property, temp.getValue());
						}

					}
									
					for (int i=0; i < Availabilitycheck.size(); i++){
					String value= Availabilitycheck.get(i);
					if (value.equalsIgnoreCase("false")){
						condition = "fail_validation";
						break;						
					}
			         
			    }
				logger.info("Availabilitycheck successfull and the values are " + Availabilitycheck);
				counter = elementMap.size();
				logger.info("Counter value initial is " + counter);
				message.setProperty("Counter", counter);
				message.setProperty("Availabilitycheck", condition);
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}

	public static HashMap<String,HashMap<String,String>> getArrayElements(String msgBody, String repeatingtagArr, String transname, String satelliteid, String[] elementList) throws Exception {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setValidating(false);
		factory.setExpandEntityReferences(false);
		factory.setNamespaceAware(false);
		Document doc = null;
		try{
			DocumentBuilder builder = factory.newDocumentBuilder();
			doc = builder.parse(new InputSource(new StringReader(msgBody)));
		} catch(Exception ex) {
			Exception actException = new Exception( "Exception while extracting tagvalues", ex);
			throw actException;
		}

		
		HashMap<String,HashMap<String,String>> finalmap = new HashMap<String,HashMap<String,String>>();
		String dataKey,transport,satID = null,transportname = null;

		NodeList nodeList =  doc.getElementsByTagName("*");
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node indNode = (Node) nodeList.item(i);
			String nodeName =  indNode.getNodeName();
			if(nodeName.indexOf(":")> -1 ){
				nodeName = nodeName.substring(nodeName.indexOf(":")+1);
			 }
			if(repeatingtagArr.equalsIgnoreCase(nodeName)) {    // Here detecting TransportFeasibilityParameters how many times it might appear
				NodeList  childNodeList =  indNode.getChildNodes(); // Getting the childnotes which consists of 5 parameters
					
					HashMap<String,String> subDataMap = new HashMap<String,String>();
					
					for(int j=0; j < childNodeList.getLength();j++ ){ //Going one parameter at a time

						Node childNode = (Node) childNodeList.item(j);
						String childnodeName =  childNode.getNodeName();

							if(childnodeName.indexOf(":")> -1 ){
								childnodeName = childnodeName.substring(childnodeName.indexOf(":")+1);
							 }
							dataKey = childNode.getTextContent();
						
							if (satelliteid.equalsIgnoreCase(childnodeName)){
								satID = dataKey;										
							}																	
							if (transname.equalsIgnoreCase(childnodeName)){
								transportname = dataKey;										
							}
							
							for (String element : elementList){// Checking for all the elements we need to fetch for velocity template
								if (element.equalsIgnoreCase(childnodeName)){								
									subDataMap.put(element, dataKey); 	
									}
								}
						}
					
					transport = transportname +"_" +satID ;
					finalmap.put(transport, subDataMap);
					logger.info("Extraction of elements is successfulls" + finalmap);
				
			}
			 //incrementing the number id of the elements we are fetching
			}
		return finalmap;
	}


		public static void  extractElementToRenameProperty(Exchange message) throws Exception {
		logger.info("Enter: getMessageHeader");

		try{
			String body = message.getIn().getBody(String.class);

			String elementlistArr = (String) message.getProperty("elementlistArr");
			String[] elementList = elementlistArr.split(",");

			String renameProperties = (String) message.getProperty("renameProperties");
			String[] renamePropertiesArr = renameProperties.split(",");

			HashMap<String,String> finalmap = new HashMap<String,String>();

			HashMap<String,String >elementMap = getTagValueForRenameProperty(body,elementList);
			System.out.println(elementMap.values());
			String rp=null;;
			 for ( int a =0; a<renamePropertiesArr.length; a++) {
				 if(renamePropertiesArr[a].indexOf("_")> -1 ){
						 rp = renamePropertiesArr[a].substring(renamePropertiesArr[a].indexOf("_")+1);
					 }
				 for ( HashMap.Entry entry : elementMap.entrySet()){
					 if (entry.getKey().equals(rp)){
						 message.setProperty(renamePropertiesArr[a], entry.getValue());

					 }
				 }
			 }
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}

	public static void  addingpresuffix(Exchange message) throws Exception {
		logger.info("Enter: getMessageHeader");
		logger.info("Starting to add prefix and suffix");

		try{
			String body = (String) message.getProperty("transportandslvtReq");
			String prefix = "<tfs_slvt_resp_merge xmlns:slvt=\"http://slvt.bits.hughes.com\" xmlns:tns1=\"http://transportfeasibility.bits.hughes.com\" xmlns:core=\"http://www.hns.com/iag/schemas/core\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">";
			String suffix="</tfs_slvt_resp_merge>";
			String mergefinal = prefix+body+suffix;


			message.getIn().setBody(mergefinal);
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}

	public static void  finalmerge(Exchange message) throws Exception {
		logger.info("Enter: getMessageHeader");
		logger.info("Merging the Input request and response from xslt");

		try{
			String body = message.getIn().getBody(String.class);
			String inputRequest = (String) message.getProperty("InputRequest");

			StringBuilder transportinformation = new StringBuilder(body);
			String transp_slvt_msg = transportinformation.substring(transportinformation.indexOf("<TransportInformation>"),transportinformation.indexOf("</"+message.getProperty("top_element_name")+">"));
			logger.debug(transp_slvt_msg);
			StringBuilder str = new StringBuilder(inputRequest);
			StringBuilder finalrequesttoSF = null;
			finalrequesttoSF = str.insert(str.indexOf("</PartnerId>")+12, transp_slvt_msg);
			logger.debug(finalrequesttoSF);
			message.getIn().setBody(finalrequesttoSF);

		}
		catch(Exception e){
			e.printStackTrace();
		}

	}
	
		public static void  finalmerge_EPQ(Exchange message) throws Exception {
		logger.info("Enter: getMessageHeader");
		logger.info("Merging the Input request and response from xslt");

		try{
			String body = message.getIn().getBody(String.class);
			String inputRequest = (String) message.getProperty("InputRequest");

			StringBuilder transportinformation = new StringBuilder(body);
			String transp_slvt_msg = transportinformation.substring(transportinformation.indexOf("<TransportInformation>"),transportinformation.indexOf("</"+message.getProperty("top_element_name")+">"));
			logger.debug(transp_slvt_msg);
			StringBuilder str = new StringBuilder(inputRequest);
			StringBuilder finalrequesttoSF = null;
			finalrequesttoSF = str.insert(str.indexOf("</PartnerId>")+12, transp_slvt_msg);
			logger.debug(finalrequesttoSF);
			message.getIn().setBody(finalrequesttoSF);

		}
		catch(Exception e){
			e.printStackTrace();
		}

	}

		public static void  SOAPFault_catch(Exchange exchange) throws Exception {
		logger.info("Enter: Checking if a SOAPFault occurs");
		logger.info("If there is a SOAPFAULT will throw an error.");
		
		SOAPMessage soapMessage = exchange.getIn(SOAPMessage.class); 
		String faultstring = null;
		logger.debug("soapMessage is " + soapMessage);
		
		try{
			Exception ex = (Exception) exchange.getProperty(Exchange.EXCEPTION_CAUGHT,Exception.class);
			if (exchange.getProperty(SOAPComposition.SOAP_FAULT_INFO) != null) {
				SOAPBody soapBody = soapMessage.getSOAPPart().getEnvelope().getBody();
				SOAPFault fault = soapBody.getFault();
				faultstring = fault.getFaultString();
				logger.debug("faultstring is " + faultstring);							
				exchange.setProperty("Code","2010021" );
				exchange.setProperty("Message","Invalid Login with Salesforce" );
				return;
			}		 
		}
		catch(Exception ex){
					ex.printStackTrace();						
			}
	}

	public static void  processSOAPFaultError(Exchange exchange) throws Exception {
		logger.info("Enter: Checking if a SOAPFault occurs");
		logger.info("If there is a SOAPFAULT will throw an error.");


		try{
			SOAPFaultInfo faultinfo = null;
		   if (exchange.getProperty(SOAPComposition.SOAP_FAULT_INFO) != null) {

							faultinfo = exchange.getProperty(SOAPComposition.SOAP_FAULT_INFO, SOAPFaultInfo.class);
							String faultstring =  faultinfo.getString() ;
						    logger.debug("faultstring is " + faultstring);
							String faultcode = faultinfo.getCode();
							logger.debug("faultcode is " + faultcode);
							if(faultcode != null ) {
									exchange.setProperty("Code","210020003" );
									exchange.setProperty("Message","SoapFault occurred in Backend Service [" +faultstring+"]");
							}
			}

		}
		catch(Exception ex){
					ex.printStackTrace();
			}
	}



	private static HashMap<String, String> getTagValueForRenameProperty(String msgBody, String[] elementList) throws Exception {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setValidating(false);
		factory.setExpandEntityReferences(false);
		factory.setNamespaceAware(true);
		Document doc = null;
		try{
			DocumentBuilder builder = factory.newDocumentBuilder();
			doc = builder.parse(new InputSource(new StringReader(msgBody)));
		} catch(Exception ex) {
			Exception actException = new Exception( "Exception while extracting tagvalues", ex);
			throw actException;
		}

		String tagValue = null;
		HashMap<String,String> tagNameValueMap = new HashMap<String,String>();
		NodeList nodeList = doc.getElementsByTagName("*");
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node indNode = nodeList.item(i);
			for(String tagName: elementList){
				if (indNode.getNodeType() == Node.ELEMENT_NODE) {
					 String nodeName = indNode.getNodeName();
					 if(nodeName.indexOf(":")> -1 ){
						 nodeName = nodeName.substring(nodeName.indexOf(":")+1);
//						 logger.debug(tagName+"   "+nodeName);
					 }
					if(nodeName.equalsIgnoreCase(tagName)){

						tagValue = indNode.getTextContent();
						tagNameValueMap.put(tagName, tagValue);
					}
				}
			}
		}
		return tagNameValueMap;
	}


public static void  extractJSONArrayToMap(Exchange message ) throws Exception {

	logger.info("Enter: getMessageHeader");
	String body = message.getIn().getBody(String.class);

	HashMap<String,String>  configMap =  new HashMap<String,String>();

	String elementList = (String) message.getProperty("configList");
	String[] dataList = elementList.split(",");

	for(String data :  dataList ){
		String[] nameValueArr =   data.split(":");
		configMap.put(nameValueArr[0], nameValueArr[1]);
	}


	String filterKey = (String)   message.getProperty("filterkey");
	String  arrayName =  configMap.get("ArrayName");
	String  key =  configMap.get("key");

	HashMap<String,HashMap<String,String>> dataMap  = new HashMap<String,HashMap<String,String>>();

	JSONObject  obj  =  new  JSONObject(body) ;
	obj =   obj.getJSONObject("result");
	JSONArray   jsonArr = obj.getJSONArray(configMap.get("ArrayName"));
	String extractProperties =  configMap.get("extractProperties");
	String[]  props = extractProperties.split("\\^");
	String datakey = "" ;
	for(int i =0; i< jsonArr.length(); i++ ){
		HashMap<String,String> subDataMap = new HashMap<String,String>();

		JSONObject element = (JSONObject)   jsonArr.get(i);
		datakey = JSONObject.valueToString(element.get(key));
		for(String prop: props ){
			String value = "" ;
			try{
			   value =    JSONObject.valueToString(element.get(prop)) ;
			   value =  value.replace("\"", "");
			}catch(Exception e){}
			subDataMap.put(prop, value);
		}
		dataMap.put(datakey, subDataMap);
	}

	message.setProperty(arrayName, dataMap);
	if(filterKey != null &&  dataMap.get(filterKey) != null )
	for(String dataKey : dataMap.get(filterKey).keySet() ){
		System.out.println(filterKey+"   filter_"+dataKey+"   "+dataMap.get(filterKey).get(dataKey));
		message.setProperty("filter_"+dataKey, dataMap.get(filterKey).get(dataKey));


	}


}

public static void checkMandatoryParametersinProperties(Exchange message ){
  try{

		String elementList = (String) message.getProperty("MandatoryParameterList");
		String[] dataList = null ;
			if (elementList.contains(","))
				dataList = elementList.split(",");
			else {
				dataList = new String[1];
				dataList[0] = elementList;
			}

		String  MandatoryCheck =  "true";
		String  MandatoryParametersFailed =  "";

		for(String data:  dataList ){
			String element = String.valueOf(message.getProperty(data));
			if( ! message.getProperties().containsKey(data) || element.isEmpty()){
				MandatoryCheck = "false" ;
				MandatoryParametersFailed = MandatoryParametersFailed +","+data;
			}
		}
		if(!MandatoryParametersFailed.isEmpty())
			MandatoryParametersFailed =	MandatoryParametersFailed.substring(1);  //remove comma

		message.setProperty("MandatoryCheck", MandatoryCheck);
		message.setProperty("MandatoryParametersFailed","["+ MandatoryParametersFailed+"]");

		logger.debug(message.getExchangeId()+"   "+MandatoryCheck);
		logger.debug(message.getExchangeId()+"   "+MandatoryParametersFailed);


  }catch(Exception e){
	  e.printStackTrace();
		message.setProperty("MandatoryCheck", "false");

  }
}

public static void  extractJSONToProperties(Exchange message) throws Exception {
	logger.info("Enter: getMessageHeader");
	String body = message.getIn().getBody(String.class);

	String elementList = (String) message.getProperty("ElementList");
	String[] dataList = elementList.split(",");



	HashMap<String,String >elementMap =    getTagValuesFromJSON(body,dataList);
	logger.debug(message.getExchangeId()+"   "+elementMap);
	 for(String data  : elementMap.keySet() ){
		message.setProperty(data, elementMap.get(data));
	 }

}
	public static void   appendMessageHeader(Exchange message) throws Exception {

		String body = message.getIn().getBody(String.class);
		SimpleDateFormat  sdf = new SimpleDateFormat(System.getProperty("PIMDateFormat") );
		String dateAsString =   sdf.format(new Date());
		String header = "<MessageHeader>"+
				"	<TransactionDateTime>"+dateAsString+"</TransactionDateTime>"+
				"	<TransactionCode>"+message.getProperty("TransactionCode")+"</TransactionCode>"+
				"	<TransactionSequenceId>"+message.getProperty("TransactionSequenceId")+"</TransactionSequenceId>"+
				"   </MessageHeader>";

		int index = body.lastIndexOf("<Code>");
		if(index >= 0&& index<body.length()){
		String finalMessage =  body.substring(0, index) + header + body.substring(index);

			System.out.println("body1"+finalMessage);

			finalMessage = replaceTagValue(finalMessage,messageHeader);
			System.out.println("body2"+finalMessage);

			message.getIn().setBody(finalMessage);
		}
	}

	public static void   extractNameValueToProperties(Exchange message) throws Exception {

		String body = message.getIn().getBody(String.class);

		String parentTag = (String) message.getProperty("parenttag");
		String keyTag = (String) message.getProperty("keytag");
		String valueTag = (String) message.getProperty("valuetag");
		String selectedKeys = (String) message.getProperty("selectedKeys");
		String  selectedKeyArr[] =  selectedKeys.split(",");
		List<String>  selectedKeyList = (List<String>) Arrays.asList(selectedKeyArr);

		HashMap<String,String > elementMap =    getNameValueFromXMLString(body,parentTag,keyTag,valueTag,true);
		logger.debug(message.getExchangeId()+"   "+elementMap);
		 for(String data  : elementMap.keySet() ){
			 if(selectedKeyList.contains(data))
			   message.setProperty(data, elementMap.get(data));
		 }
		}

	public static String replaceTagValue(String msgBody, HashMap<String,String> tagNameValueMap ) throws Exception {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setValidating(false);
		factory.setExpandEntityReferences(false);
		factory.setNamespaceAware(true);
		Document doc = null;
		try{
			DocumentBuilder builder = factory.newDocumentBuilder();
			doc = builder.parse(new InputSource(new StringReader(msgBody)));
		} catch(Exception ex) {
			Exception actException = new Exception( "Exception while replacing tagvalues", ex);
			throw actException;
		}
		NodeList nodeList = doc.getElementsByTagName("*");
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node indNode = nodeList.item(i);
			for(String tagnameValue:tagNameValueMap.keySet() ){
				 String nodeName = indNode.getNodeName();
				 if(nodeName.indexOf(":")> -1 ){
					 nodeName = nodeName.substring(nodeName.indexOf(":")+1);
					 logger.debug(tagnameValue+"   "+nodeName);
				 }
				if (indNode.getNodeType() == Node.ELEMENT_NODE  && tagnameValue.equalsIgnoreCase(nodeName) ) {
					indNode.setTextContent(tagNameValueMap.get(tagnameValue));
				}
			}
		}
		String response = null;
		response = new GeneralUtilities().convertDocumentToString(doc, null);
		return response;

	}

	public static HashMap<String,String> getTagValueFromMsgXML(String msgBody, String[] tagNameList) throws Exception {

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setValidating(false);
		factory.setExpandEntityReferences(false);
		factory.setNamespaceAware(true);
		Document doc = null;
		try{
			DocumentBuilder builder = factory.newDocumentBuilder();
			doc = builder.parse(new InputSource(new StringReader(msgBody)));
		} catch(Exception ex) {
			Exception actException = new Exception( "Exception while extracting tagvalues", ex);
			throw actException;
		}

		String tagValue = null;
		HashMap<String,String> tagNameValueMap = new HashMap<String,String>();
		NodeList nodeList = doc.getElementsByTagName("*");
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node indNode = nodeList.item(i);
			for(String tagName: tagNameList){
				if (indNode.getNodeType() == Node.ELEMENT_NODE) {
					 String nodeName = indNode.getNodeName();
					 if(nodeName.indexOf(":")> -1 ){
						 nodeName = nodeName.substring(nodeName.indexOf(":")+1);
//						 logger.debug(tagName+"   "+nodeName);
					 }
					if(nodeName.equalsIgnoreCase(tagName)){
						 logger.debug("match:  "+nodeName);
						tagValue = indNode.getTextContent();
						tagNameValueMap.put(tagName, tagValue);
					}
				}
			}
		}
		return tagNameValueMap;
	}


	public static HashMap<String,String> getTagValuesFromJSON(String jsonStr, String[] tagNameList) throws Exception {



		String tagValue = null;
		HashMap<String,String> tagNameValueMap = new HashMap<String,String>();
	     JSONObject jsonObj =  new JSONObject(jsonStr);
	     JSONObject parentjsonObj =  new JSONObject(jsonStr);





	    for(String tagName :  tagNameList){

	    	String[]  elementNameList =  tagName.split("/");
	    	int i=0;
		     JSONObject childObj =  null ;
		     tagValue = "" ;
	    	for(; i < elementNameList.length -1  ;i++ ) {
		    	try{
		    		if(i ==0 )
		    			childObj = jsonObj.getJSONObject(elementNameList[0]);
		    		else
		    		childObj =  childObj.getJSONObject(elementNameList[i]);

		    	}catch(Exception e){
		    		break;
		    	}

	    	}

	    	String name ;
    		String type = null  ;
    		if(elementNameList[i].contains(":")){
    			String[] tempdata = elementNameList[i].split(":");
    			name =  tempdata[0];
    			type =  tempdata[1] ;
    		}else {
    			name =  elementNameList[i] ;
    		}

	    	if(childObj != null ){

	    	if(type == null )
	    	tagValue = childObj.getString(name  );
	    	else  if(type.equalsIgnoreCase("int") )
		    	tagValue = childObj.getInt(name) + "";
	    	else  if(type.equalsIgnoreCase("long") )
		    	tagValue = childObj.getLong(name) + "";

	    	tagName =  name;
	    	} else {
				try {
					if(type == null )
				    	tagValue = parentjsonObj.getString(name  );
				    	else  if(type.equalsIgnoreCase("int") )
					    	tagValue = parentjsonObj.getInt(name) + "";
				    	else  if(type.equalsIgnoreCase("long") )
					    	tagValue = parentjsonObj.getLong(name) + "";

					  tagName =  name;

				} catch (Exception e) {
					// TODO: handle exception
					continue;
				}
			}

	    	if(tagValue == null )  tagValue = "";
	    	tagNameValueMap.put(tagName, tagValue);
	    }

		return tagNameValueMap;
	}


public static HashMap<String,String> getNameValueFromXMLString(String msgBody, String parentTag,String name,String value,boolean removeSpacesFromKey ) throws Exception {

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setValidating(false);
		factory.setExpandEntityReferences(false);
		factory.setNamespaceAware(true);
		Document doc = null;
		try{
			DocumentBuilder builder = factory.newDocumentBuilder();
			doc = builder.parse(new InputSource(new StringReader(msgBody)));
		} catch(Exception ex) {
			Exception actException = new Exception( "Exception while extracting tagvalues", ex);
			throw actException;
		}

    	HashMap<String,String> tagNameValueMap = new HashMap<String,String>();
		NodeList nodeList = doc.getElementsByTagName(parentTag);
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node indNode = nodeList.item(i);
			logger.debug("Parent :"+indNode.getNodeName());
			NodeList  childNodeList =  indNode.getChildNodes();

			String dataKey = null ;
			String dataValue ="";
			for(int j=0; j < childNodeList.getLength();j++ ){
				Node childNode = childNodeList.item(j);
				logger.trace(j+" Child:"+childNode.getNodeName());
				String nodeName =  childNode.getNodeName();
				if(nodeName.indexOf(":")> -1 )
				nodeName =  nodeName.substring(nodeName.indexOf(":")+1);

				if(name.equalsIgnoreCase(nodeName) ){
					dataKey = childNode.getTextContent();
					if(removeSpacesFromKey)
						dataKey=	dataKey.replaceAll("\\s+","");
				}
				if(value.equalsIgnoreCase(nodeName) ){
					dataValue = childNode.getTextContent();
				}
			}
			if(dataKey !=null)
			tagNameValueMap.put(dataKey, dataValue);


		}
		return tagNameValueMap;
	}


public void  createTask(Exchange exchange ) throws Exception {


}

public void  persistExchange(Exchange exchange ) throws Exception {

	String body =  (String)  exchange.getIn().getBody(java.lang.String.class);
	String exchangeId = exchange.getExchangeId();
	Map<String,Object> properties =  exchange.getProperties();
	Map<String,Object> headers =  exchange.getIn().getHeaders();

	StringBuffer propertiesStr =  new StringBuffer() ;
	for(String key : properties.keySet() ){
		if(key.equalsIgnoreCase("CamelMessageHistory")) continue;
		String value =  properties.get(key).toString();
		propertiesStr.append(key+":::"+value+"###");
	}

	String selectHeaders = "" ;
   if(exchange.getProperty("SELECT_HEADERS")!=null ){
	   selectHeaders =  (String) exchange.getProperty("SELECT_HEADERS") ;
	}

	StringBuffer headerStr =  new StringBuffer() ;
	for(String key : headers.keySet() ){
		String value =  headers.get(key).toString();
		if(! selectHeaders.isEmpty()  ){
			if(selectHeaders.toLowerCase().contains(key.toLowerCase()))
				headerStr.append(key+":::"+value+"###");
		}

		else   headerStr.append(key+":::"+value+"###");

	}


	Connection dbConnection = null;
	PreparedStatement statement = null;

	Context initialContext = new InitialContext();

	DataSource datasource = (DataSource) initialContext.lookup(System.getProperty("DATASOURCE"));
	try {
		dbConnection = datasource.getConnection();
		dbConnection.setAutoCommit(false);
		String sql = "insert into  esb_message(message_id,body,properties,headers,endpoint,CREATED_DATE) values(?,?,?,?,?,?)" ;

		statement = dbConnection.prepareStatement(sql);
		statement.setString(1, exchangeId);
		statement.setString(2, body);
		statement.setString(3, propertiesStr.toString());
		statement.setString(4, headerStr.toString());
		statement.setString(5, (String) exchange.getProperty("ESB_MESSAGE_ENDPOINT"));
		statement.setTimestamp(6, new java.sql.Timestamp(( new java.util.Date() ).getTime()));

		// execute select SQL stetement
		statement.executeQuery();
		dbConnection.commit();


	} catch (SQLException e) {
		e.printStackTrace();
	} finally {

		if (statement != null) {
			try{ statement.close();  }catch(Exception e ) {}
		}

		if (dbConnection != null) {
			try{ dbConnection.close();  }catch(Exception e ) {}

		}

	}

}


public void  persistTask(Exchange exchange ) throws Exception {

	String exchangeId = exchange.getExchangeId();


	Connection dbConnection = null;
	PreparedStatement statement = null;

	Context initialContext = new InitialContext();

	DataSource datasource = (DataSource) initialContext.lookup(System.getProperty("DATASOURCE"));
	try {
		dbConnection = datasource.getConnection();
		dbConnection.setAutoCommit(false);
		String sql = "INSERT INTO task(TASK_SEQUENCE_ID,         ATTRIBUTE     ,ATTRIBUTE_VALUE,RETRY_COUNT,TASK_NAME,TASK_STATE,SERVER_LABEL,CREATION_DATE,ENTITY,TASK_EXECUTION_DATE,TASK_GROUP,PRIORITY)  VALUES"
				+ "   (task_sequence.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?) " ;

		statement = dbConnection.prepareStatement(sql);
		statement.setString(1, "message_id");
		statement.setString(2, exchangeId);
		statement.setInt(3,  4);
		statement.setString(4, exchange.getProperty("TASK_EXECUTABLE") != null ? (String) exchange.getProperty("TASK_EXECUTABLE") : "com.hns.processor.monitor.executable.ESBServiceExecutable");
		statement.setInt(5,  0);
		statement.setString(6, "ALL");
		statement.setTimestamp(7, new java.sql.Timestamp(( new java.util.Date() ).getTime()));
		statement.setString(8, (String) exchange.getProperty("SUCCESS_CONTENT_CHECK"));
		statement.setTimestamp(9,  exchange.getProperty("TASK_EXECUTION_DATE") != null ? (java.sql.Timestamp)   exchange.getProperty("TASK_EXECUTION_DATE")   :     new java.sql.Timestamp(( new java.util.Date() ).getTime()));
		statement.setString(10, (String) exchange.getProperty("TASK_GROUP") );
		String priority =  (String) exchange.getProperty("TASK_PRIORITY") != null ? (String) exchange.getProperty("TASK_PRIORITY") : "0" ;
		statement.setInt(11, Integer.parseInt(priority) );

		// execute select SQL stetement
		statement.executeQuery();
		dbConnection.commit();


	} catch (SQLException e) {
		e.printStackTrace();
	} finally {

		if (statement != null) {
			statement.close();
		}

		if (dbConnection != null) {
			dbConnection.close();
		}

	}

}
	public static void  addpresuffix(Exchange message) throws Exception {
		logger.info("Enter: getMessageHeader");
		logger.info("Starting to add prefix and suffix");

		try{
			String body = (String) message.getProperty("merge_resp");
			String prefix="<VOR_MergeResponse xmlns:n1=\"http://www.hns.com/iag/schemas/partner\" xmlns:tns=\"http://soap.sforce.com/schemas/class/PartnersOrder\" xmlns:core=\"http://www.hns.com/iag/schemas/core\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">";
			String suffix="</VOR_MergeResponse>";
			String mergefinal = prefix+body+suffix;
			message.getIn().setBody(mergefinal);
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}


}