<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" exclude-result-prefixes="tns xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="tns:ChangeServiceStatusRequestResponse">
			<StandardResponse>
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
					<xsl:for-each select="tns:OrderId">
						<OrderId>
							<xsl:value-of select="."/>
						</OrderId>
					</xsl:for-each>
					<xsl:for-each select="tns:ServiceOrderNumber">
						<ServiceOrderNumber>
							<xsl:value-of select="."/>
						</ServiceOrderNumber>
					</xsl:for-each>
					<xsl:for-each select="tns:UpfrontCharge">
						<UpfrontCharge>
							<xsl:value-of select="."/>
						</UpfrontCharge>
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
					<xsl:for-each select="tns:SAN">
						<SAN>
							<xsl:value-of select="."/>
						</SAN>
					</xsl:for-each>
					<xsl:for-each select="tns:RequestType">
						<RequestType>
							<xsl:value-of select="."/>
						</RequestType>
					</xsl:for-each>
					<xsl:for-each select="tns:StandardizedInstallAddress">
						<StandardizedInstallAddress>
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
						</StandardizedInstallAddress>
					</xsl:for-each>
					<xsl:for-each select="tns:StandardizedBillingAddress">
						<StandardizedBillingAddress>
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
						</StandardizedBillingAddress>
					</xsl:for-each>
					<xsl:for-each select="tns:TransportInformation">
						<TransportInformation>
							<xsl:for-each select="tns:AvailabilityFlag">
								<AvailabilityFlag>
									<xsl:value-of select="."/>
								</AvailabilityFlag>
							</xsl:for-each>
							<xsl:for-each select="tns:BusinessAvailabilityFlag">
								<BusinessAvailabilityFlag>
									<xsl:value-of select="."/>
								</BusinessAvailabilityFlag>
							</xsl:for-each>
							<xsl:for-each select="tns:SatellitedID">
								<SatellitedID>
									<xsl:value-of select="."/>
								</SatellitedID>
							</xsl:for-each>
							<xsl:for-each select="tns:BeamID">
								<BeamID>
									<xsl:value-of select="."/>
								</BeamID>
							</xsl:for-each>
							<xsl:for-each select="tns:Polarization">
								<Polarization>
									<xsl:value-of select="."/>
								</Polarization>
							</xsl:for-each>
							<xsl:for-each select="tns:Band">
								<Band>
									<xsl:value-of select="."/>
								</Band>
							</xsl:for-each>
							<xsl:for-each select="tns:MinODUPower">
								<MinODUPower>
									<xsl:value-of select="."/>
								</MinODUPower>
							</xsl:for-each>
							<xsl:for-each select="tns:MinAntennaSize">
								<MinAntennaSize>
									<xsl:value-of select="."/>
								</MinAntennaSize>
							</xsl:for-each>
							<xsl:for-each select="tns:TransportName">
								<TransportName>
									<xsl:value-of select="."/>
								</TransportName>
							</xsl:for-each>
							<xsl:for-each select="tns:SLVTParametersList">
								<SLVTParametersList>
									<xsl:for-each select="tns:SLVTParameters">
										<SLVTParameters>
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
										</SLVTParameters>
									</xsl:for-each>
								</SLVTParametersList>
							</xsl:for-each>
						</TransportInformation>
					</xsl:for-each>
				</xsl:for-each>
			</StandardResponse>
		</xsl:template>
	</xsl:stylesheet>
