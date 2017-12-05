<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" />

    <xsl:key name="key_school"
             match="degree"
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
                            <li><a data-toggle="pill" href="#guide"><h2>Guide &#60;--click me</h2></a></li>
                            <xsl:for-each select="//degree[generate-id()=generate-id(key('key_school', @school)[1])]">
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
                            <div id="guide" class="tab-pane fade">
                                <ul class="nav nav-tabs">
                                    <li><a data-toggle="tab" href="#solve">How did I solve this?</a></li>
                                    <li  class="active"><a data-toggle="tab" href="#readme">Readme</a></li>
                                </ul>

                                <div class="tab-content">
                                    <div id="solve" class="tab-pane fade">
                                        <iframe src="xslt1.0 study notes.html" frameborder="0" height="768" width="100%"></iframe>
                                    </div>
                                    <div id="readme" class="tab-pane fade  in active">
                                        <h4>This list can be filtered by:</h4>
                                        <ul>
                                            <li>School</li>
                                            <li>Academic level</li>
                                        </ul>

                                        <h4>Pills on th left side</h4>
                                        <p>By clicking <b>pills on left side</b>, user wil be guided to the access of all academic programs provided by the school.</p>
                                        <p>Some <b>list can be very long</b>. Thus the left side pills is intentionally <b>fixed in position</b>, so that user doesn't need to scroll all the way to the top to change pills/tabs</p>

                                        <h4>Academic level tabs</h4>
                                        <p>It's straight. For example, the <i>Doctoral</i> tab gives user all programs that provide doctoral level degree/certificate </p>
                                        <p>However, since some programs have no school information, the <b>Unknown</b> tab simply lists all program under this category without any further grouping.</p>
                                        <h4>Thanks and apology</h4>
                                        <p>First, I am sorry for the delayed submission of the XSLT challenge. I fully understand this should be submitted within 3 days since it was released. The delay is partly because I studied XSLT on the fly, as elaborated in the <b>How did I solve this?</b></p>
                                        <p>Then, I want to thank you again for this opportunity and the challenges. I think the tasks further revealed the job duties and abilities required for this position. By completing them, I am more confident of being a competitive candidate for the position. I really enjoy the process of completing these tasks, and I am more confident of being a competitive candidate for the position.</p>
                                        <p>Again, thank you for these and for your time. I am looking forward to meeting you again to further discuss the challenge, if in your mind, I did finish them not bad.</p>
                                        <p>Sincerely,</p>
                                        <p>Qiwen Zhu</p>

                                    </div>
                                </div>
                            </div>
                            <xsl:for-each select="//degree[generate-id()=generate-id(key('key_school', @school)[1])]">
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
                                                <xsl:for-each select="key('key_school', @school)">
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
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a data-toggle="tab" href="#bp{$content_id}">Undergraduate</a></li>
                                                <li><a data-toggle="tab" href="#mp{$content_id}">Master's</a></li>
                                                <li><a data-toggle="tab" href="#dp{$content_id}">Doctoral</a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="bp{$content_id}" class="tab-pane fade in active">
                                                    <table class="table table-striped table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Program</th>
                                                                <th>Undergraduate</th>
                                                                <th>Master's</th>
                                                                <th>Doctoral</th>
                                                            </tr>
                                                        </thead>
                                                        <xsl:for-each select="key('key_school', @school)">
                                                            <xsl:if test="@bp!=''">
                                                                <tr>
                                                                    <td><xsl:value-of select="@name"/></td>
                                                                    <td><xsl:value-of select="@bp"/></td>
                                                                    <td><xsl:value-of select="@mp"/></td>
                                                                    <td><xsl:value-of select="@dp"/></td>
                                                                </tr>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </table>
                                                </div>
                                                <div id="mp{$content_id}" class="tab-pane fade">
                                                    <table class="table table-striped table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Program</th>
                                                                <th>Undergraduate</th>
                                                                <th>Master's</th>
                                                                <th>Doctoral</th>
                                                            </tr>
                                                        </thead>
                                                        <xsl:for-each select="key('key_school', @school)">
                                                            <xsl:if test="@mp!=''">
                                                                <tr>
                                                                    <td><xsl:value-of select="@name"/></td>
                                                                    <td><xsl:value-of select="@bp"/></td>
                                                                    <td><xsl:value-of select="@mp"/></td>
                                                                    <td><xsl:value-of select="@dp"/></td>
                                                                </tr>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </table>
                                                </div>
                                                <div id="dp{$content_id}" class="tab-pane fade">
                                                    <table class="table table-striped table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Program</th>
                                                                <th>Undergraduate</th>
                                                                <th>Master's</th>
                                                                <th>Doctoral</th>
                                                            </tr>
                                                        </thead>
                                                        <xsl:for-each select="key('key_school', @school)">
                                                            <xsl:if test="@dp!=''">
                                                                <tr>
                                                                    <td><xsl:value-of select="@name"/></td>
                                                                    <td><xsl:value-of select="@bp"/></td>
                                                                    <td><xsl:value-of select="@mp"/></td>
                                                                    <td><xsl:value-of select="@dp"/></td>
                                                                </tr>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
            </div>
        </body>
        </html>
    </xsl:template>
    </xsl:stylesheet>