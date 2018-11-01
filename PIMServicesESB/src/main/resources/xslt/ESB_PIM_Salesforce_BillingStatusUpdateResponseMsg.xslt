<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core2="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/dssbilling" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" exclude-result-prefixes="core2 n1 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="n1:BillingStatusUpdateResponseMsg">
			<StandardResponse>
					<xsl:choose>
						<xsl:when test="n1:Status= 'true' ">						
							<Code>API1000</Code>
							<Message>ChangeServiceStatus is successful</Message>
					    </xsl:when>
					    <xsl:otherwise>
					      <xsl:for-each select="n1:ErrorCode">
					        <Code>
								<xsl:value-of select="."/>						
							</Code>					      
					      </xsl:for-each>	
					      	 <xsl:for-each select="n1:ErrorMessage">
					    	 	<Message>
								<xsl:value-of select="."/>
							</Message>					    	 
					    	 </xsl:for-each>											  
						</xsl:otherwise>
                    </xsl:choose>				
			</StandardResponse>
		</xsl:template>
	</xsl:stylesheet>
