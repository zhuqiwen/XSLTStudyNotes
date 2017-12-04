# xslt1.0 study notes


## Where to start? Let's just jump in to the river.
###What do I know before starting?
* XML is structured; XML is data source
* XSLT extracts data from XML, manipulates them, and present them.

### Question 1: how to locate data?
By **data**, I mean:
* data as node value
```xml
<degree>
    <school>
        Kelly
    </school>
</degree>
```
* data as attribute value
```xml
<degree school="Kelley School of Business"/>
```

To get node value:
```xml
<xsl:template match="degree">
    <xsl:value-of select="school" />
</xsl:template>
```

to get attribute value:
```xml
<xsl:template match="degree">
    <xsl:value-of select="@school" />
</xsl:template>
```

### Wait, what is the \<xsl:template\> ? (Question 2)

```xml
<letters>

    <A id="1" like="yes">
        <apple id="a1"/>
        <assignment d="a2"/>
    </A>
    <A id="1" like="yes">
        <apple id="a1"/>
        <assignment d="a2"/>
    </A>
    <B id="2" like="no">
        <book id="b1"/>
        <basic id="b2"/>
    </B>
    <C id="3" like="no">
        <cat id="c1"/>
        <car id="c2"/>
    </C>
</letters>
```

XSL
```xml
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
```
This outputs:
**A1A1***B2*

Template defines what to do with a node of certain name; A and B are node names.
**select="name()"** returns the name of current node

No template is defined for \<C>. Thus, node C will not be displayed.

 
