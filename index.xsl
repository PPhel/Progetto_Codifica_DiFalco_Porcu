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
            <h2>Chi? - Le persone e le organizzazioni citate</h2>
            <section id="persone">
              <xsl:for-each select="tei:person[not(@xml:id = 'AMDG' or @xml:id = 'LP' or @xml:id = '')]">
                <xsl:element name="li">
                  <span class="persona">
                    <b>
                      <xsl:value-of select="tei:persName/tei:forename" />
                      <xsl:text> </xsl:text>
                      <xsl:value-of select="tei:persName/tei:surname" />
                    </b>
        
                    <!-- Se non è presente nome e cognome stampa solo il nome aggiuntivo -->
                    <xsl:if test="not(tei:persName/tei:forename) and not(tei:persName/tei:surname)">
                      <b><xsl:value-of select="tei:persName/tei:addName" /></b>
                    </xsl:if>
        
                    <!-- Se è presente il nome e l'addName stampa l'addName fra parentesi -->
                    <xsl:if test="tei:persName/tei:forename and tei:persName/tei:addName">
                      (<xsl:value-of select="tei:persName/tei:addName" />)
                    </xsl:if>
            </section>
            <h2>Dove? - I luoghi citati</h2>
            <section id="luoghi">
                <xsl:apply-templates select="//tei:back/tei:listPlace"/>
            </section>
            <h2>Varie informazioni sulle lettere</h2>
            <section id="informazioni">
              <p>Le lettere sono state prese dal portale archivistico online del <xsl:value-of select="//tei:publicationStmt/tei:publisher/tei:orgName"/></p>
              <p>Tipo di licenza dei documenti: <xsl:value-of select="//tei:publicationStmt/tei:availability"/></p>
              <p>Lingua delle lettere: <xsl:value-of select="//tei:textLang"/></p>
              <p>Storia: <xsl:value-of select="//tei:history/tei:origin" /></p>
              <p>Acquisizione: <xsl:value-of select="//tei:history/tei:acquisition" /></p>
              <p>Luogo: <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:settlement" />, <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:country" /></p>
              <p>Conservazione: <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:institution//tei:expan"/>, <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:collection" /></p>
              <p>Codice documento: <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:idno" /></p>
              <p>Supporto: <xsl:value-of select="//tei:objectDesc/tei:supportDesc/tei:support" /></p>
              <p>Numero di fogli: <xsl:value-of select="//tei:objectDesc/tei:supportDesc//tei:measure" /></p>
              <p>Caratteri: <xsl:value-of select="//tei:typeDesc" /></p>
              <p>Lunghezza: <xsl:value-of select="//tei:layoutDesc" /></p>
              <p>Scrittura: <xsl:value-of select="//tei:handDesc" /></p>
              <p>Condizioni: <xsl:value-of select="//tei:objectDesc/tei:supportDesc/tei:condition" /></p>
            </section>
        </main>
      </body>
  <!-- immagini delle lettere -->
  </xsl:template>
  <xsl:template match="tei:lb">
    <xsl:if test="@n != 1">
      <br />
    </xsl:if>
    <xsl:element name="span">
      <xsl:attribute name="id">
        <xsl:value-of select="@facs" />
      </xsl:attribute>
      <xsl:attribute name="class">Numero della riga</xsl:attribute>
      <xsl:value-of select="@n" />
    </xsl:element>
  </xsl:template>
  <xsl:template match="tei:surface">
    <xsl:element name="img">
      <xsl:attribute name="class">Immagine pagina lettera</xsl:attribute>
      <xsl:attribute name="title">Immagine pagina <xsl:value-of select="@xml:id" /></xsl:attribute>
      <xsl:attribute name="alt">Immagine pagina <xsl:value-of select="@xml:id" /></xsl:attribute>
      <xsl:attribute name="src">
        <xsl:apply-templates select="tei:graphic/@url" />
      </xsl:attribute>
      <xsl:attribute name="usemap">#<xsl:value-of select="@xml:id" /></xsl:attribute>
    </xsl:element>
    <xsl:element name="map">
      <xsl:attribute name="name">
        <xsl:value-of select="@xml:id" />
      </xsl:attribute>
      <xsl:for-each select="tei:zone">
        <xsl:element name="area">
          <xsl:attribute name="id">
            <xsl:value-of select="@xml:id" />
          </xsl:attribute>
          <xsl:attribute name="class">areaRiga</xsl:attribute>
          <xsl:attribute name="coords">
            <xsl:value-of select="@points" />
          </xsl:attribute>
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  <!-- pulsanti...da vedere-->
  <!-- footer...dove mettere noi e il prof e altro da vedere-->