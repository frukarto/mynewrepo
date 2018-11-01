<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" exclude-result-prefixes="tns xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="tns:ViewOrderRequestResponse">
			<OrderDetailsResponse>
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
					<xsl:for-each select="tns:OrderId">
						<OrderId>
							<xsl:value-of select="."/>
						</OrderId>
					</xsl:for-each>
					<xsl:for-each select="tns:SAN">
						<SAN>
							<xsl:value-of select="."/>
						</SAN>
					</xsl:for-each>
					<xsl:for-each select="tns:FSOId">
						<FSOId>
							<xsl:value-of select="."/>
						</FSOId>
					</xsl:for-each>
					<xsl:for-each select="tns:OrderDate">
						<OrderDate>
							<xsl:value-of select="."/>
						</OrderDate>
					</xsl:for-each>
					<xsl:for-each select="tns:OrderStatus">
						<OrderStatus>
							<xsl:value-of select="."/>
						</OrderStatus>
					</xsl:for-each>
					<xsl:for-each select="tns:OrderHasError">
						<OrderHasError>
							<xsl:value-of select="."/>
						</OrderHasError>
					</xsl:for-each>
					<xsl:for-each select="tns:PIN">
						<PIN>
							<xsl:value-of select="."/>
						</PIN>
					</xsl:for-each>
					<xsl:for-each select="tns:PartnerId">
						<PartnerId>
							<xsl:value-of select="."/>
						</PartnerId>
					</xsl:for-each>
					<xsl:for-each select="tns:Product">
						<Product>
							<xsl:for-each select="tns:ProgramCode">
								<ProgramCode>
									<xsl:value-of select="."/>
								</ProgramCode>
							</xsl:for-each>
							<xsl:for-each select="tns:OptionPlan">
								<OptionPlan>
									<xsl:for-each select="tns:Name">
										<Name>
											<xsl:value-of select="."/>
										</Name>
									</xsl:for-each>
									<xsl:for-each select="tns:ServiceOffering">
										<ServiceOffering>
											<xsl:value-of select="."/>
										</ServiceOffering>
									</xsl:for-each>
									<xsl:for-each select="tns:PONumber">
										<PONumber>
											<xsl:value-of select="."/>
										</PONumber>
									</xsl:for-each>
									<xsl:for-each select="tns:ExtraParameter">
										<ExtraParameter>
											<xsl:for-each select="tns:ExtraField">
												<ExtraField>
													<xsl:for-each select="tns:ParameterName">
														<xsl:attribute name="ParameterName">
															<xsl:value-of select="."/>
														</xsl:attribute>
													</xsl:for-each>
												</ExtraField>
											</xsl:for-each>
										</ExtraParameter>
									</xsl:for-each>
								</OptionPlan>
							</xsl:for-each>
							<xsl:for-each select="tns:ExtraParameters">
								<ExtraParameters>
									<xsl:for-each select="tns:ExtraField">
										<ExtraField>
											<xsl:for-each select="tns:ParameterName">
												<xsl:attribute name="ParameterName">
													<xsl:value-of select="."/>
												</xsl:attribute>
											</xsl:for-each>
										</ExtraField>
									</xsl:for-each>
								</ExtraParameters>
							</xsl:for-each>
							<xsl:for-each select="tns:ProgramName">
								<ProgramName>
									<xsl:value-of select="."/>
								</ProgramName>
							</xsl:for-each>
						</Product>
					</xsl:for-each>
					<xsl:for-each select="tns:Name">
						<Name>
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
						</Name>
					</xsl:for-each>
					<xsl:for-each select="tns:InstallAddress">
						<InstallAddress>
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
						</InstallAddress>
					</xsl:for-each>
					<xsl:for-each select="tns:DayPhone">
						<DayPhone>
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
						</DayPhone>
					</xsl:for-each>
					<xsl:for-each select="tns:DayPhoneNumber">
						<DayPhoneNumber>
							<xsl:value-of select="."/>
						</DayPhoneNumber>
					</xsl:for-each>
					<xsl:for-each select="tns:NightPhone">
						<NightPhone>
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
						</NightPhone>
					</xsl:for-each>
					<xsl:for-each select="tns:NightPhoneNumber">
						<NightPhoneNumber>
							<xsl:value-of select="."/>
						</NightPhoneNumber>
					</xsl:for-each>
					<xsl:for-each select="tns:Email">
						<Email>
							<xsl:value-of select="."/>
						</Email>
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
					<xsl:for-each select="tns:Note">
						<Note>
							<xsl:value-of select="."/>
						</Note>
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
					<xsl:for-each select="tns:AgentId">
						<AgentId>
							<xsl:value-of select="."/>
						</AgentId>
					</xsl:for-each>
					<xsl:for-each select="tns:OrderType">
						<OrderType>
							<xsl:value-of select="."/>
						</OrderType>
					</xsl:for-each>
					<xsl:for-each select="tns:OrderSubType">
						<OrderSubType>
							<xsl:value-of select="."/>
						</OrderSubType>
					</xsl:for-each>
					<xsl:for-each select="tns:CustomerId">
						<CustomerId>
							<xsl:value-of select="."/>
						</CustomerId>
					</xsl:for-each>
					<xsl:for-each select="tns:ReferralId">
						<ReferralId>
							<xsl:value-of select="."/>
						</ReferralId>
					</xsl:for-each>
					<xsl:for-each select="tns:ReferralSource">
						<ReferralSource>
							<xsl:value-of select="."/>
						</ReferralSource>
					</xsl:for-each>
					<xsl:for-each select="tns:Reserved1">
						<Reserved1>
							<xsl:value-of select="."/>
						</Reserved1>
					</xsl:for-each>
					<xsl:for-each select="tns:Reserved2">
						<Reserved2>
							<xsl:value-of select="."/>
						</Reserved2>
					</xsl:for-each>
					<xsl:for-each select="tns:Reserved3">
						<Reserved3>
							<xsl:value-of select="."/>
						</Reserved3>
					</xsl:for-each>
					<xsl:for-each select="tns:Reserved4">
						<Reserved4>
							<xsl:value-of select="."/>
						</Reserved4>
					</xsl:for-each>
					<xsl:for-each select="tns:Reserved5">
						<Reserved5>
							<xsl:value-of select="."/>
						</Reserved5>
					</xsl:for-each>
					<xsl:for-each select="tns:Reserved6">
						<Reserved6>
							<xsl:value-of select="."/>
						</Reserved6>
					</xsl:for-each>
					<xsl:for-each select="tns:Reserved7">
						<Reserved7>
							<xsl:value-of select="."/>
						</Reserved7>
					</xsl:for-each>
					<xsl:for-each select="tns:Reserved8">
						<Reserved8>
							<xsl:value-of select="."/>
						</Reserved8>
					</xsl:for-each>
					<xsl:for-each select="tns:ODUParameters">
						<ODUParameters>
							<xsl:for-each select="tns:AntennaSize">
								<AntennaSize>
									<xsl:value-of select="."/>
								</AntennaSize>
							</xsl:for-each>
							<xsl:for-each select="tns:RadioPower">
								<RadioPower>
									<xsl:value-of select="."/>
								</RadioPower>
							</xsl:for-each>
							<xsl:for-each select="tns:Availability">
								<Availability>
									<xsl:value-of select="."/>
								</Availability>
							</xsl:for-each>
						</ODUParameters>
					</xsl:for-each>
					<xsl:for-each select="tns:BeamId">
						<BeamId>
							<xsl:value-of select="."/>
						</BeamId>
					</xsl:for-each>
					<xsl:for-each select="tns:UpfrontCharge">
						<UpfrontCharge>
							<xsl:value-of select="."/>
						</UpfrontCharge>
					</xsl:for-each>
					<xsl:for-each select="tns:ProspectID">
						<ProspectID>
							<xsl:value-of select="."/>
						</ProspectID>
					</xsl:for-each>
					<xsl:for-each select="tns:BusinessModel">
						<BusinessModel>
							<xsl:value-of select="."/>
						</BusinessModel>
					</xsl:for-each>
					<xsl:for-each select="tns:ClassAID">
						<ClassAID>
							<xsl:value-of select="."/>
						</ClassAID>
					</xsl:for-each>
					<xsl:for-each select="tns:ClassAName">
						<ClassAName>
							<xsl:value-of select="."/>
						</ClassAName>
					</xsl:for-each>
					<xsl:for-each select="tns:OrderParams">
						<OrderParams>
							<xsl:value-of select="."/>
						</OrderParams>
					</xsl:for-each>
				</xsl:for-each>
			</OrderDetailsResponse>
		</xsl:template>
	</xsl:stylesheet>
