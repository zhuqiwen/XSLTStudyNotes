<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:variable name="pAuthor" select="'David Perry'"/>

    <xsl:key name="zipcode" match="address" use="zip"/>

    <xsl:template match="/">
        <xsl:for-each select="//address[generate-id(.)=generate-id(key('zipcode', zip)[1])]">
            <xsl:value-of select="zip"/>
            <xsl:for-each select="key('zipcode', zip)">
                haha
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>


</xsl:stylesheet>