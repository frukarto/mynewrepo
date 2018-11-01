
package com.hughes.bits.esb.custom.utils;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;

import javax.sql.DataSource;

import org.apache.camel.CamelException;
import org.apache.camel.Exchange;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

//import com.jaxb.generated.CustomerValue;
import com.hughes.bits.esb.custom.action.ServiceLocator;
import com.hughes.bits.esb.custom.utils.HeaderValue;
import com.hughes.bits.esb.custom.utils.PartnerValue;
///import com.hughes.bits.esb.custom.action.ServiceLocator;
import com.hughes.bits.esb.custom.utils.ESBAppParameter;

public class PIMUtil {

	static Logger logger = Logger.getLogger(PIMUtil.class);
	static Level level = Level.DEBUG ;
	private static DataSource datasourceObject = null;

	public static void  throwCamelException(String msgcode,String msgstr,Exchange message ) throws CamelException {
		CamelException camelException =  new CamelException("<SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\">"+
				" <SOAP-ENV:Header/>"+
				" <SOAP-ENV:Body>"+
				"  <SOAP-ENV:Fault>"+
				"    <faultcode>SOAP-ENV:Server</faultcode>"+
				"   <faultstring>"+msgcode+":"+msgstr+"</faultstring>"+
				"    <detail><Response><Code>"+msgcode+"</Code><Description>"+msgstr+"</Description></Response></detail>"+
				"    </SOAP-ENV:Fault>"+
				"</SOAP-ENV:Body>"+
				"</SOAP-ENV:Envelope>");
		if(message !=null ){
			message.setProperty(Exchange.EXCEPTION_CAUGHT, camelException);
			message.getIn().setFault(true);
			message.getIn().setBody(camelException);
		}
		throw camelException;

	}


	/**
	 * Generate a error response based on code , message and parameters
	 */
	public String getResponseString(String code, String message,
			List<String> parameters) {
		String params = "<parameters>";
		for (String c : parameters) {
			params = params + "<parameter>" + c + "</parameter>";
		}
		params += "</parameters>";
		String str = "<Response><Code>" + code + "</Code><Description>"
				+ message + "</Description>" + params + "</Response>";
		return str;
	}





	 public static Collection<String> getCustomerPrefixFromPartnerId(String partnerId) throws SQLException {
	        logger.log(level, "getCustomerPrefixFromPartnerId(): start ");
	        String sql = null;
	        Collection<String> customerPrefixes = new ArrayList<String>();
	        Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rset = null;

	        try{
	            String classAcustomerId = getClassACustomerId(partnerId);
	            sql = "select CUSTOMER_PREFIX from CUSTOMER_PREFIX_INFO where CUSTOMER_ID = ?";
	            logger.log(level, "getCustomerPrefixFromPartnerId(): Selected SQL = " + sql);

				conn = getDBConnection();
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, classAcustomerId);
	            rset = ps.executeQuery();
	            if(rset != null) {
	                while(rset.next()) {
	                    String custPrefix =  rset.getString("CUSTOMER_PREFIX");
	                    logger.log(level, "getCustomerPrefixFromPartnerId(): CustomerPrefix obtained is: " + custPrefix);
	                    customerPrefixes.add(custPrefix);
	                }
	            }
	            logger.log(level, "partnerIdFromCustomerPrefix  :partnerId:"+partnerId+" customerPrefixes:"+ customerPrefixes);

	        } catch (SQLException e) {
	            logger.log(level, " getCustomerValueFromSAN(): Exception while executing query:", e);
	            throw e;
	        } finally {
	            closeDBResources(rset, ps, conn);
	        }
	        logger.log(level, "getCustomerPrefixFromPartnerId(): end ");
	        return customerPrefixes;
	    }


	 public static String getClassACustomerId(String sourceCustomerId) throws SQLException {
		 	logger.log(level, "getClassACustomerId(): start");
	        String classAcustomerId = null;
	        String sql = null;
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rset = null;
	        try{
	            sql = "select CLASS_A_CUSTOMER_ID, CUSTOMER_CATEGORY_CD from CUSTOMER where CUSTOMER_ID = ?";
	            logger.log(level,"getClassACustomerId(): Selected SQL = " + sql);
	            con = getDBConnection();
	            ps = con.prepareStatement(sql);
	            ps.setString(1, sourceCustomerId);
	            rset = ps.executeQuery();
	            int customerCategory;
	            if ( rset != null ) {
	                while(rset.next()) {
	                    customerCategory = rset.getInt("CUSTOMER_CATEGORY_CD");

	                    if(customerCategory == 1) {
	                        classAcustomerId = sourceCustomerId;
	                    } else {
	                        classAcustomerId = rset.getString("CLASS_A_CUSTOMER_ID");
	                    }

	                }
	            }

	        } catch (SQLException e) {
	        	logger.log(level," getClassACustomerId(): Exception while executing query:", e);
	            throw new SQLException("SQLException while getting data from DB");
	        } finally {
	            closeDBResources(rset, ps, con);
	        }
	        logger.log(level,"getClassACustomerId(): return ClassA CustomerId is :" + classAcustomerId);
	        return classAcustomerId;
	    }

		/**
		 * Closes the DB resources
		 */
		public static void closeDBResources(Statement ps, Connection con){
			logger.debug(" entering closeDBResources ");
			if (ps != null) {
				try {
					ps.close();
				} catch (Throwable ignore) {}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Throwable ignore) {}
			}
			logger.debug(" exiting closeDBResources ");
		}

		/**
		 * Closes the DB resources
		 */
		public static void closeDBResources(ResultSet rs, Statement ps, Connection con){
			logger.debug(" entering closeDBResources ");
			if (rs != null) {
				try {
					rs.close();
				} catch (Throwable ignore) {}
			}
			closeDBResources(ps, con);
			logger.debug(" exiting closeDBResources ");
		}

		// This method will get CustomerValue DTO (ClassACustomerId and SourceCustomerId) from ORDER_INFO table by orderId
//		public static CustomerValue getCustomerValueFromOrderId(String orderId) throws SQLException, Exception {
//			logger.debug( "getCustomerValueFromOrderId(): start ");
//			CustomerValue customerValue = null;
//			String sql = null;
//			Connection con = null;
//			PreparedStatement ps = null;
//			ResultSet rset = null;
//
//			try{
//				if(!(orderId.matches("[0-9]*"))){
//				//	throw new PIMException(PIMExceptionCode.INVALID_ORDER_ID, "Order ID should be a number");
//					throw new Exception("Order ID should be a number");
//				}
//				sql = "select class_a_customer_id, source_customer_id, business_model from order_info where order_id = ? ";
//				logger.debug( "getCustomerValueFromOrderId(): Selected SQL = " + sql);
//				con = getDBConnection();
//				ps = con.prepareStatement(sql);
//				ps.setString(1, orderId);
//				rset = ps.executeQuery();
//				if(rset != null) {
//					while(rset.next()) {
//						String classACustomerId = rset.getString("class_a_customer_id");
//						String sourceCustomerId = rset.getString("source_customer_id");
//						String businessModel = rset.getString("business_model");
//
//						customerValue = new CustomerValue();
//						customerValue.setClassACustomerId(classACustomerId);
//						customerValue.setSourceCustomerId(sourceCustomerId);
//						customerValue.setBusinessModel(businessModel);
//					}
//				}
//			} catch (SQLException e) {
//				logger.error( " getCustomerValueFromOrderId(): Exception while executing query:", e);
//				throw e;
//			} finally {
//				closeDBResources(rset, ps, con);
//			}
//			logger.info("getCustomerValueFromOrderId(): end ");
//			return customerValue;
//		}


		// This method will get CustomerValue DTO (ClassACustomerId and SourceCustomerId) from ORDER_INFO table by
		// getting orderId from SUBSCRIPTION table by SAN.
//		public static CustomerValue getCustomerValueFromSAN(String san) throws SQLException {
//			logger.debug( "getCustomerValueFromSAN(): start ");
//			CustomerValue customerValue = null;
//			String sql = null;
//			Connection con = null;
//			PreparedStatement ps = null;
//			ResultSet rset = null;
//			try{
//				sql = "select class_a_customer_id, source_customer_id, business_model from order_info where order_id = (select max(order_id) from subscription where san = ?)";
//				logger.debug( "getCustomerValueFromSAN(): Selected SQL = " + sql);
//				con = getDBConnection();
//				ps = con.prepareStatement(sql);
//				ps.setString(1, san);
//				rset = ps.executeQuery();
//				if(rset != null) {
//					while(rset.next()) {
//						String classACustomerId = rset.getString("CLASS_A_CUSTOMER_ID");
//						String sourceCustomerId = rset.getString("SOURCE_CUSTOMER_ID");
//						String businessModel = rset.getString("business_model");
//
//						customerValue = new CustomerValue();
//						customerValue.setClassACustomerId(classACustomerId);
//						customerValue.setSourceCustomerId(sourceCustomerId);
//						customerValue.setBusinessModel(businessModel);
//					}
//				}
//			} catch (SQLException e) {
//				logger.error( " getCustomerValueFromSAN(): Exception while executing query:", e);
//				throw e;
//			} finally {
//				closeDBResources(rset, ps, con);
//			}
//			logger.debug( "getCustomerValueFromSAN(): end ");
//			return customerValue;
//		}


//		public static CustomerValue getCustomerValueFromCustomerId(String customerId) throws SQLException {
//			logger.debug( "getCustomerValueFromCustomerId(): start ");
//			CustomerValue customerValue = null;
//			String sql = null;
//			Connection con = null;
//			PreparedStatement ps = null;
//			ResultSet rset = null;
//			try{
//				sql = "select class_a_customer_id, source_customer_id from customer where customer_id = ?";
//				logger.debug( "getCustomerValueFromCustomerId(): Selected SQL = " + sql);
//				con = getDBConnection();
//				ps = con.prepareStatement(sql);
//				ps.setString(1, customerId);
//				rset = ps.executeQuery();
//				if(rset != null) {
//					while(rset.next()) {
//						String classACustomerId = rset.getString("CLASS_A_CUSTOMER_ID");
//						String sourceCustomerId = rset.getString("SOURCE_CUSTOMER_ID");
//
//						customerValue = new CustomerValue();
//						customerValue.setClassACustomerId(classACustomerId);
//						customerValue.setSourceCustomerId(sourceCustomerId);
//					}
//				}
//			} catch (SQLException e) {
//				logger.error( " getCustomerValueFromCustomerId(): Exception while executing query:", e);
//				throw e;
//			} finally {
//				closeDBResources(rset, ps, con);
//			}
//			logger.debug( "getCustomerValueFromCustomerId(): end ");
//			return customerValue;
//		}

		// make DB connecton
		public static Connection getDBConnection() throws SQLException{
			logger.debug(" entering getDBConnection ");
			Connection con = null;
			try {
				datasourceObject = (DataSource)ServiceLocator.getInstance().getService(System.getProperty("DATASOURCE"));
				con = datasourceObject.getConnection();
			} catch(SQLException sql) {
				logger.error( " getDBConnection(): exception occur while making DB connection", sql);
				throw new SQLException("Failed to make connection with DB");
			} catch (Exception e) {
				e.printStackTrace();
			}
			logger.debug(" exiting getDBConnection ");
			return con;
		}


		 public static String getSANBySerialNumber(String serialNumber) throws SQLException {
		       logger.log(level,"getSANBySerialNumber(): start");
		        Connection con = null;
		        PreparedStatement ps = null;
		        String sql = null;
		        ResultSet rset = null;
		        String san = null;

		        try {
		            sql = "select distinct SAN from SITE where SERIAL_NUMBER = ?";
		           logger.log(level,"getSANBySerialNumber(): Selected SQL = " + sql);
		            con = getDBConnection();
		            ps = con.prepareStatement(sql);
		            ps.setString(1, serialNumber);

		            rset = ps.executeQuery();
		            if (rset!= null) {
		                while (rset.next()) {
		                    san  = rset.getString("SAN");
		                   logger.log(level,"getSANBySerialNumber(): SAN from query : : "+ san);
		                }
		            }
		        } catch (SQLException e) {
		        	logger.log(level,"getSANBySerialNumber(): Caught Exception: : ",e);
		            throw e;
		        } finally {
		            closeDBResources(rset, ps, con);
		        }
		       logger.log(level, "getSANBySerialNumber():: end");
		        return san;
		    }

		 public static boolean isYahsatBusinessModel(String businessModel){
		       logger.log(level,"isYahsatBusinessModel:: Start()");
		       logger.log(level,"isYahsatBusinessModel() " + businessModel);

		        String yahsatBusinessModels = getConfigParameterValueByName(Constants.UNIT_NM_SM,Constants.FEATURE_NM_YAHSAT_ORDERING,Constants.PARAM_NAME_YAHSAT_BUSINESS_MODELS,Constants.PARAM_NAME_YAHSAT_BUSINESS_MODEL_DEF_VAL);
		        boolean isYahsatBusinessModel=false;

		       logger.log(level,"The value of yahsatBusinessModels ==="+yahsatBusinessModels);
		        if(yahsatBusinessModels != null && businessModel != null && !businessModel.equalsIgnoreCase("")){
		            String[] tokens = yahsatBusinessModels.split(",");
		            for (int i = 0; i < tokens.length; i++) {
		                if(businessModel.equalsIgnoreCase(tokens[i].trim())){
		                    isYahsatBusinessModel= true;
		                    break;
		                }
		            }
		        }

		       logger.log(level, "isYahsatBusinessModel():: " + isYahsatBusinessModel);
		        return isYahsatBusinessModel;
		    }

	public static String getConfigParameterValueByName(String unitName,
			String featureName, String paramName, String defaultValue) {
		logger.log(level,"getConfigParameterValueByName(): start");
		logger.log(level,"unitName=" + unitName	+ "featureName=" + featureName + "paramName=" + paramName);

		PreparedStatement ps = null;
		Connection connection = null;
		ResultSet rset = null;
		String query = null;
		String paramValue = defaultValue;

		try {
			query = "SELECT  FEATURE_NAME, UNIT_NAME, PARAMETER_NAME , PARAMETER_VALUE FROM DSS_CONFIG_PARAM"
					+ " WHERE UNIT_NAME=? AND FEATURE_NAME=? AND PARAMETER_NAME=?";

			connection = getDBConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, unitName);
			ps.setString(2, featureName);
			ps.setString(3, paramName);

			rset = ps.executeQuery();
			if (rset != null) {
				while (rset.next()) {
					paramValue = rset.getString("PARAMETER_VALUE");
					if (paramValue == null) {
						logger.log(level,"paramValue is not in DB..setting default value");
						paramValue = defaultValue;
					}
				}
			}
		} catch (SQLException e) {
			logger.log(level,"Error in Fetching Config Parameter Value for parameter= "
							+ paramName + " Returning default Value= "
							+ paramValue, e);
			// returning default value
			return paramValue;
		} finally {
			closeDBResources(rset, ps, connection);
		}

		logger.log(level,"returning paramName= "
				+ paramName + " paramValue= " + paramValue);
		return paramValue;
	}
}


