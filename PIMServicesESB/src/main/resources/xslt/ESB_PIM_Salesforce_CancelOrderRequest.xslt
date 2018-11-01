<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/partner" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" exclude-result-prefixes="core n1 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="n1:CancelOrderRequest">
			<tns:CancelOrderRequest>
				<tns:req>
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
					<xsl:for-each select="n1:FallOutDate">
						<tns:FallOutDate>
							<xsl:value-of select="."/>
						</tns:FallOutDate>
					</xsl:for-each>
					<xsl:for-each select="n1:FallOutNAPSource">
						<tns:FallOutNAPSource>
							<xsl:value-of select="."/>
						</tns:FallOutNAPSource>
					</xsl:for-each>
					<xsl:for-each select="n1:FallOutNAPSubType">
						<tns:FallOutNAPSubType>
							<xsl:value-of select="."/>
						</tns:FallOutNAPSubType>
					</xsl:for-each>
					<xsl:for-each select="n1:FallOutReasonCode">
						<tns:FallOutReasonCode>
							<xsl:value-of select="."/>
						</tns:FallOutReasonCode>
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
					<xsl:for-each select="n1:Note">
						<tns:Note>
							<xsl:value-of select="."/>
						</tns:Note>
					</xsl:for-each>
					<xsl:for-each select="n1:OrderId">
						<tns:OrderId>
							<xsl:value-of select="."/>
						</tns:OrderId>
					</xsl:for-each>
					<xsl:for-each select="n1:PartnerId">
						<tns:PartnerId>
							<xsl:value-of select="."/>
						</tns:PartnerId>
					</xsl:for-each>
					<xsl:for-each select="n1:ReasonCode">
						<tns:ReasonCode>
							<xsl:value-of select="."/>
						</tns:ReasonCode>
					</xsl:for-each>
					<xsl:for-each select="n1:SAN">
						<tns:SAN>
							<xsl:value-of select="."/>
						</tns:SAN>
					</xsl:for-each>
					<xsl:for-each select="n1:ServiceOrderNumber">
						<tns:ServiceOrderNumber>
							<xsl:value-of select="."/>
						</tns:ServiceOrderNumber>
					</xsl:for-each>
				</tns:req>
			</tns:CancelOrderRequest>
		</xsl:template>
	</xsl:stylesheet>
