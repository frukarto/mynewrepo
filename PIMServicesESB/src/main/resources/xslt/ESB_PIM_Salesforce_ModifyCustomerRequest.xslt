<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/partner" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" exclude-result-prefixes="core n1 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="n1:ModifyCustomerRequest">
			<tns:ModifyCustomerRequest>
				<tns:req>
					<xsl:for-each select="n1:BillingAddress">
						<tns:BillingAddress>
							<xsl:for-each select="n1:City">
								<tns:City>
									<xsl:value-of select="."/>
								</tns:City>
							</xsl:for-each>
							<xsl:for-each select="n1:Complement">
								<tns:Complement>
									<xsl:value-of select="."/>
								</tns:Complement>
							</xsl:for-each>
							<xsl:for-each select="n1:CountryCode">
								<tns:CountryCode>
									<xsl:value-of select="."/>
								</tns:CountryCode>
							</xsl:for-each>
							<xsl:for-each select="n1:County">
								<tns:County>
									<xsl:value-of select="."/>
								</tns:County>
							</xsl:for-each>
							<xsl:for-each select="n1:EACFStatus">
								<tns:EACFStatus>
									<xsl:value-of select="."/>
								</tns:EACFStatus>
							</xsl:for-each>
							<xsl:for-each select="n1:ErrorCode">
								<tns:ErrorCode>
									<xsl:value-of select="."/>
								</tns:ErrorCode>
							</xsl:for-each>
							<xsl:for-each select="n1:ErrorDescription">
								<tns:ErrorDescription>
									<xsl:value-of select="."/>
								</tns:ErrorDescription>
							</xsl:for-each>
							<xsl:for-each select="n1:Landmark">
								<tns:Landmark>
									<xsl:value-of select="."/>
								</tns:Landmark>
							</xsl:for-each>
							<xsl:for-each select="n1:Latitude">
								<tns:Latitude>
									<xsl:value-of select="."/>
								</tns:Latitude>
							</xsl:for-each>
							<xsl:for-each select="n1:Longitude">
								<tns:Longitude>
									<xsl:value-of select="."/>
								</tns:Longitude>
							</xsl:for-each>
							<xsl:for-each select="n1:Neighborhood">
								<tns:Neighborhood>
									<xsl:value-of select="."/>
								</tns:Neighborhood>
							</xsl:for-each>
							<xsl:for-each select="n1:OverrideAddress">
								<tns:OverrideAddress>
									<xsl:value-of select="."/>
								</tns:OverrideAddress>
							</xsl:for-each>
							<xsl:for-each select="n1:PostalCode">
								<tns:PostalCode>
									<xsl:value-of select="."/>
								</tns:PostalCode>
							</xsl:for-each>
							<xsl:for-each select="n1:RBDI">
								<tns:RBDI>
									<xsl:value-of select="."/>
								</tns:RBDI>
							</xsl:for-each>
							<xsl:for-each select="n1:State">
								<tns:State>
									<xsl:value-of select="."/>
								</tns:State>
							</xsl:for-each>
							<xsl:for-each select="n1:StreetAddress1">
								<tns:StreetAddress1>
									<xsl:value-of select="."/>
								</tns:StreetAddress1>
							</xsl:for-each>
							<xsl:for-each select="n1:StreetAddress2">
								<tns:StreetAddress2>
									<xsl:value-of select="."/>
								</tns:StreetAddress2>
							</xsl:for-each>
						</tns:BillingAddress>
					</xsl:for-each>
					<xsl:for-each select="n1:BillingName">
						<tns:BillingName>
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
							<xsl:for-each select="n1:LastNameSuffix">
								<tns:LastNameSuffix>
									<xsl:value-of select="."/>
								</tns:LastNameSuffix>
							</xsl:for-each>
							<xsl:for-each select="n1:MiddleName">
								<tns:MiddleName>
									<xsl:value-of select="."/>
								</tns:MiddleName>
							</xsl:for-each>
						</tns:BillingName>
					</xsl:for-each>
					<xsl:for-each select="n1:ContactAddress">
						<tns:ContactAddress>
							<xsl:for-each select="n1:City">
								<tns:City>
									<xsl:value-of select="."/>
								</tns:City>
							</xsl:for-each>
							<xsl:for-each select="n1:Complement">
								<tns:Complement>
									<xsl:value-of select="."/>
								</tns:Complement>
							</xsl:for-each>
							<xsl:for-each select="n1:CountryCode">
								<tns:CountryCode>
									<xsl:value-of select="."/>
								</tns:CountryCode>
							</xsl:for-each>
							<xsl:for-each select="n1:County">
								<tns:County>
									<xsl:value-of select="."/>
								</tns:County>
							</xsl:for-each>
							<xsl:for-each select="n1:EACFStatus">
								<tns:EACFStatus>
									<xsl:value-of select="."/>
								</tns:EACFStatus>
							</xsl:for-each>
							<xsl:for-each select="n1:ErrorCode">
								<tns:ErrorCode>
									<xsl:value-of select="."/>
								</tns:ErrorCode>
							</xsl:for-each>
							<xsl:for-each select="n1:ErrorDescription">
								<tns:ErrorDescription>
									<xsl:value-of select="."/>
								</tns:ErrorDescription>
							</xsl:for-each>
							<xsl:for-each select="n1:Landmark">
								<tns:Landmark>
									<xsl:value-of select="."/>
								</tns:Landmark>
							</xsl:for-each>
							<xsl:for-each select="n1:Latitude">
								<tns:Latitude>
									<xsl:value-of select="."/>
								</tns:Latitude>
							</xsl:for-each>
							<xsl:for-each select="n1:Longitude">
								<tns:Longitude>
									<xsl:value-of select="."/>
								</tns:Longitude>
							</xsl:for-each>
							<xsl:for-each select="n1:Neighborhood">
								<tns:Neighborhood>
									<xsl:value-of select="."/>
								</tns:Neighborhood>
							</xsl:for-each>
							<xsl:for-each select="n1:OverrideAddress">
								<tns:OverrideAddress>
									<xsl:value-of select="."/>
								</tns:OverrideAddress>
							</xsl:for-each>
							<xsl:for-each select="n1:PostalCode">
								<tns:PostalCode>
									<xsl:value-of select="."/>
								</tns:PostalCode>
							</xsl:for-each>
							<xsl:for-each select="n1:RBDI">
								<tns:RBDI>
									<xsl:value-of select="."/>
								</tns:RBDI>
							</xsl:for-each>
							<xsl:for-each select="n1:State">
								<tns:State>
									<xsl:value-of select="."/>
								</tns:State>
							</xsl:for-each>
							<xsl:for-each select="n1:StreetAddress1">
								<tns:StreetAddress1>
									<xsl:value-of select="."/>
								</tns:StreetAddress1>
							</xsl:for-each>
							<xsl:for-each select="n1:StreetAddress2">
								<tns:StreetAddress2>
									<xsl:value-of select="."/>
								</tns:StreetAddress2>
							</xsl:for-each>
						</tns:ContactAddress>
					</xsl:for-each>
					<xsl:for-each select="n1:ContactName">
						<tns:ContactName>
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
							<xsl:for-each select="n1:LastNameSuffix">
								<tns:LastNameSuffix>
									<xsl:value-of select="."/>
								</tns:LastNameSuffix>
							</xsl:for-each>
							<xsl:for-each select="n1:MiddleName">
								<tns:MiddleName>
									<xsl:value-of select="."/>
								</tns:MiddleName>
							</xsl:for-each>
						</tns:ContactName>
					</xsl:for-each>
					<xsl:for-each select="n1:CreditCardInfo">
						<tns:CreditCardInfo>
							<xsl:for-each select="n1:BilingAddress">
								<tns:BilingAddress>
									<xsl:for-each select="n1:City">
										<tns:City>
											<xsl:value-of select="."/>
										</tns:City>
									</xsl:for-each>
									<xsl:for-each select="n1:Complement">
										<tns:Complement>
											<xsl:value-of select="."/>
										</tns:Complement>
									</xsl:for-each>
									<xsl:for-each select="n1:CountryCode">
										<tns:CountryCode>
											<xsl:value-of select="."/>
										</tns:CountryCode>
									</xsl:for-each>
									<xsl:for-each select="n1:County">
										<tns:County>
											<xsl:value-of select="."/>
										</tns:County>
									</xsl:for-each>
									<xsl:for-each select="n1:EACFStatus">
										<tns:EACFStatus>
											<xsl:value-of select="."/>
										</tns:EACFStatus>
									</xsl:for-each>
									<xsl:for-each select="n1:ErrorCode">
										<tns:ErrorCode>
											<xsl:value-of select="."/>
										</tns:ErrorCode>
									</xsl:for-each>
									<xsl:for-each select="n1:ErrorDescription">
										<tns:ErrorDescription>
											<xsl:value-of select="."/>
										</tns:ErrorDescription>
									</xsl:for-each>
									<xsl:for-each select="n1:Landmark">
										<tns:Landmark>
											<xsl:value-of select="."/>
										</tns:Landmark>
									</xsl:for-each>
									<xsl:for-each select="n1:Latitude">
										<tns:Latitude>
											<xsl:value-of select="."/>
										</tns:Latitude>
									</xsl:for-each>
									<xsl:for-each select="n1:Longitude">
										<tns:Longitude>
											<xsl:value-of select="."/>
										</tns:Longitude>
									</xsl:for-each>
									<xsl:for-each select="n1:Neighborhood">
										<tns:Neighborhood>
											<xsl:value-of select="."/>
										</tns:Neighborhood>
									</xsl:for-each>
									<xsl:for-each select="n1:OverrideAddress">
										<tns:OverrideAddress>
											<xsl:value-of select="."/>
										</tns:OverrideAddress>
									</xsl:for-each>
									<xsl:for-each select="n1:PostalCode">
										<tns:PostalCode>
											<xsl:value-of select="."/>
										</tns:PostalCode>
									</xsl:for-each>
									<xsl:for-each select="n1:RBDI">
										<tns:RBDI>
											<xsl:value-of select="."/>
										</tns:RBDI>
									</xsl:for-each>
									<xsl:for-each select="n1:State">
										<tns:State>
											<xsl:value-of select="."/>
										</tns:State>
									</xsl:for-each>
									<xsl:for-each select="n1:StreetAddress1">
										<tns:StreetAddress1>
											<xsl:value-of select="."/>
										</tns:StreetAddress1>
									</xsl:for-each>
									<xsl:for-each select="n1:StreetAddress2">
										<tns:StreetAddress2>
											<xsl:value-of select="."/>
										</tns:StreetAddress2>
									</xsl:for-each>
								</tns:BilingAddress>
							</xsl:for-each>
							<xsl:for-each select="n1:CCAuthAmount">
								<tns:CCAuthAmount>
									<xsl:value-of select="."/>
								</tns:CCAuthAmount>
							</xsl:for-each>
							<xsl:for-each select="n1:CCAuthAmtReleaseDate">
								<tns:CCAuthAmtReleaseDate>
									<xsl:value-of select="."/>
								</tns:CCAuthAmtReleaseDate>
							</xsl:for-each>
							<xsl:for-each select="n1:CreditCardName">
								<tns:CreditCardName>
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
									<xsl:for-each select="n1:LastNameSuffix">
										<tns:LastNameSuffix>
											<xsl:value-of select="."/>
										</tns:LastNameSuffix>
									</xsl:for-each>
									<xsl:for-each select="n1:MiddleName">
										<tns:MiddleName>
											<xsl:value-of select="."/>
										</tns:MiddleName>
									</xsl:for-each>
								</tns:CreditCardName>
							</xsl:for-each>
							<xsl:for-each select="n1:CreditCardNumber">
								<tns:CreditCardNumber>
									<xsl:value-of select="."/>
								</tns:CreditCardNumber>
							</xsl:for-each>
							<xsl:for-each select="n1:CreditCardType">
								<tns:CreditCardType>
									<xsl:value-of select="."/>
								</tns:CreditCardType>
							</xsl:for-each>
							<xsl:for-each select="n1:CVV">
								<tns:CVV>
									<xsl:value-of select="."/>
								</tns:CVV>
							</xsl:for-each>
							<xsl:for-each select="n1:ExpirationMonth">
								<tns:ExpirationMonth>
									<xsl:value-of select="."/>
								</tns:ExpirationMonth>
							</xsl:for-each>
							<xsl:for-each select="n1:ExpirationYear">
								<tns:ExpirationYear>
									<xsl:value-of select="."/>
								</tns:ExpirationYear>
							</xsl:for-each>
							<xsl:for-each select="n1:TokenNumber">
								<tns:TokenNumber>
									<xsl:value-of select="."/>
								</tns:TokenNumber>
							</xsl:for-each>
						</tns:CreditCardInfo>
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
					<xsl:for-each select="n1:Email">
						<tns:Email>
							<xsl:value-of select="."/>
						</tns:Email>
					</xsl:for-each>
					<xsl:for-each select="n1:Fax">
						<tns:Fax>
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
						</tns:Fax>
					</xsl:for-each>
					<xsl:for-each select="n1:FaxNumber">
						<tns:FaxNumber>
							<xsl:value-of select="."/>
						</tns:FaxNumber>
					</xsl:for-each>
					<xsl:for-each select="n1:FederalTaxId">
						<tns:FederalTaxId>
							<xsl:value-of select="."/>
						</tns:FederalTaxId>
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
					<xsl:for-each select="n1:PaymentMode">
						<tns:PaymentMode>
							<xsl:value-of select="."/>
						</tns:PaymentMode>
					</xsl:for-each>
					<xsl:for-each select="n1:Phone">
						<tns:Phone>
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
						</tns:Phone>
					</xsl:for-each>
					<xsl:for-each select="n1:PhoneNumber">
						<tns:PhoneNumber>
							<xsl:value-of select="."/>
						</tns:PhoneNumber>
					</xsl:for-each>
				</tns:req>
			</tns:ModifyCustomerRequest>
		</xsl:template>
	</xsl:stylesheet>
