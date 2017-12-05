<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" />

    <xsl:key name="school" match="degree"
             use="@school"/>


    <xsl:template match="/">
        <html lang="en">
        <head>
            <meta charset="utf-8" />

            <title>The HTML5 Herald</title>
            <meta name="description" content="The HTML5 Herald" />
            <meta name="author" content="SitePoint" />

            <link rel="stylesheet" href="css/styles.css?v=1.0" />

            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

            <!-- jQuery library -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

            <!-- Latest compiled JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        </head>

        <body>

            <ul class="nav nav-pills">
                <xsl:for-each select="//degree[generate-id()=generate-id(key('school', @school)[1])]">
                    <xsl:sort case-order="lower-first" select="@school"/>
                    <li class="active"><a data-toggle="pill" href="#home"><xsl:value-of select="@school"/></a></li>

                    <b> <xsl:value-of select="@school"/>:</b><br/>
                </xsl:for-each>
            <li class="active"><a data-toggle="pill" href="#home">Home</a></li>
            <li><a data-toggle="pill" href="#menu1">Menu 1</a></li>
            <li><a data-toggle="pill" href="#menu2">Menu 2</a></li>
            </ul>

        <xsl:for-each select="//degree[generate-id()=generate-id(key('school', @school)[1])]">
            <xsl:sort case-order="lower-first" select="@school"/>

            <b>++++++++++++++++++++++++++++++:</b><br/>
            <xsl:for-each select="key('school', @school)">
                <xsl:text>--------</xsl:text>|
                <xsl:number format="1."/>
                <xsl:value-of select="@name"/><br/>

            </xsl:for-each>


        </xsl:for-each>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>



<!--<html lang="en">-->
<!--<head>-->
    <!--<meta charset="utf-8">-->

    <!--<title>The HTML5 Herald</title>-->
    <!--<meta name="description" content="The HTML5 Herald">-->
    <!--<meta name="author" content="SitePoint">-->

    <!--<link rel="stylesheet" href="css/styles.css?v=1.0">-->

    <!--&lt;!&ndash;[if lt IE 9]>-->
      <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>-->
    <!--<![endif]&ndash;&gt;-->
<!--</head>-->

<!--<body>-->
    <!--<script src="js/scripts.js"></script>-->
<!--</body>-->
<!--</html>-->


<!--<ul class="nav nav-pills">-->
<!--<li class="active"><a data-toggle="pill" href="#home">Home</a></li>-->
<!--<li><a data-toggle="pill" href="#menu1">Menu 1</a></li>-->
<!--<li><a data-toggle="pill" href="#menu2">Menu 2</a></li>-->
<!--</ul>-->

<!--<div class="tab-content">-->
<!--<div id="home" class="tab-pane fade in active">-->
    <!--<h3>HOME</h3>-->
    <!--<p>Some content.</p>-->
<!--</div>-->
<!--<div id="menu1" class="tab-pane fade">-->
    <!--<h3>Menu 1</h3>-->
    <!--<p>Some content in menu 1.</p>-->
<!--</div>-->
<!--<div id="menu2" class="tab-pane fade">-->
    <!--<h3>Menu 2</h3>-->
    <!--<p>Some content in menu 2.</p>-->
<!--</div>-->
<!--</div>-->