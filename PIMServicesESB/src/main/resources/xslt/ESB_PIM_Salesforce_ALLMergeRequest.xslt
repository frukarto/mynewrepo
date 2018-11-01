<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" >
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<xsl:include href="./ESB_Salesforce_PIM_CreateCustomerRequest.xslt"/>
<xsl:include href="./ESB_PIM_Salesforce_ModifyCustomerRequest.xslt"/>
<xsl:include href="./ESB_PIM_Salesforce_ExistingCustomerOrderRequest.xslt"/>
<xsl:include href="./ESB_PIM_Salesforce_CancelOrderRequest.xslt"/>
<xsl:include href="./ESB_PIM_Salesforce_FAPTokenAllocateRequest.xslt"/>
<xsl:include href="./ESB_PIM_Salesforce_SearchCustomerRequest.xslt"/>
</xsl:stylesheet>
