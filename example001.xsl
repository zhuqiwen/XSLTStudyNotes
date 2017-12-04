<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" />

    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="A">
        <b>
            <xsl:value-of select="name()"/>
            <xsl:value-of select="@id"/>
        </b>
    </xsl:template>

    <xsl:template match="B">
        <i>
            <xsl:value-of select="name()"/>
            <xsl:value-of select="@id"/>
        </i>
    </xsl:template>
</xsl:stylesheet>