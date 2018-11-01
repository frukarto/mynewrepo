<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core2="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/partner" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/dssbilling" xmlns:p1="http://www.hns.com/iag/schemas/partner"  exclude-result-prefixes="core2 n1 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="n1:GetBillingDetailsReq">
			<GetAccountInfoMsg>
				<UserCredential>
					 <LoginId>dssadmin</LoginId>
					 <AuthorizationFlag>true</AuthorizationFlag>
				</UserCredential>
				
				<ChildWanted>true</ChildWanted>
				
				<xsl:for-each select="n1:SAN">
					<SAN>
						<xsl:value-of select="."/>
					</SAN>
				</xsl:for-each>
				
			</GetAccountInfoMsg>
		</xsl:template>
	</xsl:stylesheet>
