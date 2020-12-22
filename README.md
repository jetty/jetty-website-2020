THIS REPO HAS BEEN ARCHIVED (see: https://bugs.eclipse.org/bugs/show_bug.cgi?id=569792 )

Final Location: http://eclipse.org/jetty

This is a maven build that leverages asciidoc to produce the static html required for the website.  
It transforms the adoc files into docbook and then a xslt stylesheet to generate the look and feel of the site.

Additionally it grabs published maven artifacts from the Jetty project containing documentation resources and places them appropriately.

The results of this process are then dumped into the jetty.git repository at the Eclipse Foundation to be published at the location above.

http://git.eclipse.org/c/www.eclipse.org/jetty.git/
