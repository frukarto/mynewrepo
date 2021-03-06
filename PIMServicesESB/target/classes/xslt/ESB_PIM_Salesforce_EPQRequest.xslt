<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2005

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce 2005 Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns:n1="http://www.hns.com/iag/schemas/partner" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://soap.sforce.com/schemas/class/PartnersOrder" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" exclude-result-prefixes="core n1 xs fn">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/n1:EnhancedServicePrequalRequest">
			<tns:EnhancedServicePrequalRequest>
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
					<xsl:for-each select="n1:CustomerCategory">
						<tns:CustomerCategory>
							<xsl:value-of select="."/>
						</tns:CustomerCategory>
					</xsl:for-each>
					<xsl:for-each select="n1:CustomerCreditCheckConsentFlag">
						<tns:CustomerCreditCheckConsentFlag>
							<xsl:value-of select="."/>
						</tns:CustomerCreditCheckConsentFlag>
					</xsl:for-each>
					<xsl:for-each select="n1:CustomerName">
						<tns:CustomerName>
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
						</tns:CustomerName>
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
					<xsl:for-each select="n1:DOB">
						<tns:DOB>
							<xsl:value-of select="."/>
						</tns:DOB>
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
					<xsl:for-each select="n1:IsInterestedInVoIP">
						<tns:IsInterestedInVoIP>
							<xsl:value-of select="."/>
						</tns:IsInterestedInVoIP>
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
					<xsl:for-each select="n1:PartnerId">
						<tns:PartnerId>
							<xsl:value-of select="."/>
						</tns:PartnerId>
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
					<xsl:for-each select="n1:ServiceGrade">
						<tns:ServiceGrade>
							<xsl:value-of select="."/>
						</tns:ServiceGrade>
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
				</tns:req>
			</tns:EnhancedServicePrequalRequest>
		</xsl:template>
	</xsl:stylesheet>
