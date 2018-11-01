<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" exclude-result-prefixes="soap tns xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/tns:CreateCustomerRequestResponse">
			<CustomerStandardResponse>
				<xsl:for-each select="tns:result">
					<xsl:for-each select="tns:MessageHeader">
						<MessageHeader>
							<xsl:for-each select="tns:TransactionDateTime">
								<TransactionDateTime>
									<xsl:value-of select="."/>
								</TransactionDateTime>
							</xsl:for-each>
							<xsl:for-each select="tns:TransactionCode">
								<TransactionCode>
									<xsl:value-of select="."/>
								</TransactionCode>
							</xsl:for-each>
							<xsl:for-each select="tns:TransactionSequenceId">
								<TransactionSequenceId>
									<xsl:value-of select="."/>
								</TransactionSequenceId>
							</xsl:for-each>
							<xsl:for-each select="tns:CorrelationTransactionId">
								<CorrelationTransactionId>
									<xsl:value-of select="."/>
								</CorrelationTransactionId>
							</xsl:for-each>
						</MessageHeader>
					</xsl:for-each>
					<xsl:for-each select="tns:CustomerId">
						<CustomerId>
							<xsl:value-of select="."/>
						</CustomerId>
					</xsl:for-each>
					<xsl:for-each select="tns:Code">
						<Code>
							<xsl:value-of select="."/>
						</Code>
					</xsl:for-each>
					<xsl:for-each select="tns:Message">
						<Message>
							<xsl:value-of select="."/>
						</Message>
					</xsl:for-each>
					<xsl:for-each select="tns:UserName">
						<UserName>
							<xsl:value-of select="."/>
						</UserName>
					</xsl:for-each>
					<xsl:for-each select="tns:Password">
						<Password>
							<xsl:value-of select="."/>
						</Password>
					</xsl:for-each>
					<xsl:for-each select="tns:LoginURL">
						<LoginURL>
							<xsl:value-of select="."/>
						</LoginURL>
					</xsl:for-each>
					<xsl:for-each select="tns:RequestType">
						<RequestType>
							<xsl:value-of select="."/>
						</RequestType>
					</xsl:for-each>
				</xsl:for-each>
			</CustomerStandardResponse>
		</xsl:template>
	</xsl:stylesheet>
