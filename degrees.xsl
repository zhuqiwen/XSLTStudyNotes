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
            <meta name="description" content="New Media Developer Code Challenge Two" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        </head>
        <body>

            <div class="container">
                <div>
                    <h1>New Media Developer Code Challenge Two</h1>
                </div>

                <hr />
                <div class="row">

                    <div class="col-md-4">
                        <ul id="ul-float-tabs" class="nav nav-pills nav-stacked affix">
                            <xsl:for-each select="//degree[generate-id()=generate-id(key('school', @school)[1])]">

                                <xsl:sort case-order="lower-first" select="@school"/>
                                <!--<xsl:value-of select="count(key('school', .))"/>-->
                                <xsl:variable name="tab_id" select="position()"/>

                                <xsl:choose>
                                    <xsl:when test="position()=1">
                                        <li class="active"><a data-toggle="pill" href="#{$tab_id}">Unkown</a></li>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <li><a data-toggle="pill" href="#{$tab_id}"><xsl:value-of select="@school"/></a></li>
                                    </xsl:otherwise>
                                </xsl:choose>

                            </xsl:for-each>
                        </ul>

                    </div>
                    <div class="col-md-8">
                        <div class="tab-content">
                            <xsl:for-each select="//degree[generate-id()=generate-id(key('school', @school)[1])]">
                                <xsl:sort case-order="lower-first" select="@school"/>
                                <xsl:variable name="content_id" select="position()"/>
                                <xsl:choose>
                                    <xsl:when test="$content_id=1">
                                        <div id="{$content_id}" class="tab-pane fade in active">
                                            <h3>Unknown</h3>
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Program</th>
                                                        <th>Undergraduate</th>
                                                        <th>Master's</th>
                                                        <th>Doctoral</th>
                                                    </tr>
                                                </thead>
                                                <xsl:for-each select="key('school', @school)">
                                                    <tr>
                                                        <td><xsl:value-of select="@name"/></td>
                                                        <td><xsl:value-of select="@bp"/></td>
                                                        <td><xsl:value-of select="@mp"/></td>
                                                        <td><xsl:value-of select="@dp"/></td>
                                                    </tr>
                                                </xsl:for-each>
                                            </table>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div id="{$content_id}" class="tab-pane fade">
                                            <h3><xsl:value-of select="@school"/></h3>
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Program</th>
                                                        <th>Undergraduate</th>
                                                        <th>Master's</th>
                                                        <th>Doctoral</th>
                                                    </tr>
                                                </thead>
                                                <xsl:for-each select="key('school', @school)">
                                                    <tr>
                                                        <td><xsl:value-of select="@name"/></td>
                                                        <td><xsl:value-of select="@bp"/></td>
                                                        <td><xsl:value-of select="@mp"/></td>
                                                        <td><xsl:value-of select="@dp"/></td>
                                                    </tr>
                                                </xsl:for-each>
                                            </table>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </div>

                    </div>
                </div>
            </div>


        <!--<xsl:for-each select="//degree[generate-id()=generate-id(key('school', @school)[1])]">-->
            <!--<xsl:sort case-order="lower-first" select="@school"/>-->

            <!--<b>++++++++++++++++++++++++++++++:</b><br/>-->
            <!--<xsl:for-each select="key('school', @school)">-->
                <!--<xsl:text>&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;</xsl:text>|-->
                <!--<xsl:number format="1."/>-->
                <!--<xsl:value-of select="@name"/><br/>-->

            <!--</xsl:for-each>-->


        <!--</xsl:for-each>-->
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