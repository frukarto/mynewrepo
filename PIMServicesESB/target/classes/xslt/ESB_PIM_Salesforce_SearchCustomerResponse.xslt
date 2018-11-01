<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" exclude-result-prefixes="soap tns xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/tns:SearchCustomerRequestResponse">
			<SearchCustomerResponse>
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
					<xsl:for-each select="tns:CustomerList">
						<CustomerList>
							<xsl:for-each select="tns:CustomerId">
								<CustomerId>
									<xsl:value-of select="."/>
								</CustomerId>
							</xsl:for-each>
							<xsl:for-each select="tns:CompanyName">
								<CompanyName>
									<xsl:value-of select="."/>
								</CompanyName>
							</xsl:for-each>
							<xsl:for-each select="tns:ContactName">
								<ContactName>
									<xsl:for-each select="tns:FirstName">
										<FirstName>
											<xsl:value-of select="."/>
										</FirstName>
									</xsl:for-each>
									<xsl:for-each select="tns:MiddleName">
										<MiddleName>
											<xsl:value-of select="."/>
										</MiddleName>
									</xsl:for-each>
									<xsl:for-each select="tns:LastName">
										<LastName>
											<xsl:value-of select="."/>
										</LastName>
									</xsl:for-each>
									<xsl:for-each select="tns:LastNameSuffix">
										<LastNameSuffix>
											<xsl:value-of select="."/>
										</LastNameSuffix>
									</xsl:for-each>
								</ContactName>
							</xsl:for-each>
							<xsl:for-each select="tns:ContactPhone">
								<ContactPhone>
									<xsl:for-each select="tns:AreaCode">
										<AreaCode>
											<xsl:value-of select="."/>
										</AreaCode>
									</xsl:for-each>
									<xsl:for-each select="tns:Prefix">
										<Prefix>
											<xsl:value-of select="."/>
										</Prefix>
									</xsl:for-each>
									<xsl:for-each select="tns:Exchange">
										<Exchange>
											<xsl:value-of select="."/>
										</Exchange>
									</xsl:for-each>
								</ContactPhone>
							</xsl:for-each>
							<xsl:for-each select="tns:ContactPhoneNumber">
								<ContactPhoneNumber>
									<xsl:value-of select="."/>
								</ContactPhoneNumber>
							</xsl:for-each>
						</CustomerList>
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
				</xsl:for-each>
			</SearchCustomerResponse>
		</xsl:template>
	</xsl:stylesheet>
