# xslt1.0 study note
This note records my thinking process of how I solve this problem. 

Usually, I learn new things by just jumping into the river. 

I start by directly reading code of a new language. Then, after the hard feeling of getting lost often forces me to think about the big picture and to grab anything familiar. Once I grab something familiar, I try to start from there and to figure out where and how data is flowing.

This enables me to ask specific questions. Then I google it or read documentations to get answers.

Once I have one answer, I go back to the code and keep following the data. I will have new questions, and read doc or google it.

This process iterate several times until I have what I need to finish a task.


## Where to start? Let's just jump in to the river.
###What did I know before starting?
* XML is structured; XML is data source
* XSLT extracts data from XML, manipulates them, and present them.

Not much. But I am a fast learner. I usually learn new things by **asking right questions**.
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
xml
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
    * Don't be fooled by its name; it is IMMUTABLE.
    * But if defined inside for-each, it can be changed dynamically. **This would be very useful**
    * 2 ways to assign value to a variable
```xml
<xsl:variable name="ProgramName" select="'Accounting'">
```
This gives us a constant, when it is defined at the top level, called **ProgramName** with value of a string *Accounting*.
```xml
<xsl:variable name="ProgramName">Accounting</xsl:variable>
```
This does the same.

* param
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
    * It needs to be defined at the top level.
    * It pass data/value to the key() function; in other words, if no key() function is used, the key element declaration is meaningless.
    * It is often used to perform **group-by** operations
     
```xml
<!-- declare a key -->
<xsl:key name="program_school" match="degree" use="@school"/>

<!-- use it -->
<xsl:template match="degree">

        <xsl:value-of select="key('program_school', 'Kelley School of Business')"/>
</xsl:template>
```
####What we have learnt now?:

* How to hold data in variables (*variable*, *param*, and *key*)
* We *variable* element can be changed dynamically inside a for-each loop
* *key* is often used to group-by.
###Question 4: how to do group-by?
xml
```xml
<xsl:for-each select="//degree[generate-id()=generate-id(key('school', @school)[1])]"/>
```
This is the key, and it returns a 2-dimensional node-set like:
 * [[node-1-1, node-1-2, node-1-3,..],[node-2-1, node-2-2, node-2-3,...],[node-3-1, node-3-2, ...],...],
 
####How does it work?
First, *key('school', @school)* returns a set where its members share same value of attribute *school*

Then, *key('school', @school)[1]* returns the first node in the set.

Next, *generate-id()* on the right side gives a id shared by member of the same set.

Now, *degree[generate-id()=generate-id(....)]* picks out nodes with the same generated id.

**Last, an inner loop is needed to iterate the sub set.**

```xml
<xsl:for-each select="//degree[generate-id()=generate-id(key('school', @school)[1])]">
    <xsl:sort case-order="lower-first" select="@school"/>
    
        <b><xsl:value-of select="@school"/></b><br/>
            <xsl:for-each select="key('school', @school)">
                <xsl:text>--------</xsl:text>|
                <xsl:number format="1."/>
                <xsl:value-of select="@name"/><br/>
    </xsl:for-each>
</xsl:for-each>
```

Once we have this group-by structure, things get a lot easier.