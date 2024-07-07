<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" />
  <xsl:template match="/">

    <html lang="it">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>
          <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']" /> - <xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']" />
        </title>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
      </head>