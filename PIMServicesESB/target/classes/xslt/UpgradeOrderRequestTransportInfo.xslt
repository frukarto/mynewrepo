<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:slvt="http://slvt.bits.hughes.com" xmlns:tns1="http://transportfeasibility.bits.hughes.com" xmlns:core2="http://www.hns.com/iag/schemas/core" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" exclude-result-prefixes="slvt tns1 core2 xs">
		<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
		<xsl:template match="/tfs_slvt_resp_merge">
			<UpgradeOrderRequest>
				<xsl:variable name="tfs_slvt_resp_merge" select="."/>
				<TransportInformation>
				<xsl:for-each select="tns1:TransportFeasibilityResponseMsg">
					<xsl:for-each select="tns1:TransportFeasibilityResponse">
						<xsl:for-each select="tns1:TransportFeasibilityParameters">
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
								<xsl:for-each select="$tfs_slvt_resp_merge/slvt:SLVTResponseMsg">
									<xsl:for-each select="slvt:SLVTParametersList[1]">
										<SLVTParametersList>
											<xsl:for-each select="slvt:SLVTParameters[1]">
												<SLVTParameters>
													<xsl:for-each select="slvt:AntennaSize[1]">
														<AntennaSize>
															<xsl:value-of select="."/>
														</AntennaSize>
													</xsl:for-each>
													<xsl:for-each select="slvt:RadioPower[1]">
														<RadioPower>
															<xsl:value-of select="."/>
														</RadioPower>
													</xsl:for-each>
													<xsl:for-each select="slvt:Availability[1]">
														<Availability>
															<xsl:value-of select="."/>
														</Availability>
													</xsl:for-each>
												</SLVTParameters>
											</xsl:for-each>
										</SLVTParametersList>
									</xsl:for-each>
								</xsl:for-each>
							</TransportFeasibilityParameter>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				</TransportInformation>
			</UpgradeOrderRequest>
		</xsl:template>
	</xsl:stylesheet>

