<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
  <xsl:template match="/">

    <html lang="it">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>
          <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/> - <xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']"/>
        </title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
      </head>
      <body>
        <header>

        </header>
        <section id="title"> <!-- titolo -->
            <div>
                <h1>
                  <xsl:value-of select="//tei:titleStmt/tei:title[@type='main']"/>
                </h1>
                <h3>
                  <i>
                    <xsl:value-of select="//tei:titleStmt/tei:title[@type='sub']"/>
                  </i>
                </h3>
              </div>
        </section>
        <main>
            <section id="description">  <!-- descrizione-->
                <div class="row">
                    <xsl:apply-templates select="//tei:sourceDesc"/>
                  </div>
            </section>
            <section id="lettere"> <!-- visualizzazione delle due lettere -->
                <h2>Lettera 1 - </h2>
                <div id ="lettera1">

                </div>
                <div id="lettera2">

                </div>
            </section>
            <section id="persone">
                <xsl:apply-templates select="//tei:back/tei:listPerson"/>
            </section>
            <section id="luoghi">
                <xsl:apply-templates select="//tei:back/tei:listPlace"/>
            </section>
        </main>
      </body>