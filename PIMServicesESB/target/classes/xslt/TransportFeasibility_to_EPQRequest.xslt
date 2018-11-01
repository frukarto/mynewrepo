<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns1="http://transportfeasibility.bits.hughes.com" xmlns:core2="http://www.hns.com/iag/schemas/core" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:core="http://www.hns.com/iag/schemas/core" xmlns="http://www.hns.com/iag/schemas/partner" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" exclude-result-prefixes="tns1 core2 xs fn">
                <xsl:output method="xml" encoding="UTF-8" indent="yes"/>  
                <xsl:template match="tns1:TransportFeasibilityResponseMsg">
                        <EnhancedServicePrequalRequest>
                                <TransportInformation>
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
																
																
																<SLVTParametersList>
																	<SLVTParameters>
																	<AntennaSize>-1</AntennaSize>
																	<RadioPower>-1</RadioPower>
																	<Availability>false</Availability>
																	</SLVTParameters>
																	
																</SLVTParametersList>
																
															
                                                        </TransportFeasibilityParameter>
                                                </xsl:for-each>
                                        </xsl:for-each>
                                </TransportInformation>
                        </EnhancedServicePrequalRequest>
                </xsl:template>
        </xsl:stylesheet>
 
 
	

 