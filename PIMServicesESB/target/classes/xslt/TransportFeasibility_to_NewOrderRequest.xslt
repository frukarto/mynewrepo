<?xml version="1.0" encoding="UTF-8"?>
<mapping version="4">
	<component name="defaultmap1" uid="67656504" blackbox="0" editable="1">
		<properties AppName="Mapping" JavaBasePackage="com.mapforce" SelectedLanguage="xslt" ShowAnnotations="1" ShowLibraryNameInHeader="0" ShowSchemaTypes="0" XSLTTargetEncoding="UTF-8"/>
		<structure>
			<children>
				<component name="document" library="xml" kind="1" uid="107227400">
					<properties TnsPrefix="tns1" XSLTDefaultOutput="0"/>
					<view ltx="0" lty="0" rbx="490" rby="496"/>
					<data>
						<root scrollposition="0">
							<header>
								<namespaces>
									<namespace uid="http://transportfeasibility.bits.hughes.com"/>
									<namespace uid="http://www.hns.com/iag/schemas/core"/>
								</namespaces>
							</header>
							<entry name="0:TransportFeasibilityResponseMsg" expanded="true">
								<entry name="0:TransportFeasibilityResponse" expanded="true">
									<entry name="0:Response" expanded="true"/>
									<entry name="0:TransportFeasibilityParameters" expanded="true" outkey="114887584">
										<entry name="0:AvailabilityFlag" outkey="114890176"/>
										<entry name="0:BusinessAvailabilityFlag" outkey="114890504"/>
										<entry name="0:SatellitedID" outkey="114890648"/>
										<entry name="0:BeamID" outkey="114890792"/>
										<entry name="0:Polarization" outkey="114890936"/>
										<entry name="0:Band" outkey="114891128"/>
										<entry name="0:MinODUPower" outkey="114891320"/>
										<entry name="0:MinAntennaSize" outkey="114891464"/>
										<entry name="0:TransportName" outkey="114891608"/>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="TransportFeasibility.xsd" inputinstance="" outputinstance="TransportFeasibility.xml" instanceroot="{http://transportfeasibility.bits.hughes.com}TransportFeasibilityResponseMsg"/>
					</data>
				</component>
				<component name="document" library="xml" kind="1" uid="108584328">
					<properties XSLTDefaultOutput="1"/>
					<view ltx="708" lty="24" rbx="1417" rby="569"/>
					<data>
						<root scrollposition="612">
							<header>
								<namespaces>
									<namespace uid="http://www.hns.com/iag/schemas/partner"/>
								</namespaces>
							</header>
							<entry name="0:NewOrderRequest" expanded="true">
								<entry name="0:TransportInformation" expanded="true">
									<entry name="0:TransportFeasibilityParameter" expanded="true" inpkey="114888424">
										<entry name="0:AvailabilityFlag" inpkey="114888536"/>
										<entry name="0:BusinessAvailabilityFlag" inpkey="114888752"/>
										<entry name="0:SatellitedID" inpkey="114888896"/>
										<entry name="0:BeamID" inpkey="114889080"/>
										<entry name="0:Polarization" inpkey="114889224"/>
										<entry name="0:Band" inpkey="114889368"/>
										<entry name="0:MinODUPower" inpkey="114889512"/>
										<entry name="0:MinAntennaSize" inpkey="114889680"/>
										<entry name="0:TransportName" inpkey="114889848"/>
										<entry name="0:SLVTParametersList">
											<entry name="0:SLVTParameters" expanded="true"/>
										</entry>
									</entry>
								</entry>
							</entry>
						</root>
						<document schema="pim.xsd" inputinstance="" outputinstance="pim.xml" instanceroot="{http://www.hns.com/iag/schemas/partner}NewOrderRequest"/>
					</data>
				</component>
			</children>
			<graph directed="1">
				<edges>
					<edge edgekey="114651184"/>
					<edge edgekey="114651360"/>
					<edge edgekey="114651904"/>
					<edge edgekey="114652136"/>
					<edge edgekey="114729200"/>
					<edge edgekey="114729592"/>
					<edge edgekey="114729944"/>
					<edge edgekey="114823752"/>
					<edge edgekey="114823984"/>
					<edge edgekey="114824256"/>
				</edges>
				<vertices>
					<vertex vertexkey="114887584">
						<edges>
							<edge vertexkey="114888424" edgekey="114651184"/>
						</edges>
					</vertex>
					<vertex vertexkey="114890176">
						<edges>
							<edge vertexkey="114888536" edgekey="114651904"/>
						</edges>
					</vertex>
					<vertex vertexkey="114890504">
						<edges>
							<edge vertexkey="114888752" edgekey="114651360"/>
						</edges>
					</vertex>
					<vertex vertexkey="114890648">
						<edges>
							<edge vertexkey="114888896" edgekey="114652136"/>
						</edges>
					</vertex>
					<vertex vertexkey="114890792">
						<edges>
							<edge vertexkey="114889080" edgekey="114729200"/>
						</edges>
					</vertex>
					<vertex vertexkey="114890936">
						<edges>
							<edge vertexkey="114889224" edgekey="114729592"/>
						</edges>
					</vertex>
					<vertex vertexkey="114891128">
						<edges>
							<edge vertexkey="114889368" edgekey="114729944"/>
						</edges>
					</vertex>
					<vertex vertexkey="114891320">
						<edges>
							<edge vertexkey="114889512" edgekey="114823752"/>
						</edges>
					</vertex>
					<vertex vertexkey="114891464">
						<edges>
							<edge vertexkey="114889680" edgekey="114824256"/>
						</edges>
					</vertex>
					<vertex vertexkey="114891608">
						<edges>
							<edge vertexkey="114889848" edgekey="114823984"/>
						</edges>
					</vertex>
				</vertices>
			</graph>
		</structure>
	</component>
</mapping>
