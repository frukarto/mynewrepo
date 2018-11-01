<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" exclude-result-prefixes="soap tns xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/tns:ViewCustomerRequestResponse">
			<CustomerDetailsResponse>
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
					<xsl:for-each select="tns:ContactAddress">
						<ContactAddress>
							<xsl:for-each select="tns:StreetAddress1">
								<StreetAddress1>
									<xsl:value-of select="."/>
								</StreetAddress1>
							</xsl:for-each>
							<xsl:for-each select="tns:StreetAddress2">
								<StreetAddress2>
									<xsl:value-of select="."/>
								</StreetAddress2>
							</xsl:for-each>
							<xsl:for-each select="tns:City">
								<City>
									<xsl:value-of select="."/>
								</City>
							</xsl:for-each>
							<xsl:for-each select="tns:State">
								<State>
									<xsl:value-of select="."/>
								</State>
							</xsl:for-each>
							<xsl:for-each select="tns:PostalCode">
								<PostalCode>
									<xsl:value-of select="."/>
								</PostalCode>
							</xsl:for-each>
							<xsl:for-each select="tns:CountryCode">
								<CountryCode>
									<xsl:value-of select="."/>
								</CountryCode>
							</xsl:for-each>
							<xsl:for-each select="tns:OverrideAddress">
								<OverrideAddress>
									<xsl:value-of select="."/>
								</OverrideAddress>
							</xsl:for-each>
							<xsl:for-each select="tns:County">
								<County>
									<xsl:value-of select="."/>
								</County>
							</xsl:for-each>
							<xsl:for-each select="tns:Latitude">
								<Latitude>
									<xsl:value-of select="."/>
								</Latitude>
							</xsl:for-each>
							<xsl:for-each select="tns:Longitude">
								<Longitude>
									<xsl:value-of select="."/>
								</Longitude>
							</xsl:for-each>
							<xsl:for-each select="tns:Landmark">
								<Landmark>
									<xsl:value-of select="."/>
								</Landmark>
							</xsl:for-each>
							<xsl:for-each select="tns:RBDI">
								<RBDI>
									<xsl:value-of select="."/>
								</RBDI>
							</xsl:for-each>
							<xsl:for-each select="tns:EACFStatus">
								<EACFStatus>
									<xsl:value-of select="."/>
								</EACFStatus>
							</xsl:for-each>
							<xsl:for-each select="tns:ErrorCode">
								<ErrorCode>
									<xsl:value-of select="."/>
								</ErrorCode>
							</xsl:for-each>
							<xsl:for-each select="tns:ErrorDescription">
								<ErrorDescription>
									<xsl:value-of select="."/>
								</ErrorDescription>
							</xsl:for-each>
							<xsl:for-each select="tns:Neighborhood">
								<Neighborhood>
									<xsl:value-of select="."/>
								</Neighborhood>
							</xsl:for-each>
							<xsl:for-each select="tns:Complement">
								<Complement>
									<xsl:value-of select="."/>
								</Complement>
							</xsl:for-each>
						</ContactAddress>
					</xsl:for-each>
					<xsl:for-each select="tns:Phone">
						<Phone>
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
						</Phone>
					</xsl:for-each>
					<xsl:for-each select="tns:PhoneNumber">
						<PhoneNumber>
							<xsl:value-of select="."/>
						</PhoneNumber>
					</xsl:for-each>
					<xsl:for-each select="tns:Email">
						<Email>
							<xsl:value-of select="."/>
						</Email>
					</xsl:for-each>
					<xsl:for-each select="tns:Fax">
						<Fax>
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
						</Fax>
					</xsl:for-each>
					<xsl:for-each select="tns:FaxNumber">
						<FaxNumber>
							<xsl:value-of select="."/>
						</FaxNumber>
					</xsl:for-each>
					<xsl:for-each select="tns:BillingName">
						<BillingName>
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
						</BillingName>
					</xsl:for-each>
					<xsl:for-each select="tns:BillingAddress">
						<BillingAddress>
							<xsl:for-each select="tns:StreetAddress1">
								<StreetAddress1>
									<xsl:value-of select="."/>
								</StreetAddress1>
							</xsl:for-each>
							<xsl:for-each select="tns:StreetAddress2">
								<StreetAddress2>
									<xsl:value-of select="."/>
								</StreetAddress2>
							</xsl:for-each>
							<xsl:for-each select="tns:City">
								<City>
									<xsl:value-of select="."/>
								</City>
							</xsl:for-each>
							<xsl:for-each select="tns:State">
								<State>
									<xsl:value-of select="."/>
								</State>
							</xsl:for-each>
							<xsl:for-each select="tns:PostalCode">
								<PostalCode>
									<xsl:value-of select="."/>
								</PostalCode>
							</xsl:for-each>
							<xsl:for-each select="tns:CountryCode">
								<CountryCode>
									<xsl:value-of select="."/>
								</CountryCode>
							</xsl:for-each>
							<xsl:for-each select="tns:OverrideAddress">
								<OverrideAddress>
									<xsl:value-of select="."/>
								</OverrideAddress>
							</xsl:for-each>
							<xsl:for-each select="tns:County">
								<County>
									<xsl:value-of select="."/>
								</County>
							</xsl:for-each>
							<xsl:for-each select="tns:Latitude">
								<Latitude>
									<xsl:value-of select="."/>
								</Latitude>
							</xsl:for-each>
							<xsl:for-each select="tns:Longitude">
								<Longitude>
									<xsl:value-of select="."/>
								</Longitude>
							</xsl:for-each>
							<xsl:for-each select="tns:Landmark">
								<Landmark>
									<xsl:value-of select="."/>
								</Landmark>
							</xsl:for-each>
							<xsl:for-each select="tns:RBDI">
								<RBDI>
									<xsl:value-of select="."/>
								</RBDI>
							</xsl:for-each>
							<xsl:for-each select="tns:EACFStatus">
								<EACFStatus>
									<xsl:value-of select="."/>
								</EACFStatus>
							</xsl:for-each>
							<xsl:for-each select="tns:ErrorCode">
								<ErrorCode>
									<xsl:value-of select="."/>
								</ErrorCode>
							</xsl:for-each>
							<xsl:for-each select="tns:ErrorDescription">
								<ErrorDescription>
									<xsl:value-of select="."/>
								</ErrorDescription>
							</xsl:for-each>
							<xsl:for-each select="tns:Neighborhood">
								<Neighborhood>
									<xsl:value-of select="."/>
								</Neighborhood>
							</xsl:for-each>
							<xsl:for-each select="tns:Complement">
								<Complement>
									<xsl:value-of select="."/>
								</Complement>
							</xsl:for-each>
						</BillingAddress>
					</xsl:for-each>
					<xsl:for-each select="tns:FederalTaxId">
						<FederalTaxId>
							<xsl:value-of select="."/>
						</FederalTaxId>
					</xsl:for-each>
					<xsl:for-each select="tns:PaymentMode">
						<PaymentMode>
							<xsl:value-of select="."/>
						</PaymentMode>
					</xsl:for-each>
					<xsl:for-each select="tns:CreditCardInfo">
						<CreditCardInfo>
							<xsl:for-each select="tns:CreditCardName">
								<CreditCardName>
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
								</CreditCardName>
							</xsl:for-each>
							<xsl:for-each select="tns:CreditCardNumber">
								<CreditCardNumber>
									<xsl:value-of select="."/>
								</CreditCardNumber>
							</xsl:for-each>
							<xsl:for-each select="tns:TokenNumber">
								<TokenNumber>
									<xsl:value-of select="."/>
								</TokenNumber>
							</xsl:for-each>
							<xsl:for-each select="tns:ExpirationMonth">
								<ExpirationMonth>
									<xsl:value-of select="."/>
								</ExpirationMonth>
							</xsl:for-each>
							<xsl:for-each select="tns:ExpirationYear">
								<ExpirationYear>
									<xsl:value-of select="."/>
								</ExpirationYear>
							</xsl:for-each>
							<xsl:for-each select="tns:CVV">
								<CVV>
									<xsl:value-of select="."/>
								</CVV>
							</xsl:for-each>
							<xsl:for-each select="tns:CreditCardType">
								<CreditCardType>
									<xsl:value-of select="."/>
								</CreditCardType>
							</xsl:for-each>
							<xsl:for-each select="tns:BilingAddress">
								<BilingAddress>
									<xsl:for-each select="tns:StreetAddress1">
										<StreetAddress1>
											<xsl:value-of select="."/>
										</StreetAddress1>
									</xsl:for-each>
									<xsl:for-each select="tns:StreetAddress2">
										<StreetAddress2>
											<xsl:value-of select="."/>
										</StreetAddress2>
									</xsl:for-each>
									<xsl:for-each select="tns:City">
										<City>
											<xsl:value-of select="."/>
										</City>
									</xsl:for-each>
									<xsl:for-each select="tns:State">
										<State>
											<xsl:value-of select="."/>
										</State>
									</xsl:for-each>
									<xsl:for-each select="tns:PostalCode">
										<PostalCode>
											<xsl:value-of select="."/>
										</PostalCode>
									</xsl:for-each>
									<xsl:for-each select="tns:CountryCode">
										<CountryCode>
											<xsl:value-of select="."/>
										</CountryCode>
									</xsl:for-each>
									<xsl:for-each select="tns:OverrideAddress">
										<OverrideAddress>
											<xsl:value-of select="."/>
										</OverrideAddress>
									</xsl:for-each>
									<xsl:for-each select="tns:County">
										<County>
											<xsl:value-of select="."/>
										</County>
									</xsl:for-each>
									<xsl:for-each select="tns:Latitude">
										<Latitude>
											<xsl:value-of select="."/>
										</Latitude>
									</xsl:for-each>
									<xsl:for-each select="tns:Longitude">
										<Longitude>
											<xsl:value-of select="."/>
										</Longitude>
									</xsl:for-each>
									<xsl:for-each select="tns:Landmark">
										<Landmark>
											<xsl:value-of select="."/>
										</Landmark>
									</xsl:for-each>
									<xsl:for-each select="tns:RBDI">
										<RBDI>
											<xsl:value-of select="."/>
										</RBDI>
									</xsl:for-each>
									<xsl:for-each select="tns:EACFStatus">
										<EACFStatus>
											<xsl:value-of select="."/>
										</EACFStatus>
									</xsl:for-each>
									<xsl:for-each select="tns:ErrorCode">
										<ErrorCode>
											<xsl:value-of select="."/>
										</ErrorCode>
									</xsl:for-each>
									<xsl:for-each select="tns:ErrorDescription">
										<ErrorDescription>
											<xsl:value-of select="."/>
										</ErrorDescription>
									</xsl:for-each>
									<xsl:for-each select="tns:Neighborhood">
										<Neighborhood>
											<xsl:value-of select="."/>
										</Neighborhood>
									</xsl:for-each>
									<xsl:for-each select="tns:Complement">
										<Complement>
											<xsl:value-of select="."/>
										</Complement>
									</xsl:for-each>
								</BilingAddress>
							</xsl:for-each>
							<xsl:for-each select="tns:CCAuthAmount">
								<CCAuthAmount>
									<xsl:value-of select="."/>
								</CCAuthAmount>
							</xsl:for-each>
							<xsl:for-each select="tns:CCAuthAmtReleaseDate">
								<CCAuthAmtReleaseDate>
									<xsl:value-of select="."/>
								</CCAuthAmtReleaseDate>
							</xsl:for-each>
						</CreditCardInfo>
					</xsl:for-each>
					<xsl:for-each select="tns:ProspectId">
						<ProspectId>
							<xsl:value-of select="."/>
						</ProspectId>
					</xsl:for-each>
					<xsl:for-each select="tns:DistributorFlag">
						<DistributorFlag>
							<xsl:value-of select="."/>
						</DistributorFlag>
					</xsl:for-each>
					<xsl:for-each select="tns:DistributorId">
						<DistributorId>
							<xsl:value-of select="."/>
						</DistributorId>
					</xsl:for-each>
				</xsl:for-each>
			</CustomerDetailsResponse>
		</xsl:template>
	</xsl:stylesheet>
