<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" xmlns:core2="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/partner" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" exclude-result-prefixes="tns core2 n1 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/VOR_MergeResponse">
			<OrderDetailsResponse>
				<xsl:variable name="VOR_MergeResponse" select="."/>	
				<xsl:for-each select="n1:OrderDetailsResponse">							
							<xsl:for-each select="n1:MessageHeader">
								<MessageHeader>
									<xsl:for-each select="n1:TransactionDateTime">
										<TransactionDateTime>
											<xsl:value-of select="."/>
										</TransactionDateTime>
									</xsl:for-each>
									<xsl:for-each select="n1:TransactionCode">
										<TransactionCode>
											<xsl:value-of select="."/>
										</TransactionCode>
									</xsl:for-each>
									<xsl:for-each select="n1:TransactionSequenceId">
										<TransactionSequenceId>
											<xsl:value-of select="."/>
										</TransactionSequenceId>
									</xsl:for-each>
									<xsl:for-each select="n1:CorrelationTransactionId">
										<CorrelationTransactionId>
											<xsl:value-of select="."/>
										</CorrelationTransactionId>
									</xsl:for-each>
								</MessageHeader>
								</xsl:for-each>
								<xsl:for-each select="n1:Code">
								<Code>
									<xsl:value-of select="."/>
								</Code>
							</xsl:for-each>
							<xsl:for-each select="n1:Message">
								<Message>
									<xsl:value-of select="."/>
								</Message>
							</xsl:for-each>
							
							<xsl:for-each select="n1:OrderId">
								<OrderId>
									<xsl:value-of select="."/>
								</OrderId>
							</xsl:for-each>
							<xsl:for-each select="n1:SAN">
								<SAN>
									<xsl:value-of select="."/>
								</SAN>
							</xsl:for-each>
							<xsl:for-each select="n1:FSOId">
								<FSOId>
									<xsl:value-of select="."/>
								</FSOId>
							</xsl:for-each>
							<xsl:for-each select="n1:OrderDate">
								<OrderDate>
									<xsl:value-of select="."/>
								</OrderDate>
							</xsl:for-each>
							<xsl:for-each select="n1:OrderStatus">
								<OrderStatus>
									<xsl:value-of select="."/>
								</OrderStatus>
							</xsl:for-each>
							<xsl:for-each select="n1:OrderHasError">
								<OrderHasError>
									<xsl:value-of select="."/>
								</OrderHasError>
							</xsl:for-each>
							<xsl:for-each select="n1:PIN">
								<PIN>
									<xsl:value-of select="."/>
								</PIN>
							</xsl:for-each>
							<xsl:for-each select="n1:PartnerId">
								<PartnerId>
									<xsl:value-of select="."/>
								</PartnerId>
							</xsl:for-each>
							<xsl:for-each select="n1:Product">
								<Product>
									<xsl:for-each select="n1:Package">
										<Package>
											<xsl:value-of select="."/>
										</Package>
									</xsl:for-each>
									<xsl:for-each select="n1:ProgramCode">
										<ProgramCode>
											<xsl:value-of select="."/>
										</ProgramCode>
									</xsl:for-each>
									<xsl:for-each select="n1:OptionPlan">
										<OptionPlan>
											<xsl:for-each select="n1:Name">
												<Name>
													<xsl:value-of select="."/>
												</Name>
											</xsl:for-each>
											<xsl:for-each select="n1:ServiceOffering">
												<ServiceOffering>
													<xsl:value-of select="."/>
												</ServiceOffering>
											</xsl:for-each>
											<xsl:for-each select="n1:PONumber">
												<PONumber>
													<xsl:value-of select="."/>
												</PONumber>
											</xsl:for-each>
											<xsl:for-each select="n1:ExtraParameter">
												<ExtraParameter>
													<xsl:for-each select="n1:ExtraField">
														<ExtraField>
															<xsl:for-each select="@ParameterName">
																<xsl:attribute name="ParameterName">
																	<xsl:value-of select="."/>
																</xsl:attribute>
															</xsl:for-each>
															<xsl:value-of select="."/>
														</ExtraField>
													</xsl:for-each>
												</ExtraParameter>
											</xsl:for-each>
										</OptionPlan>
									</xsl:for-each>
									<xsl:for-each select="n1:ExtraParameters">
										<ExtraParameters>
											<xsl:for-each select="n1:ExtraField">
												<ExtraField>
													<xsl:for-each select="@ParameterName">
														<xsl:attribute name="ParameterName">
															<xsl:value-of select="."/>
														</xsl:attribute>
													</xsl:for-each>
													<xsl:value-of select="."/>
												</ExtraField>
											</xsl:for-each>
										</ExtraParameters>
									</xsl:for-each>
									<xsl:for-each select="n1:ProgramName">
										<ProgramName>
											<xsl:value-of select="."/>
										</ProgramName>
									</xsl:for-each>
								</Product>
							</xsl:for-each>
							<xsl:for-each select="n1:Name">
								<Name>
									<xsl:for-each select="n1:FirstName">
										<FirstName>
											<xsl:value-of select="."/>
										</FirstName>
									</xsl:for-each>
									<xsl:for-each select="n1:MiddleName">
										<MiddleName>
											<xsl:value-of select="."/>
										</MiddleName>
									</xsl:for-each>
									<xsl:for-each select="n1:LastName">
										<LastName>
											<xsl:value-of select="."/>
										</LastName>
									</xsl:for-each>
									<xsl:for-each select="n1:LastNameSuffix">
										<LastNameSuffix>
											<xsl:value-of select="."/>
										</LastNameSuffix>
									</xsl:for-each>
								</Name>
							</xsl:for-each>
							<xsl:for-each select="n1:InstallAddress">
								<InstallAddress>
									<xsl:for-each select="n1:StreetAddress1">
										<StreetAddress1>
											<xsl:value-of select="."/>
										</StreetAddress1>
									</xsl:for-each>
									<xsl:for-each select="n1:StreetAddress2">
										<StreetAddress2>
											<xsl:value-of select="."/>
										</StreetAddress2>
									</xsl:for-each>
									<xsl:for-each select="n1:City">
										<City>
											<xsl:value-of select="."/>
										</City>
									</xsl:for-each>
									<xsl:for-each select="n1:State">
										<State>
											<xsl:value-of select="."/>
										</State>
									</xsl:for-each>
									<xsl:for-each select="n1:PostalCode">
										<PostalCode>
											<xsl:value-of select="."/>
										</PostalCode>
									</xsl:for-each>
									<xsl:for-each select="n1:CountryCode">
										<CountryCode>
											<xsl:value-of select="."/>
										</CountryCode>
									</xsl:for-each>
									<xsl:for-each select="n1:OverrideAddress">
										<OverrideAddress>
											<xsl:value-of select="."/>
										</OverrideAddress>
									</xsl:for-each>
									<xsl:for-each select="n1:County">
										<County>
											<xsl:value-of select="."/>
										</County>
									</xsl:for-each>
									<xsl:for-each select="n1:Latitude">
										<Latitude>
											<xsl:value-of select="."/>
										</Latitude>
									</xsl:for-each>
									<xsl:for-each select="n1:Longitude">
										<Longitude>
											<xsl:value-of select="."/>
										</Longitude>
									</xsl:for-each>
									<xsl:for-each select="n1:Landmark">
										<Landmark>
											<xsl:value-of select="."/>
										</Landmark>
									</xsl:for-each>
									<xsl:for-each select="n1:RBDI">
										<RBDI>
											<xsl:value-of select="."/>
										</RBDI>
									</xsl:for-each>
									<xsl:for-each select="n1:EACFStatus">
										<EACFStatus>
											<xsl:value-of select="."/>
										</EACFStatus>
									</xsl:for-each>
									<xsl:for-each select="n1:ErrorCode">
										<ErrorCode>
											<xsl:value-of select="."/>
										</ErrorCode>
									</xsl:for-each>
									<xsl:for-each select="n1:ErrorDescription">
										<ErrorDescription>
											<xsl:value-of select="."/>
										</ErrorDescription>
									</xsl:for-each>
									<xsl:for-each select="n1:Neighborhood">
										<Neighborhood>
											<xsl:value-of select="."/>
										</Neighborhood>
									</xsl:for-each>
									<xsl:for-each select="n1:Complement">
										<Complement>
											<xsl:value-of select="."/>
										</Complement>
									</xsl:for-each>
								</InstallAddress>
							</xsl:for-each>
							<xsl:for-each select="n1:DayPhone">
								<DayPhone>
									<xsl:for-each select="n1:AreaCode">
										<AreaCode>
											<xsl:value-of select="."/>
										</AreaCode>
									</xsl:for-each>
									<xsl:for-each select="n1:Prefix">
										<Prefix>
											<xsl:value-of select="."/>
										</Prefix>
									</xsl:for-each>
									<xsl:for-each select="n1:Exchange">
										<Exchange>
											<xsl:value-of select="."/>
										</Exchange>
									</xsl:for-each>
								</DayPhone>
							</xsl:for-each>
							<xsl:for-each select="n1:DayPhoneNumber">
								<DayPhoneNumber>
									<xsl:value-of select="."/>
								</DayPhoneNumber>
							</xsl:for-each>
							<xsl:for-each select="n1:NightPhone">
								<NightPhone>
									<xsl:for-each select="n1:AreaCode">
										<AreaCode>
											<xsl:value-of select="."/>
										</AreaCode>
									</xsl:for-each>
									<xsl:for-each select="n1:Prefix">
										<Prefix>
											<xsl:value-of select="."/>
										</Prefix>
									</xsl:for-each>
									<xsl:for-each select="n1:Exchange">
										<Exchange>
											<xsl:value-of select="."/>
										</Exchange>
									</xsl:for-each>
								</NightPhone>
							</xsl:for-each>
							<xsl:for-each select="n1:NightPhoneNumber">
								<NightPhoneNumber>
									<xsl:value-of select="."/>
								</NightPhoneNumber>
							</xsl:for-each>
							<xsl:for-each select="n1:Email">
								<Email>
									<xsl:value-of select="."/>
								</Email>
							</xsl:for-each>
							<xsl:for-each select="n1:BillingAddress">
								<BillingAddress>
									<xsl:for-each select="n1:StreetAddress1">
										<StreetAddress1>
											<xsl:value-of select="."/>
										</StreetAddress1>
									</xsl:for-each>
									<xsl:for-each select="n1:StreetAddress2">
										<StreetAddress2>
											<xsl:value-of select="."/>
										</StreetAddress2>
									</xsl:for-each>
									<xsl:for-each select="n1:City">
										<City>
											<xsl:value-of select="."/>
										</City>
									</xsl:for-each>
									<xsl:for-each select="n1:State">
										<State>
											<xsl:value-of select="."/>
										</State>
									</xsl:for-each>
									<xsl:for-each select="n1:PostalCode">
										<PostalCode>
											<xsl:value-of select="."/>
										</PostalCode>
									</xsl:for-each>
									<xsl:for-each select="n1:CountryCode">
										<CountryCode>
											<xsl:value-of select="."/>
										</CountryCode>
									</xsl:for-each>
									<xsl:for-each select="n1:OverrideAddress">
										<OverrideAddress>
											<xsl:value-of select="."/>
										</OverrideAddress>
									</xsl:for-each>
									<xsl:for-each select="n1:County">
										<County>
											<xsl:value-of select="."/>
										</County>
									</xsl:for-each>
									<xsl:for-each select="n1:Latitude">
										<Latitude>
											<xsl:value-of select="."/>
										</Latitude>
									</xsl:for-each>
									<xsl:for-each select="n1:Longitude">
										<Longitude>
											<xsl:value-of select="."/>
										</Longitude>
									</xsl:for-each>
									<xsl:for-each select="n1:Landmark">
										<Landmark>
											<xsl:value-of select="."/>
										</Landmark>
									</xsl:for-each>
									<xsl:for-each select="n1:RBDI">
										<RBDI>
											<xsl:value-of select="."/>
										</RBDI>
									</xsl:for-each>
									<xsl:for-each select="n1:EACFStatus">
										<EACFStatus>
											<xsl:value-of select="."/>
										</EACFStatus>
									</xsl:for-each>
									<xsl:for-each select="n1:ErrorCode">
										<ErrorCode>
											<xsl:value-of select="."/>
										</ErrorCode>
									</xsl:for-each>
									<xsl:for-each select="n1:ErrorDescription">
										<ErrorDescription>
											<xsl:value-of select="."/>
										</ErrorDescription>
									</xsl:for-each>
									<xsl:for-each select="n1:Neighborhood">
										<Neighborhood>
											<xsl:value-of select="."/>
										</Neighborhood>
									</xsl:for-each>
									<xsl:for-each select="n1:Complement">
										<Complement>
											<xsl:value-of select="."/>
										</Complement>
									</xsl:for-each>
								</BillingAddress>
							</xsl:for-each>
							<xsl:for-each select="n1:Note">
								<Note>
									<xsl:value-of select="."/>
								</Note>
							</xsl:for-each>
							<xsl:for-each select="n1:CreditCardInfo">
								<CreditCardInfo>
									<xsl:for-each select="n1:CreditCardName">
										<CreditCardName>
											<xsl:for-each select="n1:FirstName">
												<FirstName>
													<xsl:value-of select="."/>
												</FirstName>
											</xsl:for-each>
											<xsl:for-each select="n1:MiddleName">
												<MiddleName>
													<xsl:value-of select="."/>
												</MiddleName>
											</xsl:for-each>
											<xsl:for-each select="n1:LastName">
												<LastName>
													<xsl:value-of select="."/>
												</LastName>
											</xsl:for-each>
											<xsl:for-each select="n1:LastNameSuffix">
												<LastNameSuffix>
													<xsl:value-of select="."/>
												</LastNameSuffix>
											</xsl:for-each>
										</CreditCardName>
									</xsl:for-each>
									<xsl:for-each select="n1:CreditCardNumber">
										<CreditCardNumber>
											<xsl:value-of select="."/>
										</CreditCardNumber>
									</xsl:for-each>
									<xsl:for-each select="n1:TokenNumber">
										<TokenNumber>
											<xsl:value-of select="."/>
										</TokenNumber>
									</xsl:for-each>
									<xsl:for-each select="n1:ExpirationMonth">
										<ExpirationMonth>
											<xsl:value-of select="."/>
										</ExpirationMonth>
									</xsl:for-each>
									<xsl:for-each select="n1:ExpirationYear">
										<ExpirationYear>
											<xsl:value-of select="."/>
										</ExpirationYear>
									</xsl:for-each>
									<xsl:for-each select="n1:CVV">
										<CVV>
											<xsl:value-of select="."/>
										</CVV>
									</xsl:for-each>
									<xsl:for-each select="n1:CreditCardType">
										<CreditCardType>
											<xsl:value-of select="."/>
										</CreditCardType>
									</xsl:for-each>
									<xsl:for-each select="n1:BilingAddress">
										<BilingAddress>
											<xsl:for-each select="n1:StreetAddress1">
												<StreetAddress1>
													<xsl:value-of select="."/>
												</StreetAddress1>
											</xsl:for-each>
											<xsl:for-each select="n1:StreetAddress2">
												<StreetAddress2>
													<xsl:value-of select="."/>
												</StreetAddress2>
											</xsl:for-each>
											<xsl:for-each select="n1:City">
												<City>
													<xsl:value-of select="."/>
												</City>
											</xsl:for-each>
											<xsl:for-each select="n1:State">
												<State>
													<xsl:value-of select="."/>
												</State>
											</xsl:for-each>
											<xsl:for-each select="n1:PostalCode">
												<PostalCode>
													<xsl:value-of select="."/>
												</PostalCode>
											</xsl:for-each>
											<xsl:for-each select="n1:CountryCode">
												<CountryCode>
													<xsl:value-of select="."/>
												</CountryCode>
											</xsl:for-each>
											<xsl:for-each select="n1:OverrideAddress">
												<OverrideAddress>
													<xsl:value-of select="."/>
												</OverrideAddress>
											</xsl:for-each>
											<xsl:for-each select="n1:County">
												<County>
													<xsl:value-of select="."/>
												</County>
											</xsl:for-each>
											<xsl:for-each select="n1:Latitude">
												<Latitude>
													<xsl:value-of select="."/>
												</Latitude>
											</xsl:for-each>
											<xsl:for-each select="n1:Longitude">
												<Longitude>
													<xsl:value-of select="."/>
												</Longitude>
											</xsl:for-each>
											<xsl:for-each select="n1:Landmark">
												<Landmark>
													<xsl:value-of select="."/>
												</Landmark>
											</xsl:for-each>
											<xsl:for-each select="n1:RBDI">
												<RBDI>
													<xsl:value-of select="."/>
												</RBDI>
											</xsl:for-each>
											<xsl:for-each select="n1:EACFStatus">
												<EACFStatus>
													<xsl:value-of select="."/>
												</EACFStatus>
											</xsl:for-each>
											<xsl:for-each select="n1:ErrorCode">
												<ErrorCode>
													<xsl:value-of select="."/>
												</ErrorCode>
											</xsl:for-each>
											<xsl:for-each select="n1:ErrorDescription">
												<ErrorDescription>
													<xsl:value-of select="."/>
												</ErrorDescription>
											</xsl:for-each>
											<xsl:for-each select="n1:Neighborhood">
												<Neighborhood>
													<xsl:value-of select="."/>
												</Neighborhood>
											</xsl:for-each>
											<xsl:for-each select="n1:Complement">
												<Complement>
													<xsl:value-of select="."/>
												</Complement>
											</xsl:for-each>
										</BilingAddress>
									</xsl:for-each>
									<xsl:for-each select="n1:CCAuthAmount">
										<CCAuthAmount>
											<xsl:value-of select="."/>
										</CCAuthAmount>
									</xsl:for-each>
									<xsl:for-each select="n1:CCAuthAmtReleaseDate">
										<CCAuthAmtReleaseDate>
											<xsl:value-of select="."/>
										</CCAuthAmtReleaseDate>
									</xsl:for-each>
								</CreditCardInfo>
							</xsl:for-each>
							<xsl:for-each select="n1:AgentId">
								<AgentId>
									<xsl:value-of select="."/>
								</AgentId>
							</xsl:for-each>
							<xsl:for-each select="n1:OrderType">
								<OrderType>
									<xsl:value-of select="."/>
								</OrderType>
							</xsl:for-each>
							<xsl:for-each select="n1:OrderSubType">
								<OrderSubType>
									<xsl:value-of select="."/>
								</OrderSubType>
							</xsl:for-each>
							<xsl:for-each select="n1:CustomerId">
								<CustomerId>
									<xsl:value-of select="."/>
								</CustomerId>
							</xsl:for-each>
							<xsl:for-each select="n1:ReferralId">
								<ReferralId>
									<xsl:value-of select="."/>
								</ReferralId>
							</xsl:for-each>
							<xsl:for-each select="n1:ReferralSource">
								<ReferralSource>
									<xsl:value-of select="."/>
								</ReferralSource>
							</xsl:for-each>
							<xsl:for-each select="n1:Reserved1">
								<Reserved1>
									<xsl:value-of select="."/>
								</Reserved1>
							</xsl:for-each>
							<xsl:for-each select="n1:Reserved2">
								<Reserved2>
									<xsl:value-of select="."/>
								</Reserved2>
							</xsl:for-each>
							<xsl:for-each select="n1:Reserved3">
								<Reserved3>
									<xsl:value-of select="."/>
								</Reserved3>
							</xsl:for-each>
							<xsl:for-each select="n1:Reserved4">
								<Reserved4>
									<xsl:value-of select="."/>
								</Reserved4>
							</xsl:for-each>
							<xsl:for-each select="n1:Reserved5">
								<Reserved5>
									<xsl:value-of select="."/>
								</Reserved5>
							</xsl:for-each>
							<xsl:for-each select="n1:Reserved6">
								<Reserved6>
									<xsl:value-of select="."/>
								</Reserved6>
							</xsl:for-each>
							<xsl:for-each select="n1:Reserved7">
								<Reserved7>
									<xsl:value-of select="."/>
								</Reserved7>
							</xsl:for-each>
							<xsl:for-each select="n1:Reserved8">
								<Reserved8>
									<xsl:value-of select="."/>
								</Reserved8>
							</xsl:for-each>
							<xsl:for-each select="n1:ODUParameters">
								<ODUParameters>
									<xsl:for-each select="n1:AntennaSize">
										<AntennaSize>
											<xsl:value-of select="."/>
										</AntennaSize>
									</xsl:for-each>
									<xsl:for-each select="n1:RadioPower">
										<RadioPower>
											<xsl:value-of select="."/>
										</RadioPower>
									</xsl:for-each>
									<xsl:for-each select="n1:Availability">
										<Availability>
											<xsl:value-of select="."/>
										</Availability>
									</xsl:for-each>
								</ODUParameters>
							</xsl:for-each>
							<xsl:for-each select="n1:BeamId">
								<BeamId>
									<xsl:value-of select="."/>
								</BeamId>
							</xsl:for-each>
							<xsl:for-each select="n1:UpfrontCharge">
								<UpfrontCharge>
									<xsl:value-of select="."/>
								</UpfrontCharge>
							</xsl:for-each>
							<xsl:for-each select="n1:ProspectID">
								<ProspectID>
									<xsl:value-of select="."/>
								</ProspectID>
							</xsl:for-each>
							<xsl:for-each select="n1:BusinessModel">
								<BusinessModel>
									<xsl:value-of select="."/>
								</BusinessModel>
							</xsl:for-each>
							<xsl:for-each select="n1:ClassAID">
								<ClassAID>
									<xsl:value-of select="."/>
								</ClassAID>
							</xsl:for-each>
							<xsl:for-each select="n1:ClassAName">
								<ClassAName>
									<xsl:value-of select="."/>
								</ClassAName>
							</xsl:for-each>
							<xsl:for-each select="n1:OrderParams">
								<OrderParams>
									<xsl:value-of select="."/>
								</OrderParams>
							</xsl:for-each>				
								</xsl:for-each>	
						<xsl:for-each select="tns:ViewOrderRequestResponse">
								<xsl:for-each select="tns:result">
									<xsl:for-each select="tns:SFDCProduct">
										<SFDCProduct>
											<xsl:for-each select="tns:OfferName">
												<OfferName>
													<xsl:value-of select="."/>
												</OfferName>
											</xsl:for-each>
											<xsl:for-each select="tns:OfferLineItemList">
												<OfferLineItemList>
													<xsl:for-each select="tns:OfferLineItem">
														<OfferLineItem>
															<xsl:for-each select="tns:OfferLineItemCategory">
																<OfferLineItemCategory>
																	<xsl:value-of select="."/>
																</OfferLineItemCategory>
															</xsl:for-each>
															<xsl:for-each select="tns:OfferLineItemName">
																<OfferLineItemName>
																	<xsl:value-of select="."/>
																</OfferLineItemName>
															</xsl:for-each>
														</OfferLineItem>
													</xsl:for-each>
												</OfferLineItemList>
											</xsl:for-each>
											<xsl:for-each select="tns:TransportName">
												<TransportName>
													<xsl:value-of select="."/>
												</TransportName>
											</xsl:for-each>
										</SFDCProduct>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>				
			</OrderDetailsResponse>
		</xsl:template>
	</xsl:stylesheet>
