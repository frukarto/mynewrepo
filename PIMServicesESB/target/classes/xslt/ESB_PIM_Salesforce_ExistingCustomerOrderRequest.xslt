<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/partner" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" exclude-result-prefixes="core n1 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="n1:ExistingCustomerOrderRequest">
			<tns:ExistingCustomerOrderRequest>		
				<tns:req>
					<xsl:for-each select="n1:AgentId">
						<tns:AgentId>
							<xsl:value-of select="."/>
						</tns:AgentId>
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
					<xsl:for-each select="n1:CustomerLocationId">
						<tns:CustomerLocationId>
							<xsl:value-of select="."/>
						</tns:CustomerLocationId>
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
					<xsl:for-each select="n1:Email">
						<tns:Email>
							<xsl:value-of select="."/>
						</tns:Email>
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
					<xsl:for-each select="n1:PriceCheckFlag">
						<tns:PriceCheckFlag>
							<xsl:value-of select="."/>
						</tns:PriceCheckFlag>
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
				</tns:req>
			</tns:ExistingCustomerOrderRequest>
		</xsl:template>
	</xsl:stylesheet>
