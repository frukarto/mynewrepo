<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/partner" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" exclude-result-prefixes="core n1 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="n1:SearchSiteRequest">
			<tns:SearchSiteRequest>
				<tns:req>
					<xsl:for-each select="n1:CountryCode">
						<tns:CountryCode>
							<xsl:value-of select="."/>
						</tns:CountryCode>
					</xsl:for-each>
					<xsl:for-each select="n1:CustomerCategory">
						<tns:CustomerCategory>
							<xsl:value-of select="."/>
						</tns:CustomerCategory>
					</xsl:for-each>
					<xsl:for-each select="n1:CustomerId">
						<tns:CustomerId>
							<xsl:value-of select="."/>
						</tns:CustomerId>
					</xsl:for-each>
					<xsl:for-each select="n1:MessageHeader">
						<tns:MessageHeader>
							<xsl:for-each select="n1:CorrelationTransactionId">
								<tns:CorrelationTransactionId>
									<xsl:value-of select="."/>
								</tns:CorrelationTransactionId>
							</xsl:for-each>
							<xsl:for-each select="n1:TransactionCode">
								<tns:TransactionCode>
									<xsl:value-of select="."/>
								</tns:TransactionCode>
							</xsl:for-each>
							<xsl:for-each select="n1:TransactionDateTime">
								<tns:TransactionDateTime>
									<xsl:value-of select="."/>
								</tns:TransactionDateTime>
							</xsl:for-each>
							<xsl:for-each select="n1:TransactionSequenceId">
								<tns:TransactionSequenceId>
									<xsl:value-of select="."/>
								</tns:TransactionSequenceId>
							</xsl:for-each>
						</tns:MessageHeader>
					</xsl:for-each>
					<xsl:for-each select="n1:PartnerId">
						<tns:PartnerId>
							<xsl:value-of select="."/>
						</tns:PartnerId>
					</xsl:for-each>
					<xsl:for-each select="n1:PostalCode">
						<tns:PostalCode>
							<xsl:value-of select="."/>
						</tns:PostalCode>
					</xsl:for-each>
					<xsl:for-each select="n1:SAN">
						<tns:SAN>
							<xsl:value-of select="."/>
						</tns:SAN>
					</xsl:for-each>
					<xsl:for-each select="n1:SerialNumber">
						<tns:SerialNumber>
							<xsl:value-of select="."/>
						</tns:SerialNumber>
					</xsl:for-each>
					<xsl:for-each select="n1:SiteContactName">
						<tns:SiteContactName>
							<xsl:for-each select="n1:FirstName">
								<tns:FirstName>
									<xsl:value-of select="."/>
								</tns:FirstName>
							</xsl:for-each>
							<xsl:for-each select="n1:LastName">
								<tns:LastName>
									<xsl:value-of select="."/>
								</tns:LastName>
							</xsl:for-each>
						</tns:SiteContactName>
					</xsl:for-each>
					<xsl:for-each select="n1:SiteContactPhone">
						<tns:SiteContactPhone>
							<xsl:for-each select="n1:AreaCode">
								<tns:AreaCode>
									<xsl:value-of select="."/>
								</tns:AreaCode>
							</xsl:for-each>
							<xsl:for-each select="n1:Exchange">
								<tns:Exchange>
									<xsl:value-of select="."/>
								</tns:Exchange>
							</xsl:for-each>
							<xsl:for-each select="n1:Prefix">
								<tns:Prefix>
									<xsl:value-of select="."/>
								</tns:Prefix>
							</xsl:for-each>
						</tns:SiteContactPhone>
					</xsl:for-each>
					<xsl:for-each select="n1:SiteContactPhoneNumber">
						<tns:SiteContactPhoneNumber>
							<xsl:value-of select="."/>
						</tns:SiteContactPhoneNumber>
					</xsl:for-each>
					<xsl:for-each select="n1:StateCode">
						<tns:StateCode>
							<xsl:value-of select="."/>
						</tns:StateCode>
					</xsl:for-each>
				</tns:req>
			</tns:SearchSiteRequest>
		</xsl:template>
	</xsl:stylesheet>
