<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sslvt="http://mergedslvt.bits.hughes.com" xmlns:slvt="http://slvt.bits.hughes.com" xmlns:tns1="http://transportfeasibility.bits.hughes.com" xmlns:core2="http://www.hns.com/iag/schemas/core" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" exclude-result-prefixes="sslvt slvt tns1 core2 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/sslvt:SLVT_finalmerge">
			<EnhancedServicePrequalRequest>
				<xsl:variable name="SLVT_finalmerge" select="."/>
				<TransportInformation>
					<xsl:for-each select="tns1:TransportFeasibilityResponseMsg">
						<xsl:for-each select="tns1:TransportFeasibilityResponse">
							<xsl:for-each select="tns1:TransportFeasibilityParameters">
								<xsl:variable name="TransportFeasibilityParameters" select="."/>
								<TransportFeasibilityParameter>
									<xsl:for-each select="tns1:AvailabilityFlag">
										<AvailabilityFlag>
											<xsl:value-of select="."/>
										</AvailabilityFlag>
									</xsl:for-each>
									<xsl:for-each select="tns1:BusinessAvailabilityFlag">
										<BusinessAvailabilityFlag>
											<xsl:value-of select="."/>
										</BusinessAvailabilityFlag>
									</xsl:for-each>
									<xsl:for-each select="tns1:SatellitedID">
										<SatellitedID>
											<xsl:value-of select="."/>
										</SatellitedID>
									</xsl:for-each>
									<xsl:for-each select="tns1:BeamID">
										<BeamID>
											<xsl:value-of select="."/>
										</BeamID>
									</xsl:for-each>
									<xsl:for-each select="tns1:Polarization">
										<Polarization>
											<xsl:value-of select="."/>
										</Polarization>
									</xsl:for-each>
									<xsl:for-each select="tns1:Band">
										<Band>
											<xsl:value-of select="."/>
										</Band>
									</xsl:for-each>
									<xsl:for-each select="tns1:MinODUPower">
										<MinODUPower>
											<xsl:value-of select="."/>
										</MinODUPower>
									</xsl:for-each>
									<xsl:for-each select="tns1:MinAntennaSize">
										<MinAntennaSize>
											<xsl:value-of select="."/>
										</MinAntennaSize>
									</xsl:for-each>
									<xsl:for-each select="tns1:TransportName">
										<TransportName>
											<xsl:value-of select="."/>
										</TransportName>
									</xsl:for-each>
									<xsl:for-each select="$SLVT_finalmerge/sslvt:MergedSLVTMsg">
										<xsl:variable name="MergedSLVTMsg" select="."/>
										<xsl:for-each select="slvt:SLVTResponseMsg">
											<xsl:for-each select="slvt:SLVTParametersList">
												<xsl:variable name="SLVTParametersList" select="."/>
												<xsl:for-each select="$MergedSLVTMsg/sslvt:SatellitedID">
													<xsl:variable name="SatellitedID" select="."/>
													<xsl:for-each select="$TransportFeasibilityParameters/tns1:SatellitedID">
														<xsl:variable name="SatellitedID1" select="."/>
														<xsl:variable name="ComparisonResult" select="$SatellitedID = $SatellitedID1"/>
														<xsl:for-each select="$TransportFeasibilityParameters/tns1:AvailabilityFlag">
															<xsl:variable name="AvailabilityFlag" select="."/>
															<xsl:for-each select="$MergedSLVTMsg/sslvt:AvailabilityFlag">
																<xsl:variable name="AvailabilityFlag1" select="."/>
																<xsl:variable name="ComparisonResult1" select="$AvailabilityFlag = $AvailabilityFlag1"/>
																<xsl:for-each select="$MergedSLVTMsg/sslvt:BeamID">
																	<xsl:variable name="BeamID" select="."/>
																	<xsl:for-each select="$TransportFeasibilityParameters/tns1:BeamID">
																		<xsl:variable name="BeamID1" select="."/>
																		<xsl:variable name="ComparisonResult2" select="$BeamID = $BeamID1"/>
																		<xsl:variable name="AndResult" select="$ComparisonResult and $ComparisonResult1"/>
																		<xsl:variable name="AndResult1" select="$AndResult and $ComparisonResult2"/>
																		<xsl:if test="string($AndResult1)='true'">
																			<SLVTParametersList>
																				<SLVTParameters>
																					<xsl:for-each select="$SLVTParametersList/slvt:SLVTParameters[1]">
																						<xsl:for-each select="slvt:AntennaSize">
																							<AntennaSize>
																								<xsl:value-of select="."/>
																							</AntennaSize>
																						</xsl:for-each>
																					</xsl:for-each>
																					<xsl:for-each select="$SLVTParametersList/slvt:SLVTParameters[1]">
																						<xsl:for-each select="slvt:RadioPower">
																							<RadioPower>
																								<xsl:value-of select="."/>
																							</RadioPower>
																						</xsl:for-each>
																					</xsl:for-each>
																					<xsl:for-each select="$SLVTParametersList/slvt:SLVTParameters[1]">
																						<xsl:for-each select="slvt:Availability">
																							<Availability>
																								<xsl:value-of select="."/>
																							</Availability>
																						</xsl:for-each>
																					</xsl:for-each>
																				</SLVTParameters>
																			</SLVTParametersList>
																		</xsl:if>
																	</xsl:for-each>
																</xsl:for-each>
															</xsl:for-each>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</TransportFeasibilityParameter>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</TransportInformation>
			</EnhancedServicePrequalRequest>
		</xsl:template>
	</xsl:stylesheet>