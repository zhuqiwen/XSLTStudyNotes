# xslt1.0 study notes


## Where to start? Let's just jump in to the river.
###What do I know before starting?
* XML is structured; XML is data source
* XSLT extracts data from XML, manipulates them, and present (\<xsl:output\>) them.

### Question 1: how to locate data?
By **data**, I mean:
* data as node value
```xml
<degree>
    <school>
        Master
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
