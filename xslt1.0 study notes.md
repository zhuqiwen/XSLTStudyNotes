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

####OK, let's keep focus and go back on data. 
###Question 3: Can we hold data in variables?
YES. We can do this by 3 means (3 xsl elements):
* variable
* param
* key
####Question 3-1 What's the difference?

* variable
    * Don't be fooled by its name, it is IMMUTABLE. (A whole hour was spent trying to figure this out)
    * Only 2 way to assign value to a variable
```xml
<xsl:variable name="ProgramName" select="'Accounting'">
```
This gives you a constant called **ProgramName** with value of a string *Accounting*.
```xml
<xsl:variable name="ProgramName">Accounting</xsl:variable>
```
This also gives you a constant called **ProgramName** with value of a string *Accounting*.

* param
    * It can be changed.
    * It acts like function or method's argument in other programming languages.
```xml
<!-- define a function/method -->

<xsl:template name="addTitleToName">
   <xsl:param name="title">Dr.</xsl:param>
   <xsl:param name="person_name">some_name</xsl:param>
   Hello,
   <xsl:value-of select="$title" />
   <xsl:text> </xsl:text>
   <xsl:value-of select="$person_name" />
</xsl:template>

<!-- call it -->

<xsl:call-template name="addTitleToName">
    <xsl:with-param name="title" select="'Professor'"/>
    <xsl:with-param name="person_name" select="'Hopkins'"/>
</xsl:call-template>
```
The above is basically a XSL version of the following(in PHP):
```php
public function addTitleToName($title, $person_name):
{
    return 'Hello,' . $title . $person_name;
}

echo addTitleToName('Professor', 'Hopkins')
```

* key
    * It can be used to access the value of an attribute of a node
    * It pass data/value to the key() function; in other words, if no key() function is used, the key element declaration is meaningless.
     
```xml
<!-- declare a key -->
<xsl:key name="program_school" match="degree" use="@school"/>

<!-- use it -->
<xsl:template match="degree">

        <xsl:value-of select="key('program_school', 'Kelley School of Business')"/>
</xsl:template>

```
