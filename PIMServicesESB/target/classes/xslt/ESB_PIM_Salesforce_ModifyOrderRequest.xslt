<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/partner" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" exclude-result-prefixes="core n1 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="n1:ModifyOrderRequest">
			<tns:ModifyOrderRequest>
				<tns:req>
					<xsl:for-each select="n1:AcceptedCommunications">
						<tns:AcceptedCommunications>
							<xsl:for-each select="n1:AcceptsEmail">
								<tns:AcceptsEmail>
									<xsl:value-of select="."/>
								</tns:AcceptsEmail>
							</xsl:for-each>
							<xsl:for-each select="n1:AcceptsLetter">
								<tns:AcceptsLetter>
									<xsl:value-of select="."/>
								</tns:AcceptsLetter>
							</xsl:for-each>
							<xsl:for-each select="n1:AcceptsPhoneCall">
								<tns:AcceptsPhoneCall>
									<xsl:value-of select="."/>
								</tns:AcceptsPhoneCall>
							</xsl:for-each>
							<xsl:for-each select="n1:AcceptsSMS">
								<tns:AcceptsSMS>
									<xsl:value-of select="."/>
								</tns:AcceptsSMS>
							</xsl:for-each>
						</tns:AcceptedCommunications>
					</xsl:for-each>
					<xsl:for-each select="n1:AdapterId">
						<tns:AdapterId>
							<xsl:value-of select="."/>
						</tns:AdapterId>
					</xsl:for-each>
					<xsl:for-each select="n1:AgentId">
						<tns:AgentId>
							<xsl:value-of select="."/>
						</tns:AgentId>
					</xsl:for-each>
					<xsl:for-each select="n1:BankAccountInfo">
						<tns:BankAccountInfo>
							<xsl:for-each select="n1:AccountNumberVerifierDigit">
								<tns:AccountNumberVerifierDigit>
									<xsl:value-of select="."/>
								</tns:AccountNumberVerifierDigit>
							</xsl:for-each>
							<xsl:for-each select="n1:AgencyNumber">
								<tns:AgencyNumber>
									<xsl:value-of select="."/>
								</tns:AgencyNumber>
							</xsl:for-each>
							<xsl:for-each select="n1:AgencyVerifierDigit">
								<tns:AgencyVerifierDigit>
									<xsl:value-of select="."/>
								</tns:AgencyVerifierDigit>
							</xsl:for-each>
							<xsl:for-each select="n1:BankAccountNumber">
								<tns:BankAccountNumber>
									<xsl:value-of select="."/>
								</tns:BankAccountNumber>
							</xsl:for-each>
							<xsl:for-each select="n1:BankCode">
								<tns:BankCode>
									<xsl:value-of select="."/>
								</tns:BankCode>
							</xsl:for-each>
							<xsl:for-each select="n1:NameOfOwner">
								<tns:NameOfOwner>
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
								</tns:NameOfOwner>
							</xsl:for-each>
						</tns:BankAccountInfo>
					</xsl:for-each>
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
					<xsl:for-each select="n1:BillingDueDay">
						<tns:BillingDueDay>
							<xsl:value-of select="."/>
						</tns:BillingDueDay>
					</xsl:for-each>
					<xsl:for-each select="n1:BillingMethod">
						<tns:BillingMethod>
							<xsl:value-of select="."/>
						</tns:BillingMethod>
					</xsl:for-each>
					<xsl:for-each select="n1:CaseId">
						<tns:CaseId>
							<xsl:value-of select="."/>
						</tns:CaseId>
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
					<xsl:for-each select="n1:CustomerCompany">
						<tns:CustomerCompany>
							<xsl:value-of select="."/>
						</tns:CustomerCompany>
					</xsl:for-each>
					<xsl:for-each select="n1:CustomerId">
						<tns:CustomerId>
							<xsl:value-of select="."/>
						</tns:CustomerId>
					</xsl:for-each>
					<xsl:for-each select="n1:CustomerPermissionFlags">
						<tns:CustomerPermissionFlags>
							<xsl:for-each select="n1:DataConfirmed">
								<tns:DataConfirmed>
									<xsl:value-of select="."/>
								</tns:DataConfirmed>
							</xsl:for-each>
							<xsl:for-each select="n1:LandlordPermission">
								<tns:LandlordPermission>
									<xsl:value-of select="."/>
								</tns:LandlordPermission>
							</xsl:for-each>
							<xsl:for-each select="n1:NoHitOverride">
								<tns:NoHitOverride>
									<xsl:value-of select="."/>
								</tns:NoHitOverride>
							</xsl:for-each>
							<xsl:for-each select="n1:OwnerPermission">
								<tns:OwnerPermission>
									<xsl:value-of select="."/>
								</tns:OwnerPermission>
							</xsl:for-each>
							<xsl:for-each select="n1:VermontFlag">
								<tns:VermontFlag>
									<xsl:value-of select="."/>
								</tns:VermontFlag>
							</xsl:for-each>
						</tns:CustomerPermissionFlags>
					</xsl:for-each>
					<xsl:for-each select="n1:DayPhone">
						<tns:DayPhone>
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
						</tns:DayPhone>
					</xsl:for-each>
					<xsl:for-each select="n1:DayPhoneNumber">
						<tns:DayPhoneNumber>
							<xsl:value-of select="."/>
						</tns:DayPhoneNumber>
					</xsl:for-each>
					<xsl:for-each select="n1:DOB">
						<tns:DOB>
							<xsl:value-of select="."/>
						</tns:DOB>
					</xsl:for-each>
					<xsl:for-each select="n1:Email">
						<tns:Email>
							<xsl:value-of select="."/>
						</tns:Email>
					</xsl:for-each>
					<xsl:for-each select="n1:FederalTaxId">
						<tns:FederalTaxId>
							<xsl:for-each select="n1:CNPJ">
								<tns:CNPJ>
									<xsl:value-of select="."/>
								</tns:CNPJ>
							</xsl:for-each>
							<xsl:for-each select="n1:CPF">
								<tns:CPF>
									<xsl:value-of select="."/>
								</tns:CPF>
							</xsl:for-each>
						</tns:FederalTaxId>
					</xsl:for-each>
					<xsl:for-each select="n1:InstallAddress">
						<tns:InstallAddress>
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
						</tns:InstallAddress>
					</xsl:for-each>
					<xsl:for-each select="n1:InternationalCellPhone">
						<tns:InternationalCellPhone>
							<xsl:for-each select="n1:AreaCode">
								<tns:AreaCode>
									<xsl:value-of select="."/>
								</tns:AreaCode>
							</xsl:for-each>
							<xsl:for-each select="n1:Extension">
								<tns:Extension>
									<xsl:value-of select="."/>
								</tns:Extension>
							</xsl:for-each>
							<xsl:for-each select="n1:IntPhoneNo">
								<tns:IntPhoneNo>
									<xsl:value-of select="."/>
								</tns:IntPhoneNo>
							</xsl:for-each>
							<xsl:for-each select="n1:ISDCode">
								<tns:ISDCode>
									<xsl:value-of select="."/>
								</tns:ISDCode>
							</xsl:for-each>
						</tns:InternationalCellPhone>
					</xsl:for-each>
					<xsl:for-each select="n1:InternationalDayPhone">
						<tns:InternationalDayPhone>
							<xsl:for-each select="n1:AreaCode">
								<tns:AreaCode>
									<xsl:value-of select="."/>
								</tns:AreaCode>
							</xsl:for-each>
							<xsl:for-each select="n1:Extension">
								<tns:Extension>
									<xsl:value-of select="."/>
								</tns:Extension>
							</xsl:for-each>
							<xsl:for-each select="n1:IntPhoneNo">
								<tns:IntPhoneNo>
									<xsl:value-of select="."/>
								</tns:IntPhoneNo>
							</xsl:for-each>
							<xsl:for-each select="n1:ISDCode">
								<tns:ISDCode>
									<xsl:value-of select="."/>
								</tns:ISDCode>
							</xsl:for-each>
						</tns:InternationalDayPhone>
					</xsl:for-each>
					<xsl:for-each select="n1:InternationalNightPhone">
						<tns:InternationalNightPhone>
							<xsl:for-each select="n1:AreaCode">
								<tns:AreaCode>
									<xsl:value-of select="."/>
								</tns:AreaCode>
							</xsl:for-each>
							<xsl:for-each select="n1:Extension">
								<tns:Extension>
									<xsl:value-of select="."/>
								</tns:Extension>
							</xsl:for-each>
							<xsl:for-each select="n1:IntPhoneNo">
								<tns:IntPhoneNo>
									<xsl:value-of select="."/>
								</tns:IntPhoneNo>
							</xsl:for-each>
							<xsl:for-each select="n1:ISDCode">
								<tns:ISDCode>
									<xsl:value-of select="."/>
								</tns:ISDCode>
							</xsl:for-each>
						</tns:InternationalNightPhone>
					</xsl:for-each>
					<xsl:for-each select="n1:isPostalMailRequired">
						<tns:isPostalMailRequired>
							<xsl:value-of select="."/>
						</tns:isPostalMailRequired>
					</xsl:for-each>
					<xsl:for-each select="n1:LandlinePhoneNumber">
						<tns:LandlinePhoneNumber>
							<xsl:value-of select="."/>
						</tns:LandlinePhoneNumber>
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
					<xsl:for-each select="n1:Name">
						<tns:Name>
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
						</tns:Name>
					</xsl:for-each>
					<xsl:for-each select="n1:NightPhone">
						<tns:NightPhone>
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
						</tns:NightPhone>
					</xsl:for-each>
					<xsl:for-each select="n1:NightPhoneNumber">
						<tns:NightPhoneNumber>
							<xsl:value-of select="."/>
						</tns:NightPhoneNumber>
					</xsl:for-each>
					<xsl:for-each select="n1:Note">
						<tns:Note>
							<xsl:value-of select="."/>
						</tns:Note>
					</xsl:for-each>
					<xsl:for-each select="n1:ODUParameters">
						<tns:ODUParameters>
							<xsl:for-each select="n1:AntennaSize">
								<tns:AntennaSize>
									<xsl:value-of select="."/>
								</tns:AntennaSize>
							</xsl:for-each>
							<xsl:for-each select="n1:Availability">
								<tns:Availability>
									<xsl:value-of select="."/>
								</tns:Availability>
							</xsl:for-each>
							<xsl:for-each select="n1:RadioPower">
								<tns:RadioPower>
									<xsl:value-of select="."/>
								</tns:RadioPower>
							</xsl:for-each>
						</tns:ODUParameters>
					</xsl:for-each>
					<xsl:for-each select="n1:OrderId">
						<tns:OrderId>
							<xsl:value-of select="."/>
						</tns:OrderId>
					</xsl:for-each>
					<xsl:for-each select="n1:OrderSubType">
						<tns:OrderSubType>
							<xsl:value-of select="."/>
						</tns:OrderSubType>
					</xsl:for-each>
					<xsl:for-each select="n1:OrderType">
						<tns:OrderType>
							<xsl:value-of select="."/>
						</tns:OrderType>
					</xsl:for-each>
					<xsl:for-each select="n1:OrganizationInfo">
						<tns:OrganizationInfo>
							<xsl:for-each select="n1:Activity">
								<tns:Activity>
									<xsl:value-of select="."/>
								</tns:Activity>
							</xsl:for-each>
							<xsl:for-each select="n1:MunicipalRegistry">
								<tns:MunicipalRegistry>
									<xsl:value-of select="."/>
								</tns:MunicipalRegistry>
							</xsl:for-each>
							<xsl:for-each select="n1:StateRegistry">
								<tns:StateRegistry>
									<xsl:value-of select="."/>
								</tns:StateRegistry>
							</xsl:for-each>
							<xsl:for-each select="n1:TradeName">
								<tns:TradeName>
									<xsl:value-of select="."/>
								</tns:TradeName>
							</xsl:for-each>
						</tns:OrganizationInfo>
					</xsl:for-each>
					<xsl:for-each select="n1:PartnerId">
						<tns:PartnerId>
							<xsl:value-of select="."/>
						</tns:PartnerId>
					</xsl:for-each>
					<xsl:for-each select="n1:PIN">
						<tns:PIN>
							<xsl:value-of select="."/>
						</tns:PIN>
					</xsl:for-each>
					<xsl:for-each select="n1:PreviousBillingAddress">
						<tns:PreviousBillingAddress>
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
						</tns:PreviousBillingAddress>
					</xsl:for-each>
					<xsl:for-each select="n1:Product">
						<tns:Product>
							<xsl:for-each select="n1:ExtraParameters">
								<tns:ExtraParameters>
									<xsl:for-each select="n1:ExtraField">
										<tns:ExtraField>
											<xsl:for-each select="@ParameterName">
												<tns:ParameterName>
													<xsl:value-of select="."/>
												</tns:ParameterName>
											</xsl:for-each>
										</tns:ExtraField>
									</xsl:for-each>
								</tns:ExtraParameters>
							</xsl:for-each>
							<xsl:for-each select="n1:OptionPlan">
								<tns:OptionPlan>
									<xsl:for-each select="n1:ExtraParameter">
										<tns:ExtraParameter>
											<xsl:for-each select="n1:ExtraField">
												<tns:ExtraField>
													<xsl:for-each select="@ParameterName">
														<tns:ParameterName>
															<xsl:value-of select="."/>
														</tns:ParameterName>
													</xsl:for-each>
												</tns:ExtraField>
											</xsl:for-each>
										</tns:ExtraParameter>
									</xsl:for-each>
									<xsl:for-each select="n1:Name">
										<tns:Name>
											<xsl:value-of select="."/>
										</tns:Name>
									</xsl:for-each>
									<xsl:for-each select="n1:PONumber">
										<tns:PONumber>
											<xsl:value-of select="."/>
										</tns:PONumber>
									</xsl:for-each>
									<xsl:for-each select="n1:ServiceOffering">
										<tns:ServiceOffering>
											<xsl:value-of select="."/>
										</tns:ServiceOffering>
									</xsl:for-each>
								</tns:OptionPlan>
							</xsl:for-each>
							<xsl:for-each select="n1:ProgramCode">
								<tns:ProgramCode>
									<xsl:value-of select="."/>
								</tns:ProgramCode>
							</xsl:for-each>
							<xsl:for-each select="n1:ProgramName">
								<tns:ProgramName>
									<xsl:value-of select="."/>
								</tns:ProgramName>
							</xsl:for-each>
						</tns:Product>
					</xsl:for-each>
					<xsl:for-each select="n1:ProtocolId">
						<tns:ProtocolId>
							<xsl:value-of select="."/>
						</tns:ProtocolId>
					</xsl:for-each>
					<xsl:for-each select="n1:Reserved1">
						<tns:Reserved1>
							<xsl:value-of select="."/>
						</tns:Reserved1>
					</xsl:for-each>
					<xsl:for-each select="n1:Reserved2">
						<tns:Reserved2>
							<xsl:value-of select="."/>
						</tns:Reserved2>
					</xsl:for-each>
					<xsl:for-each select="n1:Reserved3">
						<tns:Reserved3>
							<xsl:value-of select="."/>
						</tns:Reserved3>
					</xsl:for-each>
					<xsl:for-each select="n1:Reserved4">
						<tns:Reserved4>
							<xsl:value-of select="."/>
						</tns:Reserved4>
					</xsl:for-each>
					<xsl:for-each select="n1:Reserved5">
						<tns:Reserved5>
							<xsl:value-of select="."/>
						</tns:Reserved5>
					</xsl:for-each>
					<xsl:for-each select="n1:Reserved6">
						<tns:Reserved6>
							<xsl:value-of select="."/>
						</tns:Reserved6>
					</xsl:for-each>
					<xsl:for-each select="n1:Reserved7">
						<tns:Reserved7>
							<xsl:value-of select="."/>
						</tns:Reserved7>
					</xsl:for-each>
					<xsl:for-each select="n1:Reserved8">
						<tns:Reserved8>
							<xsl:value-of select="."/>
						</tns:Reserved8>
					</xsl:for-each>
					<xsl:for-each select="n1:SAN">
						<tns:SAN>
							<xsl:value-of select="."/>
						</tns:SAN>
					</xsl:for-each>
					<xsl:for-each select="n1:SecurityPasscode">
						<tns:SecurityPasscode>
							<xsl:value-of select="."/>
						</tns:SecurityPasscode>
					</xsl:for-each>
					<xsl:for-each select="n1:ServiceOrderNumber">
						<tns:ServiceOrderNumber>
							<xsl:value-of select="."/>
						</tns:ServiceOrderNumber>
					</xsl:for-each>
					<xsl:for-each select="n1:SFDCProduct">
						<tns:SFDCProduct>
							<xsl:for-each select="n1:AnytimeBytes">
								<tns:AnytimeBytes>
									<xsl:value-of select="."/>
								</tns:AnytimeBytes>
							</xsl:for-each>
							<xsl:for-each select="n1:BonusBytes">
								<tns:BonusBytes>
									<xsl:value-of select="."/>
								</tns:BonusBytes>
							</xsl:for-each>
							<xsl:for-each select="n1:DataAllowanceManager">
								<tns:DataAllowanceManager>
									<xsl:value-of select="."/>
								</tns:DataAllowanceManager>
							</xsl:for-each>
							<xsl:for-each select="n1:DownloadSpeed">
								<tns:DownloadSpeed>
									<xsl:value-of select="."/>
								</tns:DownloadSpeed>
							</xsl:for-each>
							<xsl:for-each select="n1:EndDate">
								<tns:EndDate>
									<xsl:value-of select="."/>
								</tns:EndDate>
							</xsl:for-each>
							<xsl:for-each select="n1:OfferDisplayName">
								<tns:OfferDisplayName>
									<xsl:value-of select="."/>
								</tns:OfferDisplayName>
							</xsl:for-each>
							<xsl:for-each select="n1:OfferLineItemList">
								<tns:OfferLineItemList>
									<xsl:for-each select="n1:OfferLineItem">
										<tns:OfferLineItem>
											<xsl:for-each select="n1:OfferLineItemCategory">
												<tns:OfferLineItemCategory>
													<xsl:value-of select="."/>
												</tns:OfferLineItemCategory>
											</xsl:for-each>
											<xsl:for-each select="n1:OfferLineItemName">
												<tns:OfferLineItemName>
													<xsl:value-of select="."/>
												</tns:OfferLineItemName>
											</xsl:for-each>
										</tns:OfferLineItem>
									</xsl:for-each>
								</tns:OfferLineItemList>
							</xsl:for-each>
							<xsl:for-each select="n1:OfferName">
								<tns:OfferName>
									<xsl:value-of select="."/>
								</tns:OfferName>
							</xsl:for-each>
							<xsl:for-each select="n1:OfferType">
								<tns:OfferType>
									<xsl:value-of select="."/>
								</tns:OfferType>
							</xsl:for-each>
							<xsl:for-each select="n1:TransportName">
								<tns:TransportName>
									<xsl:value-of select="."/>
								</tns:TransportName>
							</xsl:for-each>
							<xsl:for-each select="n1:UploadSpeed">
								<tns:UploadSpeed>
									<xsl:value-of select="."/>
								</tns:UploadSpeed>
							</xsl:for-each>
						</tns:SFDCProduct>
					</xsl:for-each>
					<xsl:for-each select="n1:SSN">
						<tns:SSN>
							<xsl:value-of select="."/>
						</tns:SSN>
					</xsl:for-each>
					<xsl:for-each select="n1:TransportInformation">
						<tns:TransportInformation>
							<xsl:for-each select="n1:TransportFeasibilityParameter">
								<tns:TransportFeasibilityParameter>
									<xsl:for-each select="n1:AvailabilityFlag">
										<tns:AvailabilityFlag>
											<xsl:value-of select="."/>
										</tns:AvailabilityFlag>
									</xsl:for-each>
									<xsl:for-each select="n1:Band">
										<tns:Band>
											<xsl:value-of select="."/>
										</tns:Band>
									</xsl:for-each>
									<xsl:for-each select="n1:BeamID">
										<tns:BeamID>
											<xsl:value-of select="."/>
										</tns:BeamID>
									</xsl:for-each>
									<xsl:for-each select="n1:BusinessAvailabilityFlag">
										<tns:BusinessAvailabilityFlag>
											<xsl:value-of select="."/>
										</tns:BusinessAvailabilityFlag>
									</xsl:for-each>
									<xsl:for-each select="n1:MinAntennaSize">
										<tns:MinAntennaSize>
											<xsl:value-of select="."/>
										</tns:MinAntennaSize>
									</xsl:for-each>
									<xsl:for-each select="n1:MinODUPower">
										<tns:MinODUPower>
											<xsl:value-of select="."/>
										</tns:MinODUPower>
									</xsl:for-each>
									<xsl:for-each select="n1:Polarization">
										<tns:Polarization>
											<xsl:value-of select="."/>
										</tns:Polarization>
									</xsl:for-each>
									<xsl:for-each select="n1:SatellitedID">
										<tns:SatellitedID>
											<xsl:value-of select="."/>
										</tns:SatellitedID>
									</xsl:for-each>
									<xsl:for-each select="n1:SLVTParametersList">
										<tns:SLVTParametersList>
											<xsl:for-each select="n1:SLVTParameters">
												<tns:SLVTParameters>
													<xsl:for-each select="n1:AntennaSize">
														<tns:AntennaSize>
															<xsl:value-of select="."/>
														</tns:AntennaSize>
													</xsl:for-each>
													<xsl:for-each select="n1:Availability">
														<tns:Availability>
															<xsl:value-of select="."/>
														</tns:Availability>
													</xsl:for-each>
													<xsl:for-each select="n1:RadioPower">
														<tns:RadioPower>
															<xsl:value-of select="."/>
														</tns:RadioPower>
													</xsl:for-each>
												</tns:SLVTParameters>
											</xsl:for-each>
										</tns:SLVTParametersList>
									</xsl:for-each>
									<xsl:for-each select="n1:TransportName">
										<tns:TransportName>
											<xsl:value-of select="."/>
										</tns:TransportName>
									</xsl:for-each>
								</tns:TransportFeasibilityParameter>
							</xsl:for-each>
						</tns:TransportInformation>
					</xsl:for-each>
					<xsl:for-each select="n1:UpfrontChargingDetails">
						<tns:UpfrontChargingDetails>
							<xsl:for-each select="n1:NumberOfInstallments">
								<tns:NumberOfInstallments>
									<xsl:value-of select="."/>
								</tns:NumberOfInstallments>
							</xsl:for-each>
							<xsl:for-each select="n1:PaymentDetails">
								<tns:PaymentDetails>
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
								</tns:PaymentDetails>
							</xsl:for-each>
							<xsl:for-each select="n1:UpfrontAmount">
								<tns:UpfrontAmount>
									<xsl:value-of select="."/>
								</tns:UpfrontAmount>
							</xsl:for-each>
						</tns:UpfrontChargingDetails>
					</xsl:for-each>
				</tns:req>
			</tns:ModifyOrderRequest>
		</xsl:template>
	</xsl:stylesheet>
