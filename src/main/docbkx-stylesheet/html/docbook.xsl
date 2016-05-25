<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [  <!ENTITY copy  "&#169;" >
<!-- copyright -->]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"   xmlns:d="http://docbook.org/ns/docbook"  xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"  xmlns:xslthl="http://xslthl.sf.net"  xmlns:gcse="http://www.google.com"  xmlns:date="http://exslt.org/dates-and-times">
  <!-- imports the original docbook stylesheet -->
  <xsl:import href="urn:docbkx:stylesheet"/>
  <!-- set bellow all your custom xsl configuration -->
  <xsl:import href="urn:docbkx:stylesheet/highlight.xsl"/>
  <xsl:param name="highlight.source" select="1"/>
  <!-- use the xml:id on the chapter and sections when rendering chunked output" -->
  <xsl:param name="use.id.as.filename" select="1"/>
  <!-- tweak the generation of toc generation -->
  <xsl:param name="generate.section.toc.level" select="1"/>
  <xsl:param name="chunk.section.depth" select="0"></xsl:param>
  <xsl:param name="toc.section.depth" select="1"/>
  <xsl:param name="generate.toc" select="'article  nop'"/>
  <!--    Important links:    - http://www.sagehill.net/docbookxsl/    - http://docbkx-tools.sourceforge.net/  -->
  <!-- This addresses the issue where 'the section called "foo"' is rendered when we really only want 'foo'       Note: we should still be able to use xrefstyle on xrefs -->
  <xsl:param name="local.l10n.xml" select="document('')"/>
  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
    <l:l10n language="en">
      <l:context name="xref">
        <l:template name="section" text="%t"/>
      </l:context>
      <l:context name="title">
        <l:template name="table" text=""/>
      </l:context>
    </l:l10n>
  </l:i18n>
  <xsl:template match="d:authorgroup" mode="titlepage.mode"/>
  <!-- squash the generation of title attributes -->
  <xsl:template name="generate.html.title"/>
  <!-- allow sections to be excluded from toc generation -->
  <xsl:template match="d:section[@role = 'NotInToc']" mode="toc" />
  <xsl:template name="body.attributes">
    <xsl:attribute name="id">body-solstice</xsl:attribute>
    <!--
    <xsl:attribute name="bgcolor">white</xsl:attribute>
    <xsl:attribute name="text">black</xsl:attribute>
    <xsl:attribute name="link">#0000FF</xsl:attribute>
    <xsl:attribute name="vlink">#840084</xsl:attribute>
    <xsl:attribute name="alink">#0000FF</xsl:attribute>
  -->
  </xsl:template>
  <xsl:param name="metadata" select="document('website-metadata.xml')"/>
  <!--  Head Content  -->
  <xsl:template name="user.head.content">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="author" content="jmcconnell"/>
    <meta name="keywords" content="Jetty, Servlets, Async, SPDY, Web Server, Web Client, Eclipse RT, Eclipse Runtime"/>
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,700,300,600,100" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="http://www.eclipse.org/eclipse.org-common/themes/solstice/public/images/favicon.ico"/>
    <title>Jetty - Servlet Engine and Http Server</title>
    <link rel="stylesheet" href="http://www.eclipse.org/eclipse.org-common/themes/solstice/public/stylesheets/styles.min.css"/>
    <meta property="og:description" content="Jetty is a highly scalable modular servlet engine and http server that natively supports many modern protocols like SPDY and WebSockets." />
    <meta property="og:image" content="https://www.eclipse.org/jetty/images/jetty-logo-80x22.png" />
    <meta property="og:title" content="Jetty - Servlet Engine and Http Server" />

    <link rel="stylesheet" type="text/css" href="/jetty/css/jetty.css"/>
    <link rel="stylesheet" type="text/css" href="/jetty/css/docbook.css"/>

    <!-- 
    uncomment when testing locally 
    -->
    <link rel="stylesheet" type="text/css" href="/jetty/css/styles.min.css"/>

  </xsl:template>
  <!-- 
  suppress the natural inclusion of docbook.css and do that manually in user.head.content
  -->
  <xsl:template name="head.content"/>
  
  <!--  Primary Eclipse Solstice Theme Header  -->
  <xsl:template name="user.header.navigation">
    <a class="sr-only" href="#content">Skip to main content</a>
    <div class="clearfix toolbar-container-wrapper">
      <div class="container">
        <div class="text-right toolbar-row row hidden-print">
          <div class="col-md-24 row-toolbar-col">
            <ul class="list-inline">
              <li>
                <a href="https://dev.eclipse.org/site_login/createaccount.php">
                  <i class="fa fa-user fa-fw">
                    </i> Create account</a>
                  </li>
                  <li>
                    <a href="https://dev.eclipse.org/site_login/?takemeback=https://www.eclipse.org/jetty/">
                      <i class="fa fa-sign-in fa-fw">
                        </i> Log in</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <header role="banner" id="header-wrapper">
              <div class="container">
                <div class="row" id="header-row">
                  <div class="hidden-xs col-sm-8 col-md-6 col-lg-5" id="header-left">
                    <div class="wrapper-logo-default">
                      <a href="https://www.eclipse.org/">
                        <img class="logo-eclipse-default img-responsive hidden-xs" alt="logo" src="http://www.eclipse.org/eclipse.org-common/themes/solstice/public/images/logo/eclipse-426x100.png"/>
                      </a>
                    </div>
                  </div>
                  <div class="col-sm-10 col-md-8 col-lg-5 hidden-print hidden-xs pull-right" id="header-right">
                    <!--<div id="custom-search-form" class="reset-box-sizing">
                    <script>   (function() {     var cx = '011805775785170369411:15ipmpflp-0';     var gcse = document.createElement('script');     gcse.type = 'text/javascript';     gcse.async = true;     gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +     '//cse.google.com/cse.js?cx=' + cx;     var s = document.getElementsByTagName('script')[0];     s.parentNode.insertBefore(gcse, s);   })();   </script>
                    <gcse:searchbox-only>
                    </gcse:searchbox-only>
                  </div>-->
                  <div id="btn-call-for-action">
                    <a href="https://www.eclipse.org/donate/" class="btn btn-huge btn-info">
                      <i class="fa fa-star">
                        </i> Donate</a>
                      </div>
                    </div>
                    <div class="col-sm-14 col-md-16 col-lg-19 reset" id="main-menu-wrapper">
                      <div class="navbar yamm" id="main-menu">
                        <div id="navbar-collapse-1" class="navbar-collapse collapse">
                          <ul class="nav navbar-nav">
                            <li class="visible-thin">
                              <a href="https://www.eclipse.org/downloads/" target="_self">Download</a>
                            </li>
                            <li>
                              <a href="https://www.eclipse.org/users/" target="_self">Getting Started</a>
                            </li>
                            <li>
                              <a href="https://www.eclipse.org/membership/" target="_self">Members</a>
                            </li>
                            <li>
                              <a href="https://www.eclipse.org/projects/" target="_self">Projects</a>
                            </li>
                            <li class="dropdown visible-xs">
                              <a href="#" data-toggle="dropdown" class="dropdown-toggle">Community <b class="caret">
                              </b>
                            </a>
                            <ul class="dropdown-menu">
                              <li>
                                <a href="http://marketplace.eclipse.org">Marketplace</a>
                              </li>
                              <li>
                                <a href="http://events.eclipse.org">Events</a>
                              </li>
                              <li>
                                <a href="http://www.planeteclipse.org/">Planet Eclipse</a>
                              </li>
                              <li>
                                <a href="https://www.eclipse.org/community/eclipse_newsletter/">Newsletter</a>
                              </li>
                              <li>
                                <a href="https://www.youtube.com/user/EclipseFdn">Videos</a>
                              </li>
                            </ul>
                          </li>
                          <li class="dropdown visible-xs">
                            <a href="#" data-toggle="dropdown" class="dropdown-toggle">Participate <b class="caret">
                            </b>
                          </a>
                          <ul class="dropdown-menu">
                            <li>
                              <a href="https://bugs.eclipse.org/bugs/">Report a Bug</a>
                            </li>
                            <li>
                              <a href="https://www.eclipse.org/forums/">Forums</a>
                            </li>
                            <li>
                              <a href="https://www.eclipse.org/mail/">Mailing Lists</a>
                            </li>
                            <li>
                              <a href="https://wiki.eclipse.org/">Wiki</a>
                            </li>
                            <li>
                              <a href="https://wiki.eclipse.org/IRC">IRC</a>
                            </li>
                            <li>
                              <a href="https://www.eclipse.org/contribute/">How to Contribute</a>
                            </li>
                          </ul>
                        </li>
                        <li class="dropdown visible-xs">
                          <a href="#" data-toggle="dropdown" class="dropdown-toggle">Working Groups <b class="caret">
                          </b>
                        </a>
                        <ul class="dropdown-menu">
                          <li>
                            <a href="http://wiki.eclipse.org/Auto_IWG">Automotive</a>
                          </li>
                          <li>
                            <a href="http://iot.eclipse.org">Internet of Things</a>
                          </li>
                          <li>
                            <a href="http://locationtech.org">LocationTech</a>
                          </li>
                          <li>
                            <a href="http://lts.eclipse.org">Long-Term Support</a>
                          </li>
                          <li>
                            <a href="http://polarsys.org">PolarSys</a>
                          </li>
                          <li>
                            <a href="http://science.eclipse.org">Science</a>
                          </li>
                          <li>
                            <a href="http://www.openmdm.org">OpenMDM</a>
                          </li>
                        </ul>
                      </li>
                      <!-- More -->
                      <li class="dropdown eclipse-more hidden-xs">
                        <a data-toggle="dropdown" class="dropdown-toggle">More<b class="caret">
                        </b>
                      </a>
                      <ul class="dropdown-menu">
                        <li>
                          <!-- Content container to add padding -->
                          <div class="yamm-content">
                            <div class="row">
                              <ul class="col-sm-8 list-unstyled">
                                <li>
                                  <p>
                                    <strong>Community</strong>
                                  </p>
                                </li>
                                <li>
                                  <a href="http://marketplace.eclipse.org">Marketplace</a>
                                </li>
                                <li>
                                  <a href="http://events.eclipse.org">Events</a>
                                </li>
                                <li>
                                  <a href="http://www.planeteclipse.org/">Planet Eclipse</a>
                                </li>
                                <li>
                                  <a href="https://www.eclipse.org/community/eclipse_newsletter/">Newsletter</a>
                                </li>
                                <li>
                                  <a href="https://www.youtube.com/user/EclipseFdn">Videos</a>
                                </li>
                              </ul>
                              <ul class="col-sm-8 list-unstyled">
                                <li>
                                  <p>
                                    <strong>Participate</strong>
                                  </p>
                                </li>
                                <li>
                                  <a href="https://bugs.eclipse.org/bugs/">Report a Bug</a>
                                </li>
                                <li>
                                  <a href="https://www.eclipse.org/forums/">Forums</a>
                                </li>
                                <li>
                                  <a href="https://www.eclipse.org/mail/">Mailing Lists</a>
                                </li>
                                <li>
                                  <a href="https://wiki.eclipse.org/">Wiki</a>
                                </li>
                                <li>
                                  <a href="https://wiki.eclipse.org/IRC">IRC</a>
                                </li>
                                <li>
                                  <a href="https://www.eclipse.org/contribute/">How to Contribute</a>
                                </li>
                              </ul>
                              <ul class="col-sm-8 list-unstyled">
                                <li>
                                  <p>
                                    <strong>Working Groups</strong>
                                  </p>
                                </li>
                                <li>
                                  <a href="http://wiki.eclipse.org/Auto_IWG">Automotive</a>
                                </li>
                                <li>
                                  <a href="http://iot.eclipse.org">Internet of Things</a>
                                </li>
                                <li>
                                  <a href="http://locationtech.org">LocationTech</a>
                                </li>
                                <li>
                                  <a href="http://lts.eclipse.org">Long-Term Support</a>
                                </li>
                                <li>
                                  <a href="http://polarsys.org">PolarSys</a>
                                </li>
                                <li>
                                  <a href="http://science.eclipse.org">Science</a>
                                </li>
                                <li>
                                  <a href="http://www.openmdm.org">OpenMDM</a>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </div>
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar">
                    </span>
                    <span class="icon-bar">
                    </span>
                    <span class="icon-bar">
                    </span>
                    <span class="icon-bar">
                    </span>
                  </button>
                  <div class="wrapper-logo-mobile">
                    <a class="navbar-brand visible-xs" href="https://www.eclipse.org/">
                      <img class="logo-eclipse-default-mobile img-responsive" alt="logo" src="https://www.eclipse.org/eclipse.org-common/themes/solstice/public/images/logo/eclipse-800x188.png"/>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>
      <section class="hidden-print default-breadcrumbs" id="breadcrumb">
        <div class="container">
          <h3 class="sr-only">Breadcrumbs</h3>
          <div class="col-xs-24">
            <ol class="breadcrumb">
              <li>
                <a href="https://www.eclipse.org/">Home</a>
              </li>
              <li>
                <a href="https://www.eclipse.org/projects/">Projects</a>
              </li>
              <li>
                <a href="https://www.eclipse.org/jetty">jetty</a>
              </li>
            </ol>
          </div>
        </div>
      </section>
    </xsl:template>
    <!--    Jetty Left Column Content    -->
    <xsl:template name="user.header.content">
      <aside id="leftcol" class="col-md-4">
        <ul id="leftnav" class="ul-left-nav fa-ul hidden-print">
          <xsl:for-each select="$metadata/website-metadata/left-column/*">
            <xsl:choose>
              <xsl:when test="local-name(.) = 'link'">
                <li>
                  <i class="fa fa-angle-double-right orange fa-fw"/>
                  <xsl:element name="a">
                    <xsl:attribute name="href">
                      <xsl:value-of select="url"/>
                    </xsl:attribute>
                    <xsl:attribute name="target">_self</xsl:attribute>
                    <xsl:value-of select="title"/>
                  </xsl:element>
                </li>
              </xsl:when>
              <xsl:when test="local-name(.) = 'separator'">
                <li class="separator">
                  <xsl:choose>
                    <xsl:when test="url">
                      <xsl:element name="a">
                        <xsl:attribute name="class">separator</xsl:attribute>
                        <xsl:attribute name="href"><xsl:value-of select="url"/></xsl:attribute>
                        <xsl:value-of select="title"/>
                      </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="title"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </li>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </ul>
      </aside>
    </xsl:template>
    <!--    Jetty Main Column Content (Actually everything for the page layout, but this is how the main column is wired up)    -->
    <xsl:template name="chunk-element-content">
      <xsl:param name="prev"/>
      <xsl:param name="next"/>
      <xsl:param name="nav.context"/>
      <xsl:param name="content">
        <xsl:apply-imports/>
      </xsl:param>
      <xsl:call-template name="user.preroot"/>
      <html>
        <xsl:call-template name="html.head">
          <xsl:with-param name="prev" select="$prev"/>
          <xsl:with-param name="next" select="$next"/>
        </xsl:call-template>
        <body>
          <xsl:call-template name="body.attributes"/>
          <xsl:call-template name="user.header.navigation"/>
        <main class="no-promo">
          <div class="novaContent container" id="novaContent">
            <xsl:call-template name="user.header.content"/>
            <div id="maincontent">
              <div id="midcolumn">
                <center>
                  <img src="/jetty/images/jetty-logo-80x22.png"/>
                </center>
                <!--<xsl:copy-of select="$content"/>-->
                <xsl:apply-templates/>
              </div>
            </div>
            <xsl:call-template name="user.footer.content"/>
          </div>
        </main>
      <footer role="contentinfo" id="solstice-footer">
        <xsl:call-template name="user.footer.navigation"/>
      </footer>
    </body>
  </html>
  <xsl:value-of select="$chunk.append"/>
</xsl:template>
<!--    Jetty Right Column Content    -->
<xsl:template name="user.footer.content">
  <div id="rightcolumn">
    <div class="sideitem">
      <h6>Quick Links</h6>
      <ul>
        <xsl:for-each select="$metadata/website-metadata/right-column/*">
          <xsl:choose>
            <xsl:when test="local-name(.) = 'link'">
              <li>
                <xsl:element name="a">
                  <xsl:attribute name="href">
                    <xsl:value-of select="url"/>
                  </xsl:attribute>
                  <xsl:attribute name="target">_self</xsl:attribute>
                  <xsl:value-of select="title"/>
                </xsl:element>
              </li>
            </xsl:when>
            <xsl:when test="local-name(.) = 'separator'">
              <li class="separator">
                <a class="separator">
                  <xsl:value-of select="title"/>
                </a>
              </li>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </ul>
    </div>
    <div class="sideitem">
      <h6>Active Contributors</h6>
      <xsl:for-each select="$metadata/website-metadata/contributors/*">
        <div style="position: relative; height: 50px;">
          <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="url"/>
            </xsl:attribute>
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="title"/>
            </xsl:attribute>
            <xsl:element name="img">
              <xsl:attribute name="alt">
                <xsl:value-of select="title"/>
              </xsl:attribute>
              <xsl:attribute name="src">
                <xsl:value-of select="image"/>
              </xsl:attribute>
              <xsl:attribute name="style">position: absolute; left: 10px; top: 10px; width: 150px; height: auto;</xsl:attribute>
            </xsl:element>
          </xsl:element>
        </div>
      </xsl:for-each>
    </div>
  </div>
</xsl:template>
<!--      Eclipse Solstice Footer Content      -->
<xsl:template name="user.footer.navigation">
  <div class="container">
    <div class="row">
      <section class="col-sm-offset-1 col-xs-11 col-sm-7 col-md-6 col-md-offset-0 hidden-print" id="footer-eclipse-foundation">
        <h2 class="section-title">Eclipse Foundation</h2>
        <ul class="nav">
          <li>
            <a href="https://www.eclipse.org/org/">About us</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/org/foundation/contact.php">Contact Us</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/donate">Donate</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/org/documents/">Governance</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/artwork/">Logo and Artwork</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/org/foundation/directors.php">Board of Directors</a>
          </li>
        </ul>
      </section>
      <section class="col-sm-offset-1 col-xs-11 col-sm-7 col-md-6 col-md-offset-0 hidden-print" id="footer-legal">
        <h2 class="section-title">Legal</h2>
        <ul class="nav">
          <li>
            <a href="https://www.eclipse.org/legal/privacy.php">Privacy Policy</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/legal/termsofuse.php">Terms of Use</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/legal/copyright.php">Copyright Agent</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/org/documents/epl-v10.php">Eclipse Public License </a>
          </li>
          <li>
            <a href="https://www.eclipse.org/legal/">Legal Resources </a>
          </li>
        </ul>
      </section>
      <section class="col-sm-offset-1 col-xs-11 col-sm-7 col-md-6 col-md-offset-0 hidden-print" id="footer-useful-links">
        <h2 class="section-title">Useful Links</h2>
        <ul class="nav">
          <li>
            <a href="https://bugs.eclipse.org/bugs/">Report a Bug</a>
          </li>
          <li>
            <a href="//help.eclipse.org/">Documentation</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/contribute/">How to Contribute</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/mail/">Mailing Lists</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/forums/">Forums</a>
          </li>
          <li>
            <a href="//marketplace.eclipse.org">Marketplace</a>
          </li>
        </ul>
      </section>
      <section class="col-sm-offset-1 col-xs-11 col-sm-7 col-md-6 col-md-offset-0 hidden-print" id="footer-other">
        <h2 class="section-title">Other</h2>
        <ul class="nav">
          <li>
            <a href="https://www.eclipse.org/ide/">IDE and Tools</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/projects">Community of Projects</a>
          </li>
          <li>
            <a href="https://www.eclipse.org/org/workinggroups/">Working Groups</a>
          </li>
        </ul>
        <ul class="list-inline social-media">
          <li>
            <a href="https://twitter.com/EclipseFdn">
              <i class="fa fa-twitter-square">
              </i>
            </a>
          </li>
          <li>
            <a href="https://plus.google.com/+Eclipse">
              <i class="fa fa-google-plus-square">
              </i>
            </a>
          </li>
          <li>
            <a href="https://www.facebook.com/eclipse.org">
              <i class="fa fa-facebook-square">
              </i>
            </a>
          </li>
          <li>
            <a href="https://www.youtube.com/user/EclipseFdn">
              <i class="fa fa-youtube-square">
              </i>
            </a>
          </li>
        </ul>
      </section>
      <div id="copyright" class="col-sm-offset-1 col-sm-14 col-md-24 col-md-offset-0">
        <span class="hidden-print">
          <div class="wrapper-logo-eclipse-white">
            <a href="https://www.eclipse.org">
              <img class="logo-eclipse-white img-responsive" alt="logo" src="http://www.eclipse.org/eclipse.org-common/themes/solstice/public/images/logo/eclipse-logo-bw-332x78.png"/>
            </a>
          </div>
        </span>
        <p id="copyright-text">Copyright &#169; 2016 The Eclipse Foundation. All Rights Reserved.</p>
      </div>
      <a href="#" class="scrollup">Back to the top</a>
    </div>
  </div>
</xsl:template>
<xsl:template name="navig.content">
</xsl:template>
<xsl:template name="header.navigation">
</xsl:template>
</xsl:stylesheet>
