package com.hughes.bits.esb.custom.action;

import java.io.IOException;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.milyn.Smooks;
import org.milyn.SmooksException;
import org.milyn.container.ExecutionContext;
import org.milyn.payload.StringSource;
import org.milyn.validation.OnFailResult;
import org.milyn.validation.ValidationResult;
import org.xml.sax.SAXException;


public class PimSmooksValidationAction implements Processor {
    
	Smooks smooks = null;
	boolean initialized=false;

	@Override
	public void  process(Exchange message) throws Exception {
		
		if(!initialized){
			 try {
			     smooks = new Smooks((String) message.getProperty("validation-config"));
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			}
		}
        String messageIn = (String )message.getIn().getBody();
        String exceptionCode="210030000";        
        try{
        ValidationResult results  = runSmooks(messageIn);
        if(results !=null && results.getErrors().size() > 0 ){         	
	         StringBuffer sbf = new StringBuffer("");
	         for (OnFailResult result : results.getErrors()) {
	        	sbf.append(result.getMessage()+",");
	          }
	     	String  result = sbf.toString();
  	        result = result.substring(0, result.length()-1);

  	        throw new Exception(result+"#"+exceptionCode);
        
        }
        }catch(Exception e){
        	e.printStackTrace();
        	throw e;
        }
	}

	  ValidationResult runSmooks( String messageIn) throws IOException, SAXException, SmooksException {
	    // Instantiate Smooks with the config...
	 
	    try {
	    	ValidationResult validationResult = new ValidationResult();
	        ExecutionContext executionContext = null;
		    executionContext = smooks.createExecutionContext();
	        smooks.filterSource(executionContext, new StringSource(messageIn), validationResult);
	 
	        return validationResult;
	    }
	    finally {
	    }
	}

   @Override
protected void finalize() throws Throwable {
	   smooks.close();
	super.finalize();
}

 
   
   
}
