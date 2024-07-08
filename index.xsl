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
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        <!-- <link href="style1.css" rel="stylesheet" type="text/css"/> -->
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
            <section id="lettere">
              <h2>Lettera 1</h2>
              <section class="row" id="lettera1">
                <figure class="visualizzatorefoto">
                  <!-- Da rivedere come si fa -->
                  <xsl:apply-templates select="(//tei:surface)[position() &lt;= 5]" />
                </figure>
                <div id="paginelettera1">
                  <xsl:for-each select="//tei:ab[position() &lt;= 4]">
                    <div id="pagina{position() + 1}" class="pagine">
                      <h1>PAGINA <xsl:value-of select="@n" /></h1>
                      <xsl:apply-templates select="." />
                    </div>
                  </xsl:for-each>
                </div>
                <a class="indietro">
                  <i class="indietro1"></i>
                </a>
                <a class="avanti">
                  <i class="avanti1"></i>
                </a>
              </section>
              <h2>Lettera 2</h2>
              <section class="row" id="lettera2">
                <figure class="visualizzatorefoto" >
                  <!-- da rivedere come si fa-->
                  <xsl:apply-templates select="//tei:surface[position() >= last() - 1]" />
                </figure>
                <div id="paginelettera2">
                  <xsl:for-each select="//tei:ab[position() >= last() - 1]">
                    <div id="pagina{position() + 172}" class="pagine">
                      <h1>PAGINA <xsl:value-of select="@n" /></h1>
                      <xsl:apply-templates select="." />
                    </div>
                  </xsl:for-each>
                </div>
                <a class="indietro" title="Vai alla pagina precedente">
                  <i class="indietro1"></i>
                </a>
                <a class="avanti" title="Vai alla pagina successiva">
                  <i class="avanti1"></i>
                </a>
              </section>
            </section>
            <h2>Chi? - Le persone e le organizzazioni citate</h2>
            <section id="persone">
              <xsl:for-each select="tei:person[not(@xml:id = 'AMDG' or @xml:id = 'LP' or @xml:id = 'FD')]">
                <xsl:element name="li">
                  <span class="persona">
                    <b>
                      <xsl:value-of select="tei:persName/tei:forename" />
                      <xsl:text> </xsl:text>
                      <xsl:value-of select="tei:persName/tei:surname" />
                    </b>
                    <xsl:if test="not(tei:persName/tei:forename) and not(tei:persName/tei:surname)">
                      <b><xsl:value-of select="tei:persName/tei:addName" /></b>
                    </xsl:if>
                    <xsl:if test="tei:persName/tei:forename and tei:persName/tei:addName">
                      (<xsl:value-of select="tei:persName/tei:addName" />)
                    </xsl:if>
                  </span>
                  </xsl:element>
                  </xsl:for-each>
            </section>
            <nav id="pulsanti">
              <button id="personeOrg">Persone e organizzazioni</button>
              <button id="luoghi">Luoghi</button>
              <button id="erroriCorr">Errori e correzioni</button>
              <button id="altro">Altro</button> <!-- quello che si vuole -->
            </nav>
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
    </html>
  </xsl:template>
  <!-- immagini delle lettere -->
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
     <!-- Footer -->
  <xsl:template match="tei:editionStmt">
    <h2>Riferimenti</h2>
    <h3>
      <xsl:value-of select="tei:edition" />
    </h3>
    <xsl:for-each select="tei:respStmt">
      <div>
        <b>
          <xsl:value-of select="tei:resp" />
        </b>
        <xsl:for-each select="tei:name">
          <p>
            <xsl:text> </xsl:text>
            <xsl:choose>
              <xsl:when test="position() = last()">
                <xsl:value-of select="." />
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat(., ' e ')" />
              </xsl:otherwise>
            </xsl:choose>
          </p>
        </xsl:for-each>
      </div>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>