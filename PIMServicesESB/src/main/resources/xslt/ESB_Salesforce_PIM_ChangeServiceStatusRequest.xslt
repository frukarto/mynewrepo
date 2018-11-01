<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core2="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/partner" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/dssbilling" exclude-result-prefixes="core2 n1 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="n1:ChangeServiceStatusRequest">
			<BillingStatusUpdateMsg>
				<xsl:for-each select="n1:SAN">
					<SAN>
						<xsl:value-of select="."/>
					</SAN>
				</xsl:for-each>
				<xsl:for-each select="n1:ReasonCode">
					<ReasonCode>
						<xsl:value-of select="."/>
					</ReasonCode>
				</xsl:for-each>
					<xsl:for-each select="n1:ServiceStatus">
					<Action>
						<xsl:value-of select="."/>
					</Action>
				</xsl:for-each>
				<xsl:for-each select="n1:PartnerId">
					<PartnerId>
						<xsl:value-of select="."/>
					</PartnerId>
				</xsl:for-each>
			</BillingStatusUpdateMsg>
		</xsl:template>
	</xsl:stylesheet>
